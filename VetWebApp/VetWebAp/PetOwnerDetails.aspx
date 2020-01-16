<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PetOwnerDetails.aspx.cs" Inherits="VetWebAp.AddPetOwner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 1018px;
        }
        .auto-style2 {
            height: 1017px;
        }
    </style>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $("#txtPetDOB").datepicker({
                changeMonth: true,
                changeYear: true,
                showOn: "button",
                buttonImage: "images/calendar.gif",
                buttonImageOnly: true,
                buttonText: "Select date",
                dateFormat: "dd/mm/yy"
            });

            $("#txtPetDOB").datepicker.attr("autocomplete", "off");
        } );
    </script>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body style="height: 803px">
    <form id="form1" runat="server" class="auto-style2">
            <div class="auto-style1">
                <asp:Image ID="Image1" runat="server" Height="133px" ImageUrl="~/vet.png" Width="131px" />
                <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Names="Segoe WP Black" Font-Size="XX-Large" Height="51px" Text="iCare Pet System" Width="347px"></asp:Label>
                <br />
                <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="menu" BackColor="#333333" Width="100%">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/PetOwners.aspx" Text="Pet Owners" Value="Pet Owners"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Inventory.aspx" Text="Inventory" Value="Inventory"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Vets.aspx" Text="Vets" Value="Vets"></asp:MenuItem>
                        <asp:MenuItem Text="Appointments" Value="Appointments" NavigateUrl="~/Appointments.aspx"></asp:MenuItem>
                    </Items>
                </asp:Menu>
                <br />
                    <asp:Label ID="Label16" runat="server" Text="Pet Owner Details" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    <br />
                <br />
                <div style="float: left; padding-right: 20px; width: auto;">
                <asp:Label ID="Label1" runat="server" Text="First Name" Width="150px"></asp:Label>
                <asp:TextBox ID="txtFirstname" runat="server" Width="215px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Last Name" Width="150px"></asp:Label>
                <asp:TextBox ID="txtLastname" runat="server" Width="215px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Mobile Number" Width="150px"></asp:Label>
                <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Email" Width="150px"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" Width="215px"></asp:TextBox>
                <br />
                <br />
                <asp:CheckBox ID="chkID" runat="server" Text="ID Checked" TextAlign="Left" />
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Licence Number" Width="150px"></asp:Label>
                <asp:TextBox ID="txtLicence" runat="server" Width="150px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Medicare Number" Width="150px"></asp:Label>
                <asp:TextBox ID="txtMedicare" runat="server" Width="150px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Utility Bill" Width="150px"></asp:Label>
                <asp:TextBox ID="txtUtility" runat="server" Width="150px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label8" runat="server" Text="Address" Width="150px"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" Width="268px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="Postcode" Width="150px"></asp:Label>
                <asp:TextBox ID="txtPostcode" runat="server"></asp:TextBox>
                <br />
                <br />
                <br />
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="saveButton" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CssClass="cancelButton" />
                <br />
                <br />
                <br />
                </div>
                <div style="float: left; border-style: outset; padding: 20px;">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Label ID="Label10" runat="server" Text="Pets" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePets" Width="652px" AllowPaging="True" BorderColor="#F6F9FC" CellPadding="5" GridLines="None">
                        <AlternatingRowStyle BackColor="#F6F9FC" />
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                            <asp:BoundField DataField="Breed" HeaderText="Breed" SortExpression="Breed" />
                        </Columns>
                        <HeaderStyle BackColor="#F6F9FC" />
                    </asp:GridView>
                    <br />
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="Name" Width="150px"></asp:Label>
                    <asp:TextBox ID="txtPetName" runat="server" Width="300px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="Date of Birth" Width="150px"></asp:Label>
                    <asp:TextBox ID="txtPetDOB" runat="server" Width="95px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label13" runat="server" Text="Type" Width="150px"></asp:Label>
                    <asp:TextBox ID="txtPetType" runat="server" Width="200px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label14" runat="server" Text="Breed" Width="150px"></asp:Label>
                    <asp:TextBox ID="txtPetBreed" runat="server" Width="200px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btnAddPet" runat="server" Text="Add Pet" CssClass="addButton" OnClick="btnAddPet_Click" />
                    <asp:TextBox ID="txtPetOwnerID" runat="server" Visible="False"></asp:TextBox>
                </asp:Panel>
                <br />
                </div>
                <asp:SqlDataSource ID="SqlDataSourceOwners" runat="server" ConnectionString="<%$ ConnectionStrings:Vet_DataConnectionString %>" SelectCommand="SELECT * FROM [Pet_Owner] WHERE ([Pet_OwnerID] = @Pet_OwnerID)" UpdateCommand="UPDATE Pet_Owner SET First = @First, Last = @Last, Mobile_No = @Mobile, Email_Address = @Email, ID_checked = @ID_Checked, Licence_No = @Licence, Medicare_No = @Medicare, Utility_bill = @Utility, Street_Address = @Address, Postcode = @Postcode WHERE (Pet_OwnerID = @Pet_OwnerID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Pet_OwnerID" QueryStringField="id" Type="Int16" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtFirstname" Name="First" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLastname" Name="Last" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtAddress" Name="Address" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtLicence" Name="Licence" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtMedicare" Name="Medicare" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtMobile" Name="Mobile" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtPostcode" Name="Postcode" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtUtility" Name="Utility" PropertyName="Text" />
                        <asp:ControlParameter ControlID="chkID" Name="ID_Checked" PropertyName="Checked" />
                        <asp:QueryStringParameter Name="Pet_OwnerID" QueryStringField="id" Type="Int16" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourcePets" runat="server" ConnectionString="<%$ ConnectionStrings:Vet_DataConnectionString %>" SelectCommand="SELECT [Name], CONVERT(VARCHAR, CONVERT(DATE, [Dob]), 103) AS 'DOB', [type] AS 'Type', [Breed] FROM [Pet] WHERE ([Pet_OwnerID] = @Pet_OwnerID)" InsertCommand="INSERT INTO Pet(Pet_OwnerID, Name, Dob, type, Breed) VALUES (@Pet_OwnerID, @Name, CONVERT(VARCHAR, CONVERT(Date, @DOB, 103)), @Type, @Breed)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtPetOwnerID" Name="Pet_OwnerID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtPetName" Name="Name" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtPetDOB" Name="DOB" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtPetType" Name="Type" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtPetBreed" Name="Breed" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtPetOwnerID" Name="Pet_OwnerID" PropertyName="Text" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
    </form>
</body>
</html>
