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
using System.Security.Cryptography.X509Certificates;

namespace IMS_ELNET_FP
{
    public partial class stocks : System.Web.UI.Page
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

                string query = "EXEC SP_PRODUCT_READ";

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

        protected void deleteProduct(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string prod_num = btnDelete.CommandArgument;

            DeleteRowByProd_num(prod_num);
            BindGridView();
        }

        private void DeleteRowByProd_num(string product_num)
        {
            string query = "EXEC SP_PRODUCT_DELETE @PRODUCT_NUMBER = @prod_num";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@prod_num", product_num);
                    connection.Open();
                    int rowsaffected = command.ExecuteNonQuery();
                    
                    if(!(rowsaffected > 0))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Successfully deleted!');", true);
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