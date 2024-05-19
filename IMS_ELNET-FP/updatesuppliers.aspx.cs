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
    public partial class updatesuppliers : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    // Check if SKU parameter is passed in URL
                    if (!string.IsNullOrEmpty(Request.QueryString["SUPPLIER_ID"]))
                    {
                        string supplier_id = Request.QueryString["SUPPLIER_ID"];
                        // Populate the form with data based on SKU
                        PopulateForm(supplier_id);
                    }
                }
                else
                {
                    Response.Redirect("/index");
                }
            }
        }

        protected void PopulateForm(string sup_id)
        {
            string query = "SELECT SUPPLIER_ID, COMPANY_NAME,ADDRESS,PHONE,EMAIL,OTHER_DETAILS FROM SUPPLIERS WHERE SUPPLIER_ID = @supplier_id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@supplier_id", sup_id);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    supp_id.Text = reader["SUPPLIER_ID"].ToString();
                    comp_name.Text = reader["company_name"].ToString();
                    address.Text = reader["address"].ToString();
                    phone.Text = reader["phone"].ToString();
                    email.Text = reader["email"].ToString();
                    others.Text = reader["other_details"].ToString();
                }
            }
        }

        protected void updateSupplier(object sender, EventArgs e)
        {
            string supplier_id = supp_id.Text;
            int supplier;
            int.TryParse(supplier_id, out supplier);
            string company_name = comp_name.Text; 
            string add = address.Text; 
            string ph = phone.Text; 
            string eml = email.Text; 
            string other_details = others.Text; 

            string query = @"EXEC SP_SUPPLIER_UPDATE
                           @SUPPLIER_ID = @supp_id,
                           @COMPANY_NAME = @comp_name,
                           @ADDRESS = @address,
                           @PHONE = @phone,
                           @EMAIL = @email,
                           @OTHER_DETAILS = @others";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@supp_id", supplier);
                command.Parameters.AddWithValue("@comp_name", company_name);
                command.Parameters.AddWithValue("@address", add);
                command.Parameters.AddWithValue("@phone", ph);
                command.Parameters.AddWithValue("@email", eml);
                command.Parameters.AddWithValue("@others", other_details);

                int rowsAffected = command.ExecuteNonQuery();

                if (!(rowsAffected > 0))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Supplier information updated successfully');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to update supplier information');", true);
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