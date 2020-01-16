using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace VetWebAp
{
    public partial class AddPetOwner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displayPetOwnerDetails();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("PetOwners.aspx");
        }

        private void displayPetOwnerDetails()
        {
            DataView data = (DataView) SqlDataSourceOwners.Select(DataSourceSelectArguments.Empty);
            if (data != null && data.Count > 0)
            {
                txtFirstname.Text = data[0]["First"].ToString();
                txtLastname.Text = data[0]["Last"].ToString();
                txtMobile.Text = data[0]["Mobile_No"].ToString();
                txtEmail.Text = data[0]["Email_Address"].ToString();
                chkID.Checked = Convert.ToBoolean(data[0]["ID_checked"].ToString());
                txtLicence.Text = data[0]["Licence_No"].ToString();
                txtMedicare.Text = data[0]["Medicare_No"].ToString();
                txtUtility.Text = data[0]["Utility_bill"].ToString();
                txtAddress.Text = data[0]["Street_Address"].ToString();
                txtPostcode.Text = data[0]["Postcode"].ToString();
                txtPetOwnerID.Text = data[0]["Pet_OwnerID"].ToString();
            }
        }

        private void displayMessageAlert(String message)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "window.onload=function(){ alert('" + message + "') };", true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            String id = Request.QueryString["id"];
            if (id != null && id.Length > 0)
            {
                try
                {
                    SqlDataSourceOwners.Update();
                    displayMessageAlert("Record updated successfully.");
                }
                catch (SqlException exc)
                {
                    String errorMsg = "Error updating record! Please check all fields entered.";
                    displayMessageAlert(errorMsg);
                }
            }
            else
            {
                try
                {
                    String connectionString = ConfigurationManager.ConnectionStrings["Vet_DataConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection(connectionString);
                    string query = "INSERT INTO Pet_Owner(First, Last, Mobile_No, Email_Address, Licence_No, Medicare_No, ID_checked, Utility_bill, Street_Address, Postcode) VALUES (@First, @Last, @Mobile, @Email, @Licence, @Medicare, @ID_Checked, @Utility, @Address, @Postcode); SELECT SCOPE_IDENTITY();";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@First", txtFirstname.Text);
                    cmd.Parameters.AddWithValue("@Last", txtLastname.Text);
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Licence", txtLicence.Text);
                    cmd.Parameters.AddWithValue("@Medicare", txtMedicare.Text);
                    cmd.Parameters.AddWithValue("@ID_Checked", chkID.Checked);
                    cmd.Parameters.AddWithValue("@Utility", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@Postcode", txtPostcode.Text);
                    con.Open();
                    txtPetOwnerID.Text = cmd.ExecuteScalar().ToString();
                    con.Close();

                    displayMessageAlert("Record added successfully.");
                }
                catch (SqlException exc)
                {
                    String errorMsg = "Error creating record! Please check all fields entered.";
                    displayMessageAlert(errorMsg);
                }
            }
        }

        protected void btnAddPet_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPetOwnerID.Text == null || txtPetOwnerID.Text == "")
                {
                    displayMessageAlert("Please save the pet owner details record prior to adding a pet!");
                    return;
                }

                if ((txtPetName.Text == null || txtPetName.Text.Length == 0) ||
                    (txtPetDOB.Text == null || txtPetDOB.Text.Length == 0))
                {
                    throw new Exception();
                }
                SqlDataSourcePets.Insert();
                displayMessageAlert("Pet added successfully.");

                txtPetName.Text = "";
                txtPetDOB.Text = "";
                txtPetType.Text = "";
                txtPetBreed.Text = "";
            }
            catch (Exception exc)
            {
                String errorMsg = "Error creating record! Please check all fields entered.";
                displayMessageAlert(errorMsg);
            }
        }
    }
}