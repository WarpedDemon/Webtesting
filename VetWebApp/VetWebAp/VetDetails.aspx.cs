using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;

namespace VetWebAp
{
    public partial class VetDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displayVetDetails();
            }
        }

        private void displayVetDetails()
        {
            DataView data = (DataView)SqlDataSourceVets.Select(DataSourceSelectArguments.Empty);
            if (data != null && data.Count > 0)
            {
                txtFirstName.Text = data[0]["First_Name"].ToString();
                txtLastName.Text = data[0]["Last_Name"].ToString();
                txtMobileNo.Text = data[0]["Mobile_no"].ToString();
                txtEmail.Text = data[0]["Email"].ToString();
                txtAddress.Text = data[0]["Street_Address"].ToString();
                txtPostcode.Text = data[0]["Postcode"].ToString();
                txtSkills.Text = data[0]["Skills"].ToString();
                txtNewID.Text = data[0]["Vet_ID"].ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            String id = Request.QueryString["id"];
            if (id != null && id.Length > 0)
            {
                try
                {
                    SqlDataSourceVets.Update();
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
                    string query = "INSERT INTO Vet(First_Name, Last_Name, Mobile_no, Email, Street_Address, Postcode, Skills) VALUES (@First_Name, @Last_Name, @Mobile_no, @Email, @Street_Address, @Postcode, @Skills); SELECT SCOPE_IDENTITY();";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@First_Name", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@Last_Name", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@Mobile_no", txtMobileNo.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Street_Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@Postcode", txtPostcode.Text);
                    cmd.Parameters.AddWithValue("@Skills", txtSkills.Text);
                    con.Open();
                    txtNewID.Text = cmd.ExecuteScalar().ToString();
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

        private void displayMessageAlert(String message)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "window.onload=function(){ alert('" + message + "') };", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vets.aspx");
        }

        protected void btnAddAvailability_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtNewID.Text == null || txtNewID.Text == "")
                {
                    displayMessageAlert("Please save the vet details record prior to adding an availability!");
                    return;
                }
                if ((txtWeekBegining.Text == null || txtWeekBegining.Text.Length == 0) ||
                    (chkMon.Checked == false && chkTue.Checked == false &&
                     chkWed.Checked == false && chkThu.Checked == false &&
                     chkFri.Checked == false && chkSat.Checked == false &&
                     chkSun.Checked == false))
                {
                    throw new Exception();
                }

                SqlDataSourceAvailability.InsertParameters["Month"].DefaultValue = DropDownListMonths.SelectedValue;
                SqlDataSourceAvailability.InsertParameters["Week_Beginning"].DefaultValue = txtWeekBegining.Text;

                String days = "";
                List<String> dayList = new List<String>();
                if (chkMon.Checked == true) { dayList.Add("Mon"); }
                if (chkTue.Checked == true) { dayList.Add("Tue"); }
                if (chkWed.Checked == true) { dayList.Add("Wed"); }
                if (chkThu.Checked == true) { dayList.Add("Thu"); }
                if (chkFri.Checked == true) { dayList.Add("Fri"); }
                if (chkSat.Checked == true) { dayList.Add("Sat"); }
                if (chkSun.Checked == true) { dayList.Add("Sun"); }
                for (int i = 0; i < dayList.Count; i++)
                {
                    days += dayList.ElementAt(i);
                    if (i < dayList.Count - 1) { days += ","; }
                }
                SqlDataSourceAvailability.InsertParameters["Days"].DefaultValue = days;

                SqlDataSourceAvailability.Insert();
                displayMessageAlert("Vet availability record added successfully.");

                txtWeekBegining.Text = "";
                chkMon.Checked = false;
                chkTue.Checked = false;
                chkWed.Checked = false;
                chkThu.Checked = false;
                chkFri.Checked = false;
                chkSat.Checked = false;
                chkSun.Checked = false;
                DropDownListMonths.SelectedIndex = 0;
            }
            catch (Exception exc)
            {
                String errorMsg = "Error creating record! Please check all fields entered.";
                displayMessageAlert(errorMsg);
            }
        }
    }
}