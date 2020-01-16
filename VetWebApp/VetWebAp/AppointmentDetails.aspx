<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppointmentDetails.aspx.cs" Inherits="VetWebAp.AppointmentDetails" MaintainScrollPositionOnPostback="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">



.menu ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

.menu li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px !important;
    text-decoration: none;
}

        .auto-style1 {
            height: 557px;
        }

.saveButton, .cancelButton {
    background-color: #0095ff;
    border: 1px solid #07c;
    box-shadow: inherit 0 1px 0 #66bfff;
    padding: 10px;
    margin: 10px;
    color: #ffffff;
    border-radius: 2px;
}

        .auto-style3 {
            float: left;
            height: 220px;
            width: auto;
        }

    .addButton {
    background-color: #57c40a;
    border-width: 0 !important;
    color: #ffffff;
    padding: 10px;
    margin: 10px;
    border-radius: 2px;
}

    </style>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $("#txtAppointmentDate").datepicker({
                changeMonth: true,
                changeYear: true,
                showOn: "button",
                buttonImage: "images/calendar.gif",
                buttonImageOnly: true,
                buttonText: "Select date",
                dateFormat: "dd/mm/yy"
            });

            $("#txtAppointmentDate").datepicker.attr("autocomplete", "off");
        } );

        function Confirm_Delete() {
            var confirm_delete = document.createElement("INPUT");
            confirm_delete.type = "hidden";
            confirm_delete.name = "confirm_delete";
            if (confirm("Do you want to delete the appointment medication item?")) {
                confirm_delete.value = "Yes";
            } else {
                confirm_delete.value = "No";
            }
            document.forms[0].appendChild(confirm_delete);
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">    
                <asp:Image ID="Image1" runat="server" Height="133px" ImageUrl="~/vet.png" Width="131px" />
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Segoe WP Black" Font-Size="XX-Large" Height="51px" Text="iCare Pet System" Width="347px"></asp:Label>
    
                <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="menu" BackColor="#333333" Width="100%">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/PetOwners.aspx" Text="Pet Owners" Value="Pet Owners"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Inventory.aspx" Text="Inventory" Value="Inventory"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Vets.aspx" Text="Vets" Value="Vets"></asp:MenuItem>
                        <asp:MenuItem Text="Appointments" Value="Appointments" NavigateUrl="~/Appointments.aspx"></asp:MenuItem>
                    </Items>
                </asp:Menu>
                <br />
                    <asp:Label ID="Label10" runat="server" Text="Appointment Details" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    <br />
                    <br />
                <asp:Label ID="Label12" runat="server" Text="Appointment Date" Width="150"></asp:Label>
                <asp:TextBox ID="txtAppointmentDate" runat="server" Width="95px" ></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label13" runat="server" Text="Appointment Time" Width="150px"></asp:Label>
                <asp:DropDownList ID="DropDownListHour" runat="server">
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Label14" runat="server" Text=":" Width="10px"></asp:Label>
                <asp:DropDownList ID="DropDownListMinute" runat="server">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="Label15" runat="server" Text="Payment" Width="150px"></asp:Label>
                <asp:TextBox ID="txtPaid" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:CheckBox ID="chkPaid" runat="server" Text="Paid" TextAlign="Left" />
                <br />
                <br />
                <asp:Label ID="Label16" runat="server" Text="Vet Comments" Width="150px"></asp:Label>
                <asp:TextBox ID="txtComments" runat="server" Height="16px" Width="459px"></asp:TextBox>
                <br />
                <br />
            <asp:Label ID="Label17" runat="server" Text="Selected Owner" Width="150px"></asp:Label>
            <asp:TextBox ID="txtSelectedPetOwner" runat="server" Width="200px" Enabled="False"></asp:TextBox>
            <asp:TextBox ID="txtVetID" runat="server" Visible="False"></asp:TextBox>
                <br />
                    <asp:TextBox ID="txtPetID" runat="server" Visible="False"></asp:TextBox>
                    <br />
        <div style="width: 100%;">
        <div style="float: left;">
        <div style="width: auto;">
            <asp:Label ID="Label11" runat="server" Text="Selected Pet" Width="150px"></asp:Label>
            <asp:TextBox ID="txtSelectedPet" runat="server" Width="200px" Enabled="False"></asp:TextBox>
        </div>
        <div style="border-style: outset; padding: 10px; margin: 20px 20px 0px 0px;" class="auto-style3">
            <asp:TextBox ID="txtSearchPet" runat="server" Width="200px"></asp:TextBox>
            <asp:Button ID="btnSearchPet" runat="server" Text="Search" OnClick="btnSearchPet_Click" />
            <asp:Button ID="btnClearPetSearch" runat="server" OnClick="btnClearPetSearch_Click" Text="Clear" />
        <br />
            <br />
        <asp:GridView ID="GridViewPets" runat="server" DataKeyNames="Pet_ID" AutoGenerateColumns="False" AllowPaging="True" CellPadding="5" GridLines="None" PageSize="3" OnPageIndexChanging="GridViewPets_PageIndexChanging" OnSelectedIndexChanged="GridViewPets_SelectedIndexChanged">
            <AlternatingRowStyle BorderStyle="None" BackColor="#F6F9FC" />
            <Columns>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/select.jpg" ShowSelectButton="True" />
                <asp:BoundField DataField="Pet_ID" HeaderText="Pet_ID" InsertVisible="False" ReadOnly="True" SortExpression="Vet_ID" Visible="false"/>
                <asp:BoundField DataField="Pet Name" HeaderText="Pet" SortExpression="Vet" ReadOnly="True" />
                <asp:BoundField DataField="Pet Owner" HeaderText="Owner" SortExpression="Vet" ReadOnly="True" />
            </Columns>
            <EditRowStyle BorderStyle="None" />
            <HeaderStyle BackColor="#F6F9FC" BorderStyle="None" BorderWidth="0px" />
            <RowStyle BorderStyle="None" />
        </asp:GridView>
        </div>
        </div>
        <div style="float: left; margin-left: 20px; height: 220px;">
        <div style="width: auto;">
            <asp:Label ID="Label2" runat="server" Text="Selected Available Vet" Width="158px"></asp:Label>
            <asp:TextBox ID="txtSelectedVet" runat="server" Width="146px" Enabled="False"></asp:TextBox>
        </div>
        <div style="border-style: outset; margin: 20px 20px 20px 0px; padding: 10px;" class="auto-style3">
            <asp:TextBox ID="txtSearchVet" runat="server" Width="200px"></asp:TextBox>            
            <asp:Button ID="btnSearchVet" runat="server" Text="Search" OnClick="btnSearchVet_Click" />
            <asp:Button ID="btnClearVetSearch" runat="server" OnClick="btnClearVetSearch_Click" Text="Clear" />
            <br />
            <br />
            <asp:GridView ID="GridViewVets" runat="server" DataKeyNames="Vet_ID" AutoGenerateColumns="False" AllowPaging="True" CellPadding="5" GridLines="None" PageSize="3" OnPageIndexChanging="GridViewVets_PageIndexChanging" OnSelectedIndexChanged="GridViewVets_SelectedIndexChanged">
            <AlternatingRowStyle BorderStyle="None" BackColor="#F6F9FC" />
            <Columns>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/select.jpg" ShowSelectButton="True" />
                <asp:BoundField DataField="Vet_ID" HeaderText="Vet_ID" InsertVisible="False" ReadOnly="True" SortExpression="Vet_ID" Visible="false"/>
                <asp:BoundField DataField="Vet Name" HeaderText="Vet" SortExpression="Vet" ReadOnly="True" />
                <asp:BoundField DataField="Skills" HeaderText="Skills" SortExpression="Skills" />
                <asp:BoundField DataField="Month" HeaderText="Month" ReadOnly="True" />
                <asp:BoundField DataField="Days" HeaderText="Days" />
            </Columns>
            <EditRowStyle BorderStyle="None" />
            <HeaderStyle BackColor="#F6F9FC" BorderStyle="None" BorderWidth="0px" />
            <RowStyle BorderStyle="None" />
            </asp:GridView>
        </div>
        </div>
    </div>
        </div>
        <div style="height: auto;">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div style="border-style: outset; width: auto; padding: 20px; height: auto;">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Label ID="Label18" runat="server" Text="Medications &amp; Treatments" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridViewMedications" runat="server" AutoGenerateColumns="False" Width="652px" AllowPaging="True" BorderColor="#F6F9FC" CellPadding="5" GridLines="None" DataKeyNames="Medication_ID" DataSourceID="SqlDataSourceMedications" OnPageIndexChanging="GridViewMedications_PageIndexChanging" OnSelectedIndexChanged="GridViewMedications_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#F6F9FC" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                <asp:ImageButton ID="DeleteButton" runat="server" ImageUrl="~/images/delete.jpg" OnClick="GridViewMedications_SelectedIndexChanged" OnClientClick="return confirm('Are you sure you want to delete this appointment medication?');" AlternateText="Delete" />               
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Medication_ID" HeaderText="Medication ID" ReadOnly="True" SortExpression="Medication_ID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Vet" ReadOnly="True" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Vet" ReadOnly="True" />
                        </Columns>
                        <HeaderStyle BackColor="#F6F9FC" />
                    </asp:GridView>
                    <br />
                    <div style="border-style: outset; margin: 20px 20px 20px 0px; padding: 10px;">
                        <asp:TextBox ID="txtSearchInventory" runat="server" Width="200px"></asp:TextBox>
                        <asp:Button ID="btnSearchInventory" runat="server" OnClick="btnSearchInventory_Click" Text="Search" />
                        <asp:Button ID="btnClearInventorySearch" runat="server" Text="Clear" OnClick="btnClearInventorySearch_Click" />
                        <br />
                        <br />
                        <asp:GridView ID="GridViewInventory" runat="server" DataKeyNames="Medication_ID" AllowPaging="True" AutoGenerateColumns="False" CellPadding="5" GridLines="None" PageSize="3" OnPageIndexChanging="GridViewInventory_PageIndexChanging" OnSelectedIndexChanged="GridViewInventory_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="#F6F9FC" BorderStyle="None" />
                            <Columns>
                                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/select.jpg" ShowSelectButton="True" />
                                <asp:BoundField DataField="Medication_ID" HeaderText="Medication_ID" InsertVisible="False" ReadOnly="True" SortExpression="Medication_ID" Visible="false"/>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Vet" ReadOnly="True" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Vet" ReadOnly="True" />
                            </Columns>
                            <EditRowStyle BorderStyle="None" />
                            <HeaderStyle BackColor="#F6F9FC" BorderStyle="None" BorderWidth="0px" />
                            <RowStyle BorderStyle="None" />
                        </asp:GridView>
                    </div>
                    <asp:TextBox ID="txtMedicationID" runat="server" Visible="False"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label19" runat="server" Text="Selected Medication" Width="140px" Height="19px"></asp:Label>
                    <asp:TextBox ID="txtMedication" runat="server" Width="300px" Enabled="False"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label21" runat="server" Text="Quantity" Width="140px"></asp:Label>
                    <asp:TextBox ID="txtQuantity" runat="server" Width="89px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btnAddMedication" runat="server" Text="Add Medication" CssClass="addButton" OnClick="btnAddMedication_Click" />
                </asp:Panel>
            <br />
                </div>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="saveButton" />
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CssClass="cancelButton" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourcePet" runat="server" ConnectionString="<%$ ConnectionStrings:Vet_DataConnectionString %>" SelectCommand="SELECT p.Pet_ID, p.Name AS 'Pet Name', CONCAT(o.First, ' ', o.Last) AS 'Pet Owner', CONCAT(o.Street_Address, ' ', Postcode) AS 'Address' FROM Pet p INNER JOIN Pet_Owner o ON o.Pet_OwnerID = p.Pet_OwnerID ORDER BY 'Pet Owner', 'Pet Name'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceVet" runat="server" ConnectionString="<%$ ConnectionStrings:Vet_DataConnectionString %>" SelectCommand="SELECT Vet_ID, CONCAT(First_Name, ' ', Last_Name) AS 'Vet', Skills FROM Vet ORDER BY 'Vet'"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAppointment" runat="server" ConnectionString="<%$ ConnectionStrings:Vet_DataConnectionString %>" SelectCommand="SELECT a.Appointment_ID, a.Vet_ID, CONCAT(v.First_Name, ' ', v.Last_Name) AS 'Vet', a.Pet_ID, p.Name AS 'Pet', CONCAT(o.First, ' ', o.Last) AS 'Pet_Owner', FORMAT(a.Payment, 'C', 'en-us') AS 'Payment', a.Paid, CONVERT(VARCHAR, CONVERT(DATE, a.Appointment_Date), 103) AS 'Appointment_Date', CONVERT(VARCHAR(5), a.Appointment_Time, 108) AS 'Appointment_Time', a.Vet_Comments FROM Appointment a INNER JOIN Vet v ON v.Vet_ID = a.Vet_ID INNER JOIN Pet p ON p.Pet_ID = a.Pet_ID INNER JOIN Pet_Owner o ON o.Pet_OwnerID = p.Pet_OwnerID WHERE ([Appointment_ID] = @Appointment_ID)" InsertCommand="sp_InsertApointment" UpdateCommand="UPDATE Appointment SET Vet_ID = @Vet_ID, Pet_ID = @Pet_ID, Payment = @Payment, Paid = @Paid, Appointment_Date = CONVERT(VARCHAR, CONVERT(Date, @Appointment_Date, 103)), Appointment_Time = @Appointment_Time, Vet_Comments = @Vet_Comments WHERE Appointment_ID = @Appointment_ID" InsertCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Appointment_ID" QueryStringField="id" Type="Int16" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:QueryStringParameter Name="Appointment_ID" QueryStringField="id" />
                    <asp:ControlParameter ControlID="txtVetID" Name="Vet_ID" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtPetID" Name="Pet_ID" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtPaid" Name="Payment" PropertyName="Text" />
                    <asp:ControlParameter ControlID="chkPaid" Name="Paid" PropertyName="Checked" />
                    <asp:ControlParameter ControlID="txtComments" Name="Vet_Comments" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtAppointmentDate" Name="Appointment_Date" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceMedications" runat="server" ConnectionString="<%$ ConnectionStrings:Vet_DataConnectionString %>" SelectCommand="SELECT m.Medication_ID, i.Name, m.Quantity, FORMAT(i.Cost, 'C', 'en-us') AS Cost, FORMAT((m.Quantity * i.Cost), 'C', 'en-us') AS 'Amount' FROM Appointment_Medication m INNER JOIN Appointment a ON a.Appointment_ID = m.Appointment_ID INNER JOIN Inventory i ON i.Medication_ID = m.Medication_ID WHERE m.Appointment_ID = @Appointment_ID" InsertCommand="INSERT INTO Appointment_Medication (Appointment_ID, Medication_ID, Quantity) VALUES (@Appointment_ID, @Medication_ID, @Quantity)" DeleteCommand="DELETE FROM Appointment_Medication WHERE Appointment_ID = @id AND Medication_ID = @Medication_ID">
            <DeleteParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtID" Name="Appointment_ID" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtMedicationID" Name="Medication_ID" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtQuantity" Name="Quantity" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtID" Name="Appointment_ID" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceInventory" runat="server" SelectCommand="SELECT Medication_ID, Name, Quantity FROM Inventory WHERE Name LIKE '%' + @Name + '%'  AND Quantity &gt; 0" ConnectionString="<%$ ConnectionStrings:Vet_DataConnectionString %>">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearchInventory" Name="Name" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="txtID" runat="server" Visible="False"></asp:TextBox>
    </form>
</body>
</html>
