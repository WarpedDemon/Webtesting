<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VetDetails.aspx.cs" Inherits="VetWebAp.VetDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    </style>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>    
        <asp:Image ID="Image1" runat="server" Height="133px" ImageUrl="~/vet.png" Width="131px" />
        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Segoe WP Black" Font-Size="XX-Large" Height="51px" Text="iCare Pet System" Width="347px"></asp:Label>
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
                    <asp:Label ID="Label14" runat="server" Text="Veterinarian Details" Font-Bold="True" Font-Size="X-Large"></asp:Label>
    </div>
    <div style="float: left; padding-right: 20px; width: auto;">
        <br />
        <asp:Label ID="Label1" runat="server" Text="First Name" Width="100px"></asp:Label>
        <asp:TextBox ID="txtFirstName" runat="server" Width="200px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Last Name" Width="100px"></asp:Label>
        <asp:TextBox ID="txtLastName" runat="server" Width="200px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Mobile No." Width="100px"></asp:Label>
        <asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Email" Width="100px"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" Width="350px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Address" Width="100px"></asp:Label>
        <asp:TextBox ID="txtAddress" runat="server" Width="350px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Postcode" Width="100px"></asp:Label>
        <asp:TextBox ID="txtPostcode" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="Skills" Width="100px"></asp:Label>
        <asp:TextBox ID="txtSkills" runat="server" Width="350px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="saveButton" />
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CssClass="cancelButton" />
        <asp:SqlDataSource ID="SqlDataSourceVets" runat="server" ConnectionString="<%$ ConnectionStrings:Vet_DataConnectionString %>" SelectCommand="SELECT [Vet_ID], [First_Name], [Last_Name], [Mobile_no], [Email], [Street_Address], [Postcode], [Skills] FROM [Vet] WHERE ([Vet_ID] = @Vet_ID)" InsertCommand="INSERT INTO Vet(First_Name, Last_Name, Mobile_no, Email, Street_Address, Postcode, Skills) VALUES (@First_Name, @Last_Name, @Mobile_no, @Email, @Street_Address, @Postcode, @Skills)" UpdateCommand="UPDATE Vet SET First_Name = @First_Name, Last_Name = @Last_Name, Mobile_no = @Mobile_no, Email = @Email, Street_Address = @Street_Address, Postcode = @Postcode, Skills = @Skills WHERE Vet_ID = @Vet_ID">
        <InsertParameters>
                <asp:ControlParameter ControlID="txtFirstName" Name="First_Name" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtLastName" Name="Last_Name" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtMobileNo" Name="Mobile_no" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtAddress" Name="Street_Address" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtPostcode" Name="Postcode" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtSkills" Name="Skills" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtNewID" Name="Vet_ID" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Vet_ID" QueryStringField="id" Type="Int16" />
        </SelectParameters>
        <UpdateParameters>
                <asp:ControlParameter ControlID="txtFirstName" Name="First_Name" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtLastName" Name="Last_Name" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtMobileNo" Name="Mobile_no" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtAddress" Name="Street_Address" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtPostcode" Name="Postcode" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtSkills" Name="Skills" PropertyName="Text" />
                <asp:QueryStringParameter Name="Vet_ID" QueryStringField="id" />
        </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        <div style="float: left; padding: 20px; margin: 20px; width: auto; min-width: 600px; border-style: outset;">
            <asp:Panel ID="Panel1" runat="server">
                <asp:Label ID="Label10" runat="server" Text="Availability Listing" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAvailability" Width="652px" AllowPaging="True" BorderColor="#F6F9FC" CellPadding="5" GridLines="None">
                    <AlternatingRowStyle BackColor="#F6F9FC" />
                        <Columns>
                            <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                            <asp:BoundField DataField="Days" HeaderText="Days" SortExpression="Days" />
                            <asp:BoundField DataField="Week Beginning" HeaderText="Week Beginning" SortExpression="Week Beginning" />
                    </Columns>
                    <HeaderStyle BackColor="#F6F9FC" />
                </asp:GridView>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server" Text="Month" Width="150px"></asp:Label>
                <asp:DropDownList ID="DropDownListMonths" runat="server" Width="146px">
                    <asp:ListItem Value="Jan">January</asp:ListItem>
                    <asp:ListItem Value="Feb">February</asp:ListItem>
                    <asp:ListItem Value="Mar">March</asp:ListItem>
                    <asp:ListItem Value="Apr">April</asp:ListItem>
                    <asp:ListItem Value="May">May</asp:ListItem>
                    <asp:ListItem Value="Jun">June</asp:ListItem>
                    <asp:ListItem Value="Jul">July</asp:ListItem>
                    <asp:ListItem Value="Aug">August</asp:ListItem>
                    <asp:ListItem Value="Sep">September</asp:ListItem>
                    <asp:ListItem Value="Oct">October</asp:ListItem>
                    <asp:ListItem Value="Nov">November</asp:ListItem>
                    <asp:ListItem Value="Dec">December</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="Label12" runat="server" Text="Week Beginning" Width="150px"></asp:Label>
                <asp:TextBox ID="txtWeekBegining" runat="server" Width="95px"></asp:TextBox>
                <br />
                <br />
                <asp:Label style="float: left;" ID="Label13" runat="server" Text="Days" Width="150px"></asp:Label>
                <div>
                <asp:CheckBox style="margin-right: 10px;" ID="chkMon" runat="server" Text="Monday" />
                <asp:CheckBox style="margin-right: 10px;" ID="chkTue" runat="server" Text="Tuesday" />
                <asp:CheckBox style="margin-right: 10px;" ID="chkWed" runat="server" Text="Wednesday" />
                <asp:CheckBox ID="chkThu" runat="server" Text="Thursday" />
                </div>
                <br />
                <div>
                <asp:CheckBox style="margin-left: 150px; margin-right: 10px;" ID="chkFri" runat="server" Text="Friday" />
                <asp:CheckBox style="margin-right: 10px;" ID="chkSat" runat="server" Text="Saturday" />
                <asp:CheckBox ID="chkSun" runat="server" Text="Sunday" />
                </div>
                <br />
                <asp:Button ID="btnAddAvailability" runat="server" Text="Add Availability" CssClass="addButton" OnClick="btnAddAvailability_Click" />
                <asp:SqlDataSource ID="SqlDataSourceAvailability" runat="server" ConnectionString="<%$ ConnectionStrings:Vet_DataConnectionString %>" SelectCommand="SELECT Vet_ID, MONTH AS 'Month', WEEK_BEGINNING AS 'Week Beginning', DAYS AS 'Days' FROM Vet_Availability WHERE (Vet_ID = @Vet_ID)" InsertCommand="INSERT INTO Vet_Availability(Vet_ID, MONTH, WEEK_BEGINNING, DAYS) VALUES (@Vet_ID, @Month, @Week_Beginning, @Days)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtNewID" Name="Vet_ID" PropertyName="Text" />
                        <asp:Parameter Name="Month" />
                        <asp:Parameter Name="Week_Beginning" />
                        <asp:Parameter Name="Days" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Vet_ID" QueryStringField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:Panel>
            <asp:TextBox ID="txtNewID" runat="server" Visible="False"></asp:TextBox>
            <br />
        </div>
    </form>
</body>
</html>
