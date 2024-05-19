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
    public partial class insertproduct : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("/index");
            }
        }
        protected void InsertData(object sender, EventArgs e)
        {
            string product_num = Request.Form["prod_num"];
            string product_name = Request.Form["prod_name"];
            string product_type = Request.Form["prod_type"];
            string price = Request.Form["prod_price"];
            string qty = Request.Form["qty"];
            string rack = Request.Form["rack_num"];
            string supplier = Request.Form["supp_id"];

            long prod_num = long.Parse(product_num);
            decimal unitPrice = decimal.Parse(price);
            int quantity = int.Parse(qty);
            int racknum = int.Parse(rack);
            int supplier_id = int.Parse(supplier);

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string insertQuery = @"EXEC SP_PRODUCT_INSERT
                                 @PRODUCT_NUMBER = @prod_num, 
                                 @RACK_NUM = @racknum,
                                 @SUPPLIER_ID = @supp_id,
                                 @PRODUCT_NAME = @prod_name,
                                 @PRODUCT_TYPE = @prod_type,
                                 @PRICE = @prod_price,
                                 @QUANTITY = @qty,
                                 @USERNAME = @session_name";

                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@prod_num", prod_num);
                        command.Parameters.AddWithValue("@racknum", racknum);
                        command.Parameters.AddWithValue("@supp_id", supplier_id);
                        command.Parameters.AddWithValue("@prod_name", product_name);
                        command.Parameters.AddWithValue("@prod_type", product_type);
                        command.Parameters.AddWithValue("@prod_price", unitPrice);
                        command.Parameters.AddWithValue("@qty", quantity);
                        command.Parameters.AddWithValue("@session_name", Session["username"].ToString());
                        int rowsAffected = command.ExecuteNonQuery();
                        if (!(rowsAffected > 0))
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('New product inserted');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product insertion failed!');", true);
                        }
                    }

                    connection.Close();
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }
    }
}