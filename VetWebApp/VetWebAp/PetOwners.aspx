<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PetOwners.aspx.cs" Inherits="VetWebAp.PetOwner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 567px;
        }
    </style>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
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
                    <asp:Label ID="Label10" runat="server" Text="Pet Owners" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    <br />
                <br />
                <asp:TextBox ID="txtSearch" runat="server" Width="250px"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
                <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />
                <br />
        <asp:Button ID="btnAdd" runat="server" CssClass="addButton" OnClick="btnAdd_Click" Text="Add Pet Owner" />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" BorderColor="#F6F9FC" CellPadding="5" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/edit.jpg" ShowEditButton="False" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                <asp:BoundField DataField="Pet Owner" HeaderText="Pet Owner" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Mobile No." HeaderText="Mobile No." ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Licence No." HeaderText="Licence No." ReadOnly="True" SortExpression="ID" />
                <asp:CheckBoxField DataField="ID Checked" HeaderText="ID Checked" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Medicare No." HeaderText="Medicare No." ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Utility Bill" HeaderText="Utility Bill" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Postcode" HeaderText="Postcode" ReadOnly="True" SortExpression="ID" />
            </Columns>
            <AlternatingRowStyle BorderStyle="None" BackColor="#F6F9FC" />
            <EditRowStyle BorderStyle="None" />
            <HeaderStyle BackColor="#F6F9FC" BorderStyle="None" BorderWidth="0px" />
            <RowStyle BorderStyle="None" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
