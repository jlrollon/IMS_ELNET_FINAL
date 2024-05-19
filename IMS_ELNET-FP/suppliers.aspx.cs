using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Reflection.Emit;
using System.Web.DynamicData;
using System.Xml.Linq;

namespace IMS_ELNET_FP
{
    public partial class suppliers : System.Web.UI.Page
    {

        private string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    BindGridView();
                }
                else
                {
                    Response.Redirect("/index");
                }
            }
        }

        private DataTable Query()
        {
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "EXEC SP_SUPPLIER_READ";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dataTable);
                    }
                }
            }

            return dataTable;
        }

        private void BindGridView()
        {
            DataTable dataSource = Query();

            if (dataSource != null && dataSource.Rows.Count > 0)
            {
                GridView1.DataSource = dataSource;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }


        protected void deleteSupplier(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string supp_id = btnDelete.CommandArgument;

            DeleteRowBySUPID(supp_id);
            BindGridView();
        }

        private void DeleteRowBySUPID(string supplier_id)
        {
            string query = "EXEC SP_SUPPLIER_DELETE @SUPPLIER_ID = @supp_id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@supp_id", supplier_id);
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    if(!(rowsAffected > 0))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Supplier is deleted!');", true);
                    }
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