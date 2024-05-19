using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS_ELNET_FP
{
    public partial class index : System.Web.UI.Page
    {
        protected string errorMsg { get; set; }

        private string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;
        protected void renderDashboard(object sender, EventArgs e)
        {
            string username = Request.Form["username"];
            string password = Request.Form["password"];

            if (ValidateUser(username, password))
            {
                Session["username"] = username;
                Response.Redirect("/dashboard");
            }
            else
            {
                Session.Remove("username");
                errorMsg = "Invalid credentials!";
            }
        }

        private bool ValidateUser(string username, string password)
        {
            string query = "EXEC SP_PERSONNEL_LOGIN @USERNAME = @username, @PASSWORD = @password";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@password", password);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
    }
}