using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS_ELNET_FP
{
    public partial class createorder : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("/index");
            }
            if (!string.IsNullOrEmpty(Request.QueryString["PRODUCT_NUMBER"]))
            {
                string product_num = Request.QueryString["PRODUCT_NUMBER"];
                PopulateForm(product_num);
            }
        }
        protected void PopulateForm(string product_num)
        {
            string query = "SELECT PRODUCT_NUMBER, PRODUCT_NAME, PRODUCT_TYPE FROM PRODUCTS WHERE PRODUCT_NUMBER = @prod_num";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@prod_num", product_num);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    prod_num.Text = reader["PRODUCT_NUMBER"].ToString();
                    prod_name.Text = reader["PRODUCT_NAME"].ToString();
                    prod_type.Text = reader["PRODUCT_TYPE"].ToString();
                }
            }
        }
        protected void InsertData(object sender, EventArgs e)
        {
            long prod_number;
            int quantity;
            string product_name = prod_name.Text;
            string product_type = prod_type.Text;
            string qty = Request.Form["qty"];

            if (long.TryParse(prod_num.Text, out prod_number) && int.TryParse(qty, out quantity))
            {
                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string insertQuery = @"EXEC SP_ORDERREQUESTDETAILS_INSERT
	                                         @PRODUCT_NUMBER = @prod_num,
                                             @PRODUCT_NAME = @prod_name,
                                             @PRODUCT_TYPE = @prod_type,
	                                         @QUANTITY = @qty,
                                             @USERNAME = @session_name";

                        using (SqlCommand command = new SqlCommand(insertQuery, connection))
                        {
                            command.Parameters.AddWithValue("@prod_num", prod_number);
                            command.Parameters.AddWithValue("@prod_name", product_name);
                            command.Parameters.AddWithValue("@prod_type", product_type);
                            command.Parameters.AddWithValue("@qty", quantity);
                            command.Parameters.AddWithValue("@session_name", Session["username"].ToString());

                            int rowsAffected = command.ExecuteNonQuery();
                            if (!(rowsAffected > 0))
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Order is successful');", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('New order is failed!');", true);
                            }
                        }
                    }
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
            else
            {
                Console.Write("Error");
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