using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VetWebAp
{
    public partial class AppointmentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtID.Text = Request.QueryString["id"];
                displayAppointmentDetails();
                bindPetGridView();
                bindVetGridView();
                bindInventoryGridView();
            }
        }

        private void displayAppointmentDetails()
        {
            DataView data = (DataView)SqlDataSourceAppointment.Select(DataSourceSelectArguments.Empty);
            if (data != null && data.Count > 0)
            {
                txtAppointmentDate.Text = data[0]["Appointment_Date"].ToString();
                DropDownListHour.SelectedValue = data[0]["Appointment_Time"].ToString().Substring(0, 2);
                DropDownListMinute.SelectedValue = data[0]["Appointment_Time"].ToString().Substring(3, 2);
                txtPaid.Text = data[0]["Payment"].ToString();
                chkPaid.Checked = Convert.ToBoolean(data[0]["Paid"].ToString());
                txtComments.Text = data[0]["Vet_Comments"].ToString();
                txtSelectedVet.Text = data[0]["Vet"].ToString();
                txtPetID.Text = data[0]["Pet_ID"].ToString();
                txtVetID.Text = data[0]["Vet_ID"].ToString();
                txtSelectedPet.Text = data[0]["Pet"].ToString();
                txtSelectedPetOwner.Text = data[0]["Pet_Owner"].ToString();
            }
        }

        private void displayMessageAlert(String message)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "window.onload=function(){ alert('" + message + "') };", true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            String id = txtID.Text;
            if (id != null && id.Length > 0)
            {
                try
                {
                    SqlDataSourceInventory.UpdateCommand = "UPDATE Inventory SET Quantity = Quantity - @Quantity WHERE Medication_ID = @Medication_ID";
                    SqlDataSourceAppointment.UpdateParameters.Add("Appointment_Time", DropDownListHour.SelectedValue + ":" + DropDownListMinute.SelectedValue);
                    SqlDataSourceAppointment.Update();
                    displayMessageAlert("Appointment updated successfully.");
                }
                catch (SqlException exc)
                {
                    String errorMsg = "Error updating appointment! Please check all fields entered.";
                    displayMessageAlert(errorMsg);
                }
            }
            else
            {
                String connectionString = ConfigurationManager.ConnectionStrings["Vet_DataConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                try
                {
                    if (txtPetID.Text == null || txtPetID.Text == "")
                    {
                        displayMessageAlert("A pet must be selected for this appointment!");
                        return;
                    }

                    if (txtVetID.Text == null || txtVetID.Text == "")
                    {
                        displayMessageAlert("A vet must be selected for this appointment!");
                        return;
                    }

                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "sp_InsertAppointment";
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter param = new SqlParameter();
                    param.ParameterName = "@Vet_ID";
                    param.SqlDbType = SqlDbType.Int;
                    param.Direction = ParameterDirection.Input;
                    param.Value = txtVetID.Text;
                    cmd.Parameters.Add(param);

                    param = new SqlParameter();
                    param.ParameterName = "@Pet_ID";
                    param.SqlDbType = SqlDbType.Int;
                    param.Direction = ParameterDirection.Input;
                    param.Value = txtPetID.Text;
                    cmd.Parameters.Add(param);

                    param = new SqlParameter();
                    param.ParameterName = "@Payment";
                    param.SqlDbType = SqlDbType.Money;
                    param.Direction = ParameterDirection.Input;
                    decimal result;
                    if (decimal.TryParse(txtPaid.Text, out result))
                    {
                        param.Value = decimal.Parse(txtPaid.Text);
                    }
                    else
                    {
                        param.Value = decimal.Parse("0.00");
                    }
                    cmd.Parameters.Add(param);

                    param = new SqlParameter();
                    param.ParameterName = "@Paid";
                    param.SqlDbType = SqlDbType.Bit;
                    param.Direction = ParameterDirection.Input;
                    param.Value = chkPaid.Checked;
                    cmd.Parameters.Add(param);
                    
                    param = new SqlParameter();
                    param.ParameterName = "@Appointment_Date";
                    param.SqlDbType = SqlDbType.Date;
                    param.Direction = ParameterDirection.Input;
                    param.Value = txtAppointmentDate.Text;
                    cmd.Parameters.Add(param);

                    param = new SqlParameter();
                    param.ParameterName = "@Appointment_Time";
                    param.SqlDbType = SqlDbType.Time;
                    param.Direction = ParameterDirection.Input;
                    param.Value = DropDownListHour.SelectedValue + ":" + DropDownListMinute.SelectedValue;
                    cmd.Parameters.Add(param);

                    param = new SqlParameter();
                    param.ParameterName = "@Vet_Comments";
                    param.SqlDbType = SqlDbType.NVarChar;
                    param.Direction = ParameterDirection.Input;
                    param.Value = txtComments.Text;
                    cmd.Parameters.Add(param);
                                    
                    cmd.Parameters.AddWithValue("New_ID", SqlDbType.Int).Direction = ParameterDirection.Output;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    displayMessageAlert("Appointment added successfully.");
                    con.Close();

                    string newId = cmd.Parameters["New_ID"].Value.ToString();
                    txtID.Text = newId;
                }
                catch (SqlException exc)
                {
                    String errorMsg = "Error creating Appointment! Please check all fields entered.";
                    displayMessageAlert(errorMsg);
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Appointments.aspx");
        }

        protected void btnSearchPet_Click(object sender, EventArgs e)
        {
            bindPetGridView();
        }

        protected void bindPetGridView()
        {
            String connectionString = ConfigurationManager.ConnectionStrings["Vet_DataConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT p.Pet_ID, p.Name AS 'Pet Name', " +
                              "CONCAT(o.First, ' ', o.Last) AS 'Pet Owner', " +
                              "CONCAT(o.Street_Address, ' ', Postcode) AS 'Address' " +
                              "FROM Pet p " +
                              "INNER JOIN Pet_Owner o ON o.Pet_OwnerID = p.Pet_OwnerID " +
                              "WHERE p.Name LIKE '%' + @name + '%' " +
                              "ORDER BY 'Pet Owner', 'Pet Name'";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@name", txtSearchPet.Text);
            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            GridViewPets.DataSource = dt;
            GridViewPets.DataBind();

            con.Close();
        }

        protected void GridViewPets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewPets.PageIndex = e.NewPageIndex;
            bindPetGridView();
        }

        protected void GridViewPets_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = GridViewPets.DataKeys[GridViewPets.SelectedIndex].Value;
            var petName = GridViewPets.SelectedRow.Cells[2].Text;
            var ownerName = GridViewPets.SelectedRow.Cells[3].Text;
            txtPetID.Text = id.ToString();
            txtSelectedPet.Text = petName;
            txtSelectedPetOwner.Text = ownerName;
        }

        protected void btnClearPetSearch_Click(object sender, EventArgs e)
        {
            txtSearchPet.Text = "";
            bindPetGridView();
        }

        protected void btnSearchVet_Click(object sender, EventArgs e)
        {
            bindVetGridView();
        }
        protected void bindVetGridView()
        {
            String connectionString = ConfigurationManager.ConnectionStrings["Vet_DataConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT v.Vet_ID, " +
                              "CONCAT(v.First_Name, ' ', v.Last_Name) AS 'Vet Name', " +
                              "v.Skills, va.Month, va.Days " +
                              "FROM Vet v " +
                              "INNER JOIN Vet_Availability va ON va.Vet_ID = v.Vet_ID " +
                              "WHERE CONCAT(v.First_Name, ' ', v.Last_Name) LIKE '%' + @name + '%' " +
                              "ORDER BY 'Vet Name', va.Month";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@name", txtSearchVet.Text);
            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            GridViewVets.DataSource = dt;
            GridViewVets.DataBind();

            con.Close();
        }

        protected void GridViewVets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewVets.PageIndex = e.NewPageIndex;
            bindVetGridView();
        }

        protected void GridViewVets_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = GridViewVets.DataKeys[GridViewVets.SelectedIndex].Value;
            var vetName = GridViewVets.SelectedRow.Cells[2].Text;
            txtVetID.Text = id.ToString();
            txtSelectedVet.Text = vetName;
        }

        protected void btnClearVetSearch_Click(object sender, EventArgs e)
        {
            txtSearchVet.Text = "";
            bindVetGridView();
        }

        protected void btnAddMedication_Click(object sender, EventArgs e)
        {
            try
            {
                String id = txtID.Text;
                if (id == null || id == "")
                {
                    displayMessageAlert("Please save the new appointment record before adding a medication item!");
                    return;
                }

                if (txtMedicationID.Text == null || txtMedicationID.Text == "")
                {
                    displayMessageAlert("Please select a medication item!");
                    return;
                }
                int quantity;
                bool isInt = int.TryParse(txtQuantity.Text, out quantity);
                if (!isInt) {
                    displayMessageAlert("Please enter a valid quantity value for the selected medication item!");
                    return;
                }
                int inventoryQuantity;
                int.TryParse(GridViewInventory.SelectedRow.Cells[3].Text, out inventoryQuantity);
                if (inventoryQuantity < int.Parse(txtQuantity.Text))
                {
                    displayMessageAlert("There is not enough stock of this medication! Please check inventory stock levels.");
                    return;
                }

                SqlDataSourceMedications.Insert();

                SqlDataSourceInventory.UpdateCommand = "UPDATE Inventory SET Quantity = Quantity - " + quantity + " WHERE Medication_ID = " + txtMedicationID.Text;
                SqlDataSourceInventory.Update();
                txtMedicationID.Text = "";
                txtMedication.Text = "";
                txtQuantity.Text = "";
                bindInventoryGridView();
            }
            catch (SqlException exc)
            {
                displayMessageAlert("Error adding a medication to the appointment!");
            }
        }

        protected void btnSearchInventory_Click(object sender, EventArgs e)
        {
            bindInventoryGridView();
        }

        protected void bindInventoryGridView()
        {
            String connectionString = ConfigurationManager.ConnectionStrings["Vet_DataConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT Medication_ID, Name, Quantity " +
                              "FROM Inventory " +
                              "WHERE Name LIKE '%' + @name + '%' " +
                              "ORDER BY Name";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@name", txtSearchInventory.Text);
            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            GridViewInventory.DataSource = dt;
            GridViewInventory.DataBind();

            con.Close();
        }

        protected void GridViewInventory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewInventory.PageIndex = e.NewPageIndex;
            bindInventoryGridView();
        }

        protected void GridViewInventory_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = GridViewInventory.DataKeys[GridViewInventory.SelectedIndex].Value;
            var name = GridViewInventory.SelectedRow.Cells[2].Text;
            txtMedicationID.Text = id.ToString();
            txtMedication.Text = name;
        }

        protected void btnClearInventorySearch_Click(object sender, EventArgs e)
        {
            txtSearchInventory.Text = "";
            txtMedication.Text = "";
            txtQuantity.Text = "";
            bindInventoryGridView();
        }

        protected void GridViewMedications_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewMedications.PageIndex = e.NewPageIndex;
            bindInventoryGridView();
        }

        protected void GridViewMedications_SelectedIndexChanged(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            string medicationID = row.Cells[1].Text;
            SqlDataSourceMedications.DeleteParameters.Add("Medication_ID", medicationID);
            SqlDataSourceMedications.Delete();
            int inventoryQuantity = int.Parse(row.Cells[3].Text);
            SqlDataSourceInventory.UpdateCommand = "UPDATE Inventory SET Quantity = Quantity + " + inventoryQuantity + " WHERE Medication_ID = " + medicationID;
            SqlDataSourceInventory.Update();
            txtSearchInventory.Text = "";
            txtMedication.Text = "";
            txtQuantity.Text = "";
            bindInventoryGridView();
        }
    }
}