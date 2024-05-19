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
    public partial class insert_supplier : System.Web.UI.Page
    {
        protected string addedAlert { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("/index");
            }
        }
        protected void InsertData(object sender, EventArgs e)
        {

            string company_name = Request.Form["comp_name"];
            string address = Request.Form["address"];
            string phone = Request.Form["phone"];
            string email = Request.Form["email"];
            string other_details = Request.Form["others"];

            string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string insertQuery = @"EXEC SP_SUPPLIER_INSERT
                                         @COMPANY_NAME = @comp_name, 
                                         @ADDRESS = @address,
                                         @PHONE = @phone,
                                         @EMAIL = @email,
                                         @OTHER_DETAILS = @others";

                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@comp_name", company_name);
                        command.Parameters.AddWithValue("@address", address);
                        command.Parameters.AddWithValue("@phone", phone);
                        command.Parameters.AddWithValue("@email", email);
                        command.Parameters.AddWithValue("@others", other_details);

                        int rowsAffected = command.ExecuteNonQuery();
                        if (!(rowsAffected > 0))
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('New Supplier Added!');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: Supplier is not inserted!');", true);
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error: " + ex.Message);
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