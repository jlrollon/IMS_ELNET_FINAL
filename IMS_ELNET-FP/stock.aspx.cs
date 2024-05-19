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

namespace IMS_ELNET_FP
{
    public partial class stock : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
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

            if (dataSource != null)
            {
                GridView1.DataSource = dataSource;
                GridView1.DataBind();
            }
            else
            {
                Console.WriteLine("Error");
            }
        }

        protected void btnDeleteColumn_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string sku = btnDelete.CommandArgument;

            DeleteRowBySKU(sku);

            BindGridView();
        }

        private void DeleteRowBySKU(string product_id)
        {
            string query = "DELETE FROM PRODUCTS WHERE PRODUCT_ID = @PRODUCT_ID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PRODUCT_ID", product_id);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}