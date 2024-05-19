using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS_ELNET_FP
{
    public partial class inventory : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();

                string query1 = "SELECT COUNT(*) AS totalLowStock FROM products WHERE (UNITS_IN_STOCK < 10 AND UNITS_IN_STOCK > 0)";
                string query2 = "SELECT COUNT(*) AS totalOutofStock FROM products WHERE (UNITS_IN_STOCK <= 0)";
                string query3 = @"SELECT TOP 1 P.PRODUCT_NAME AS mostprod FROM PRODUCTS P INNER JOIN
                                        ORDER_REQUEST_DETAILS ORD ON P.SKU = ORD.SKU
                                    GROUP BY
                                        P.PRODUCT_NAME
                                    ORDER BY
                                        COUNT(*) DESC";


                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command1 = new SqlCommand(query1, connection);
                    connection.Open();
                    SqlDataReader reader1 = command1.ExecuteReader();

                    if (reader1.Read())
                    {
                        int lowStock = Convert.ToInt32(reader1["totalLowStock"]);

                        lowstock.Text = lowStock.ToString();
                    }
                    connection.Close();
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command2 = new SqlCommand(query2, connection);
                    connection.Open();
                    SqlDataReader reader2 = command2.ExecuteReader();

                    if (reader2.Read())
                    {
                        int outofstock = Convert.ToInt32(reader2["totalOutofStock"]);

                        outstock.Text = outofstock.ToString();
                    }

                    connection.Close();
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command3 = new SqlCommand(query3, connection);
                    connection.Open();
                    SqlDataReader reader3 = command3.ExecuteReader();

                    if (reader3.Read())
                    {
                        string mostprod = reader3["mostprod"].ToString();
                        bsprod.Text = mostprod;
                    }

                    connection.Close();
                }
            }
        }

        private DataTable Query()
        {
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = @"SELECT P.SKU, P.PRODUCT_NAME, P.UNIT_PRICE,
                                    CASE
                                        WHEN P.UNITS_IN_STOCK > 0 AND P.UNITS_IN_STOCK <= 10 THEN 'Low in stock'
                                        WHEN P.UNITS_IN_STOCK <= 0 THEN 'Out of Stock'
                                        ELSE 'In Stock'
                                    END AS PRODUCTS_ACTIVITY
                                FROM PRODUCTS P
                                ORDER BY P.UNITS_IN_STOCK;";

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

    }
}