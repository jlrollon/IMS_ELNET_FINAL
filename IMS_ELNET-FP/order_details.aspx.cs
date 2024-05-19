using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS_ELNET_FP
{
    public partial class order_details : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["ORDER_ID"]))
                    {
                        string order_id = Request.QueryString["ORDER_ID"];
                        OrderDetails(order_id);
                    }
                    else
                    {
                        Response.Redirect("/orders");
                    }
                }
                else
                {
                    Response.Redirect("/index");
                }
            }
        }

        protected void OrderDetails(string order_id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SP_ORDERDETAILS", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ORDER_ID", order_id);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Orderid.Text = reader["ORDER_ID"].ToString();
                            Orderstatus.Text = reader["ORDER_STATUS"].ToString();
                            Productname.Text = reader["PRODUCT_NAME"].ToString();
                            Price.Text = reader["PRICE"].ToString();
                            Quantity.Text = reader["QUANTITY"].ToString();
                            TotalPrice.Text = reader["TOTAL_PRICE"].ToString();
                            Personname.Text = reader["PERSONNEL_NAME"].ToString();
                            Personadd.Text = reader["PERSONNEL_ADDRESS"].ToString();
                            Personphone.Text = reader["PERSONNEL_PHONE"].ToString();
                            Personemail.Text = reader["PERSONNEL_EMAIL"].ToString();
                            Companyname.Text = reader["COMPANY_NAME"].ToString();
                            Suppadd.Text = reader["SUPPLIER_ADDRESS"].ToString();
                            Suppphone.Text = reader["SUPPLIER_PHONE"].ToString();
                            Suppemail.Text = reader["SUPPLIER_EMAIL"].ToString();
                        }
                    }
                    else
                    {
                        // Handle the case when no data is found
                        Orderid.Text = "No order details found.";
                    }
                }
                catch (Exception ex)
                {
                    Orderid.Text = "Error: " + ex.Message;
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        protected void logout(object sender, EventArgs e)
        {
            // Remove the session
            Session.Remove("username");
            Response.Redirect("/index");
        }
    }
}
