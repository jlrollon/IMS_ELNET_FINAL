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
    public partial class updatepersonnel : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    // Check if SKU parameter is passed in URL
                    if (!string.IsNullOrEmpty(Request.QueryString["USERNAME"]))
                    {
                        string supplier_id = Request.QueryString["USERNAME"];
                        PopulateForm(supplier_id);
                    }
                }
                else
                {
                    Response.Redirect("/index");
                }
            }
        }

        protected void PopulateForm(string username)
        {
            string query = "SELECT PERSONNEL_ID, FIRSTNAME,LASTNAME,ADDRESS,PHONE,EMAIL,USERNAME FROM PERSONNEL WHERE USERNAME = @username";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", username);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    personnel_id.Text = reader["PERSONNEL_ID"].ToString();
                    firstname.Text = reader["FIRSTNAME"].ToString();
                    lastname.Text = reader["LASTNAME"].ToString();
                    address.Text = reader["ADDRESS"].ToString();
                    phone.Text = reader["PHONE"].ToString();
                    email.Text = reader["EMAIL"].ToString();
                    user.Text = reader["USERNAME"].ToString();
                }
            }
        }

        protected void updatePersonnel(object sender, EventArgs e)
        {
            string person_id = personnel_id.Text;
            int per_id;
            int.TryParse(person_id, out per_id);
            string Firstname = firstname.Text;
            string Lastname = lastname.Text;
            string add = address.Text;
            string ph = phone.Text;
            string eml = email.Text;
            string users = user.Text;
            string newpass = newPassword.Text;

            string query = @"EXEC SP_PERSONNEL_UPDATE
                           @PERSONNEL_ID = @per_id,
                           @FIRSTNAME = @firstname,
                           @LASTNAME = @lastname,
                           @ADDRESS = @address,
                           @PHONE = @phone,
                           @EMAIL = @email,
                           @USERNAME = @username,
                           @PASSWORD = @password";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@per_id", per_id);
                command.Parameters.AddWithValue("@firstname", Firstname);
                command.Parameters.AddWithValue("@lastname", Lastname);
                command.Parameters.AddWithValue("@address", add);
                command.Parameters.AddWithValue("@phone", ph);
                command.Parameters.AddWithValue("@email", eml);
                command.Parameters.AddWithValue("@username", users);
                command.Parameters.AddWithValue("@password", newpass);

                int rowsAffected = command.ExecuteNonQuery();

                if (!(rowsAffected > 0))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Personnel information updated successfully');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to update Personnel information');", true);
                }

                connection.Close();
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