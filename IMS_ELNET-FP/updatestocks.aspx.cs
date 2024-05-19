using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS_ELNET_FP
{
    public partial class updatestocks : System.Web.UI.Page
    {

        string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
        }

        protected void PopulateForm(string product_num)
        {
            string query = "SELECT PRODUCT_NUMBER, PRODUCT_NAME, PRODUCT_TYPE, PRICE, QUANTITY, RACK_NUM, SUPPLIER_ID FROM PRODUCTS WHERE PRODUCT_NUMBER = @prod_num";

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
                    prod_price.Text = string.Format("{0:F2}", reader["PRICE"]);
                    prod_qty.Text = reader["QUANTITY"].ToString();
                    prod_rack.Text = reader["RACK_NUM"].ToString();
                    prod_supp.Text = reader["SUPPLIER_ID"].ToString();
                }
            }
        }

        protected void updateStocks(object sender, EventArgs e)
        {
            long prod_number;
            long.TryParse(prod_num.Text, out prod_number);
            string product_name = prod_name.Text;
            string product_type = prod_type.Text;
            decimal price;
            int quantity, rackNo, supplier;
            decimal.TryParse(prod_price.Text, out price);
            int.TryParse(prod_qty.Text, out quantity);
            int.TryParse(prod_rack.Text, out rackNo);
            int.TryParse(prod_supp.Text, out supplier);
            
            try
            {
                string query = @"EXEC SP_PRODUCT_UPDATE
                                @PRODUCT_NUMBER = @prod_num, 
                                @RACK_NUM = @rack_num,
                                @SUPPLIER_ID = @supp_id, 
                                @PRODUCT_NAME = @prod_name,
                                @PRODUCT_TYPE = @prod_type, 
                                @PRICE = @prod_price, 
                                @QUANTITY = @qty,
                                @USERNAME = @session_name";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@prod_num", prod_number);
                    command.Parameters.AddWithValue("@rack_num", rackNo);
                    command.Parameters.AddWithValue("@supp_id", supplier);
                    command.Parameters.AddWithValue("@prod_name", product_name);
                    command.Parameters.AddWithValue("@prod_type", product_type);
                    command.Parameters.AddWithValue("@prod_price", price);
                    command.Parameters.AddWithValue("@qty", quantity);
                    command.Parameters.AddWithValue("@session_name", Session["username"]);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (!(rowsAffected > 0))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product updated successfully');", true);
                    }

                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{ex.Message}');", true);
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
