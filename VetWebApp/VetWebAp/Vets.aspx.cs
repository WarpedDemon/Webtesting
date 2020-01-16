using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace VetWebAp
{
    public partial class Vets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGridView();
            }
        }

        private void bindGridView()
        {
            String connectionString = ConfigurationManager.ConnectionStrings["Vet_DataConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT [Vet_ID] AS 'ID', CONCAT([First_Name], ' ', [Last_Name]) AS 'Name', [Mobile_no] AS 'Mobile No.', [Email], [Street_Address] AS 'Address', [Postcode], [Skills] FROM [Vet] WHERE CONCAT([First_Name], ' ', [Last_Name]) LIKE '%' + @name + '%' ORDER BY First_Name";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@name", txtSearch.Text.Trim());
            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            con.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("VetDetails.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bindGridView();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            bindGridView();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindGridView();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = GridView1.DataKeys[GridView1.SelectedIndex].Value;
            Response.Redirect("VetDetails.aspx?id=" + id);
        }
    }
}