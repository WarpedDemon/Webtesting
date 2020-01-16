<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="VetWebAp.Inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            float: right;
            height: 206px;
            margin-left: 0px;
        }
    </style>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" Height="133px" ImageUrl="~/vet.png" Width="131px" />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Segoe WP Black" Font-Size="XX-Large" Height="51px" Text="iCare Pet System" Width="347px"></asp:Label>
        <br />
        <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="menu" BackColor="#333333" Width="100%">
            <Items>
                <asp:MenuItem NavigateUrl="~/PetOwners.aspx" Text="Pet Owners" Value="Pet Owners"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Inventory.aspx" Text="Inventory" Value="Inventory"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Vets.aspx" Text="Vets" Value="Vets"></asp:MenuItem>
                <asp:MenuItem Text="Apointments" Value="Apointments" NavigateUrl="~/Appointments.aspx"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <div style="float: left; width: auto;">
            <br />
                    <asp:Label ID="Label10" runat="server" Text="Inventory" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    <br />
            <br />
            <asp:TextBox ID="txtSearch" runat="server" Width="250px"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
            <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" BorderColor="#F6F9FC" CellPadding="5" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="editInventory">
                <Columns>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/edit.jpg" ShowSelectButton="true"/>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Cost" HeaderText="Cost" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" SortExpression="ID" />
                </Columns>
                <AlternatingRowStyle BorderStyle="None" BackColor="#F6F9FC" />
                <HeaderStyle BackColor="#F6F9FC" BorderStyle="None" BorderWidth="0px" />
            </asp:GridView>
        </div>
        <div style="float: left; border-style: outset; padding: 20px; margin-top: 70px; margin-left: 20px;" class="auto-style2">
            <asp:Label ID="Label6" runat="server" Text="Name" Width="70px"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" Width="199px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Quantity" Width="70px"></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="Cost" Width="70px"></asp:Label>
            <asp:TextBox ID="txtCost" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Price" Width="70px"></asp:Label>
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            <br />
            <asp:CheckBox ID="editMode" runat="server" Visible="False" />
            <br />
            <asp:Button ID="btnAdd" runat="server" CssClass="addButton" Text="Add Inventory" OnClick="btnAdd_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="saveButton" />
            <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CssClass="cancelButton" />
        </div>
    </div>
    </form>
</body>
</html>
