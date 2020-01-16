<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vets.aspx.cs" Inherits="VetWebAp.Vets" %>

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
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Segoe WP Black" Font-Size="XX-Large" Height="51px" Text="iCare Pet System" Width="347px"></asp:Label>
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
                    <asp:Label ID="Label10" runat="server" Text="Veterinarians" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    <br />
            <br />
            <asp:TextBox ID="txtSearch" runat="server" Width="250px"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
            <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />
            <br />
        <asp:Button ID="btnAdd" runat="server" CssClass="addButton" OnClick="btnAdd_Click" Text="Add Vet" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="True" BorderColor="#F6F9FC" CellPadding="5" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#F6F9FC" />
            <Columns>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/edit.jpg" ShowEditButton="False" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="false"/>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="First Name" />
                <asp:BoundField DataField="Mobile No." HeaderText="Mobile No." SortExpression="Mobile No." />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Postcode" HeaderText="Postcode" SortExpression="Postcode" />
                <asp:BoundField DataField="Skills" HeaderText="Skills" SortExpression="Skills" />
            </Columns>
            <HeaderStyle BackColor="#F6F9FC" BorderStyle="None" BorderWidth="0px" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Vet_DataConnectionString %>" SelectCommand="SELECT [Vet_ID] AS 'ID', [First_Name] AS 'First Name', [Last_Name] AS 'Last Name', [Mobile_no] AS 'Mobile No.', [Email], [Street_Address] AS 'Address', [Postcode], [Skills] FROM [Vet] ORDER BY First_Name"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
