using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace VetWebAp
{
    public partial class PetOwner : System.Web.UI.Page
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
            Response.Redirect("PetOwnerDetails.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bindGridView();
        }

        private void bindGridView()
        {
            String connectionString = ConfigurationManager.ConnectionStrings["Vet_DataConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT Pet_OwnerID AS 'ID', CONCAT(First, ' ', Last) AS 'Pet Owner', Mobile_No AS 'Mobile No.', Email_Address AS 'Email', Licence_No AS 'Licence No.', ID_checked AS 'ID Checked', Medicare_No AS 'Medicare No.', Utility_bill AS 'Utility Bill', Street_Address AS 'Address', Postcode " +
                              "FROM Pet_Owner " +
                              "WHERE CONCAT(First, ' ', Last) LIKE '%' + ISNULL(@name, '') + '%' ORDER BY First";

            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@name", txtSearch.Text.Trim());
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            bindGridView();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = GridView1.DataKeys[GridView1.SelectedIndex].Value;
            Response.Redirect("PetOwnerDetails.aspx?id=" + id);
        }
    }
}