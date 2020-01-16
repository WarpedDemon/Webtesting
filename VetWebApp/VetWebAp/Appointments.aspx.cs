using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace VetWebAp
{
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGridView();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AppointmentDetails.aspx");
        }

        private void bindGridView()
        {
            String connectionString = ConfigurationManager.ConnectionStrings["Vet_DataConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT a.Appointment_ID AS 'ID', a.Vet_ID, " +
                              "v.First_Name + ' ' + v.Last_Name AS 'Veterinarian', " +
                              "p.Name AS 'Pet', " +
                              "o.First + ' ' + o.Last AS 'Pet Owner', " +
                              "a.Pet_ID, a.Payment, a.Paid, " +
                              "CONVERT(VARCHAR, CONVERT(DATE, a.Appointment_Date), 103) AS 'Appointment_Date', " +
                              "CONVERT(VARCHAR(5), a.Appointment_Time, 108) AS 'Appointment_Time', " +
                              "a.Vet_Comments " +
                              "FROM Appointment a " +
                              "INNER JOIN Vet v ON v.Vet_ID = a.Vet_ID " +
                              "INNER JOIN Pet p ON p.Pet_ID = a.Pet_ID " +
                              "INNER JOIN Pet_Owner o ON o.Pet_OwnerID = p.Pet_OwnerID " + 
                              "ORDER BY a.Appointment_Date DESC";

            cmd.Connection = con;
            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            con.Close();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindGridView();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = GridView1.DataKeys[GridView1.SelectedIndex].Value;
            Response.Redirect("AppointmentDetails.aspx?id=" + id);
        }
    }
}