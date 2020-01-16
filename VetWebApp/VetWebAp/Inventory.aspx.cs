using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace VetWebAp
{
    public partial class Inventory : System.Web.UI.Page
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
            cmd.CommandText = "SELECT [Medication_ID] AS ID, [Name], [Quantity], FORMAT([Cost], 'C', 'en-au') AS Cost, FORMAT([Price], 'C', 'en-au') AS Price FROM [inventory] WHERE Name LIKE '%' + @name + '%' ORDER BY Name";
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bindGridView();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            String errorMsg = "Error creating record! Please check all fields entered.";
            if ((txtName.Text == null || txtName.Text == "") ||
                (txtQuantity.Text == null || txtQuantity.Text == "") ||
                (txtCost.Text == null || txtCost.Text == "") ||
                (txtPrice.Text == null || txtPrice.Text == ""))
            {
                displayMessageAlert(errorMsg);
            }

            String connectionString = ConfigurationManager.ConnectionStrings["Vet_DataConnectionString"].ConnectionString;
            SqlCommand cmd = new SqlCommand();

            if (editMode.Checked)
            {
                var id = GridView1.DataKeys[GridView1.SelectedIndex].Value;
                cmd.CommandText = "UPDATE Inventory SET Name = @name, Quantity = @quantity, Cost = @cost, Price = @price WHERE Medication_ID = " + id;
            }
            else
            {
                cmd.CommandText = "INSERT INTO Inventory (Name, Quantity, Cost, Price) VALUES (@name, @quantity, @cost, @price)";
            }
            cmd.Connection = new SqlConnection(connectionString);
            cmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@quantity", txtQuantity.Text.Trim());
            cmd.Parameters.AddWithValue("@cost", txtCost.Text.Trim());
            cmd.Parameters.AddWithValue("@price", txtPrice.Text.Trim());

            try {
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                if (editMode.Checked)
                {
                    displayMessageAlert("Record updated successfully.");
                    editMode.Checked = false;
                }
                else
                {
                    displayMessageAlert("Record created successfully.");
                }
                bindGridView();

                txtName.Text = "";
                txtQuantity.Text = "";
                txtCost.Text = "";
                txtPrice.Text = "";
            }
            catch (SqlException exc)
            {
                displayMessageAlert(errorMsg);
            }
        }

        private void displayMessageAlert(String message)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "window.onload=function(){ alert('" + message + "') };", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearFields();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            clearFields();
            txtName.Focus();
        }

        private void clearFields()
        {
            txtName.Text = "";
            txtQuantity.Text = "";
            txtCost.Text = "";
            txtPrice.Text = "";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            bindGridView();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtName.Text = GridView1.SelectedRow.Cells[2].Text;
            txtQuantity.Text = GridView1.SelectedRow.Cells[3].Text;
            txtCost.Text = GridView1.SelectedRow.Cells[4].Text;
            txtPrice.Text = GridView1.SelectedRow.Cells[5].Text;
            editMode.Checked = true;
        }

        protected void editInventory(object sender, EventArgs e)
        {

        }
    }
}