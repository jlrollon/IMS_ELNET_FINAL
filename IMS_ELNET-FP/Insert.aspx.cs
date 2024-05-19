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
    public partial class Insert : System.Web.UI.Page
    {
        protected void InsertData(object sender, EventArgs e)
        {

            string sku = Request.Form["sku"];
            string product = Request.Form["product"];
            string unit_price = Request.Form["unitprice"];
            string qty = Request.Form["quantity"];
            string rack = Request.Form["rack"];

            decimal unitPrice = decimal.Parse(unit_price);
            int quantity = int.Parse(qty);
            int racknum = int.Parse(rack);

            string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string insertQuery = "INSERT INTO PRODUCTS (SKU, PRODUCT_NAME, UNIT_PRICE, UNITS_IN_STOCK, RACK_NUM) VALUES (@SKU, @ProductName, @UnitPrice, @Quantity, @RackNum)";

                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@SKU", sku);
                        command.Parameters.AddWithValue("@ProductName", product);
                        command.Parameters.AddWithValue("@UnitPrice", unitPrice);
                        command.Parameters.AddWithValue("@Quantity", quantity);
                        command.Parameters.AddWithValue("@RackNum", racknum);

                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            addedAlert = "New Product Added";
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }
    }
}