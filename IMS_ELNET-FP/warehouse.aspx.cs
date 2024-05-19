using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS_ELNET_FP
{
    public partial class warehouse : System.Web.UI.Page
    {
        protected string nodata { get; set; }

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

                string query = "EXEC SP_RACKS_READ";

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
                nodata = "No Data";
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