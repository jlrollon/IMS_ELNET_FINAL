using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS_ELNET_FP
{
    public partial class orders : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;
        private int PageSize = 13;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    Session["PageIndex"] = 0;
                    BindOrders((int)Session["PageIndex"], PageSize);

                    // Check if ORDER_ID parameter is passed in URL
                    if (!string.IsNullOrEmpty(Request.QueryString["ORDER_ID"]))
                    {
                        string order_id = Request.QueryString["ORDER_ID"];
                        string status = Request.QueryString["STATUS"];
                        updateOrderStatus(order_id, status);
                    }
                }
                else
                {
                    Response.Redirect("/index");
                }
            }
        }

        private void BindOrders(int pageIndex, int pageSize)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC SP_ORDERS_READ", connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    PagedDataSource pds = new PagedDataSource
                    {
                        DataSource = dt.DefaultView,
                        AllowPaging = true,
                        PageSize = pageSize,
                        CurrentPageIndex = pageIndex
                    };

                    OrdersRepeater.DataSource = pds;
                    OrdersRepeater.DataBind();

                    lnkPrev.Enabled = !pds.IsFirstPage;
                    lnkNext.Enabled = !pds.IsLastPage;
                    lblPage.Text = $"Showing {pageIndex + 1} to {pds.PageCount} entries";
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }

        protected void updateOrderStatus(string order_id, string status)
        {
            if (int.TryParse(order_id, out int ord_id))
            {
                string query = @"EXEC SP_ORDERS_UPDATE @ORDER_ID = @ord_id, @ORDER_STATUS = @ord_stat";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@ord_id", ord_id);
                        command.Parameters.AddWithValue("@ord_stat", status);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected <= 0)
                        {
                            Response.Redirect("/orders");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to update orders');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Error: " + ex.Message);
                    }
                }
            }
        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            int pageIndex = (int)Session["PageIndex"];
            pageIndex--;
            Session["PageIndex"] = pageIndex;
            BindOrders(pageIndex, PageSize);
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            int pageIndex = (int)Session["PageIndex"];
            pageIndex++;
            Session["PageIndex"] = pageIndex;
            BindOrders(pageIndex, PageSize);
        }

        protected string GetOrderStatusColorStyle(object orderStatus)
        {
            string status = orderStatus?.ToString();
            string color = "black";

            switch (status)
            {
                case "Pending":
                    color = "orange";
                    break;
                case "Cancelled":
                    color = "red";
                    break;
                case "Completed":
                    color = "green";
                    break;
                default:
                    break;
            }

            return $"background-color: {color}; width: 7px; height: 7px; display: inline-block; border-radius: 50%;";
        }

        protected void logout(object sender, EventArgs e)
        {
            // Remove the session
            Session.Remove("username");
            Response.Redirect("/index");
        }
    }
}
