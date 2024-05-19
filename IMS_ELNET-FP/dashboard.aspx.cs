using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS_ELNET_FP
{
    public partial class dashboard : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DB_IMS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    BindGridViews();
                    SalesSummary();
                    TodaysReport();
                    Personnels();
                    PersonnelFirstname();
                    DashboardInventory();

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            connection.Open();

                            // Retrieve total products
                            TotalProducts.Text = ExecuteScalarQuery(connection, "EXEC SP_TOTALPRODUCTS").ToString();

                            // Retrieve total price
                            TotalPrice.Text = ExecuteScalarQuery(connection, "EXEC SP_TOTALPRODUCTPRICE")?.ToString() ?? "0";

                            // Retrieve total completed orders
                            TotalCompleted.Text = ExecuteScalarQuery(connection, "EXEC SP_TOTALCOMPLETEDORDERS").ToString();

                            // Retrieve total cancelled orders
                            TotalCancelled.Text = ExecuteScalarQuery(connection, "EXEC SP_TOTALCANCELLEDORDERS").ToString();

                            // Retrieve total suppliers
                            TotalSuppliers.Text = ExecuteScalarQuery(connection, "EXEC SP_TOTALSUPPLIERS").ToString();

                            TotalAvailableStocks.Text = ExecuteScalarQuery(connection, "SELECT COUNT(QUANTITY) AS TotalAvailable FROM PRODUCTS WHERE QUANTITY != 0").ToString();

                            // Retrieve total personnel
                            TotalPersonnel.Text = ExecuteScalarQuery(connection, "EXEC SP_TOTALPERSONNEL").ToString();

                            Currentday.Text = ExecuteScalarQuery(connection, "SELECT DATENAME(Month, GETDATE()) + ' ' + CAST(YEAR(GETDATE()) AS VARCHAR(4)) AS CURRENTMONTHYEAR").ToString();

                            // Retrieve current month and year
                            CurrentDate.Text = ExecuteScalarQuery(connection, "SELECT DATENAME(Month, GETDATE()) + ' ' + CAST(YEAR(GETDATE()) AS VARCHAR(4)) AS CURRENTMONTHYEAR").ToString();
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine( "An error occurred: " + ex.Message);
                        }
                        finally
                        {
                            connection.Close(); // Close the connection in the finally block to ensure it's always closed
                        }
                    }
                }
                else
                {
                    Response.Redirect("/index");
                    Response.Write("<script>alert('Loggin Properly!')</script>");
                }
            }
        }

        private object ExecuteScalarQuery(SqlConnection connection, string query)
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                return command.ExecuteScalar();
            }
        }

        protected void SalesSummary()
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SP_SALESSUMMARY", connection);
                command.CommandType = CommandType.StoredProcedure;

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        string received = reader["STATUS_RECEIVED"].ToString();
                        string delivered = reader["STATUS_DELIVERED"].ToString();
                        string monthlySales = reader["MONTHLY_SALES"].ToString();
                        string averagegrowth = reader["AVERAGE_GROWTH"].ToString();

                        Received.Text = received;
                        Delivered.Text = delivered;
                        Monthlysales.Text = monthlySales;
                        Averagegrowth.Text = averagegrowth;
                    }
                }
                catch (Exception ex)
                {
                    Received.Text = "Error: " + ex.Message;
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        protected void TodaysReport()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SP_TODAYSREPORT", connection);
                command.CommandType = CommandType.StoredProcedure;

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        string delivered = reader["TODAYS_DELIVERED"].ToString();
                        string sales = reader["TODAY_SALES"].ToString();

                        todaysDelivered.Text = delivered;
                        todaysSales.Text = sales;
                    }
                }
                catch (Exception ex)
                {
                    Received.Text = "Error: " + ex.Message;
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        protected void DashboardInventory()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SP_DASHBOARDINVENTORY", connection);
                command.CommandType = CommandType.StoredProcedure;

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        string outofstock = reader["OUT_OF_STOCKS"].ToString();
                        string lowinstock = reader["LOW_IN_STOCKS"].ToString();

                        Outofstocks.Text = outofstock;
                        Lowinstocks.Text = lowinstock;
                    }
                }
                catch (Exception ex)
                {
                    Received.Text = "Error: " + ex.Message;
                }
                finally
                {
                    connection.Close();
                }
            }
        }


        private void Personnels()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC SP_OTHERPERSONNEL @USERNAME = @username", connection);
                command.Parameters.AddWithValue("@username", Session["username"]);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    PersonnelsRepeater.DataSource = reader;
                    PersonnelsRepeater.DataBind();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }

        private void BindGridViews()
        {
            DataTable dataSource1 = Query("EXEC SP_TOPPRODUCTSORDERED");
            DataTable dataSource2 = Query("EXEC SP_TOPSELLINGPRODUCTS");

            if (dataSource1 != null && dataSource1.Rows.Count > 0)
            {
                GridView1.DataSource = dataSource1;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                GridView1.EmptyDataText = "No Data Available";
            }

            if (dataSource2 != null && dataSource2.Rows.Count > 0)
            {
                GridView2.DataSource = dataSource2;
                GridView2.DataBind();
            }
            else
            {
                GridView2.DataSource = null;
                GridView2.DataBind();
                GridView2.EmptyDataText = "No Data Available";
            }
        }
        private DataTable Query(string storedProcedure)
        {
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(storedProcedure, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dataTable);
                    }
                }
            }

            return dataTable;
        }

        private void PersonnelFirstname()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT FIRSTNAME FROM PERSONNEL WHERE USERNAME = @username", connection);
                command.Parameters.AddWithValue("@username", Session["username"]);

                try
                {
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        PersonnelName.Text = result.ToString();
                    }
                    else
                    {
                        PersonnelName.Text = "Unknown"; // Set default value if personnel name is not found
                    }
                }
                catch (Exception ex)
                {
                    PersonnelName.Text = "Error: " + ex.Message;
                }
            }
        }


        protected void logout(object sender, EventArgs e)
        {
            Session.Remove("username");
            Response.Redirect("/index");
        }
    }
}