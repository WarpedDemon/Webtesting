<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="VetWebAp.Appointments" %>

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
            height: 753px;
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
                    <asp:Label ID="Label10" runat="server" Text="Appointments" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    <br />
        <br />
        <asp:Button ID="btnAdd" runat="server" CssClass="addButton" OnClick="btnAdd_Click" Text="New Appointment" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" CellPadding="5" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/edit.jpg" ShowEditButton="False" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                <asp:BoundField DataField="Vet_ID" HeaderText="Vet_ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                <asp:BoundField DataField="Veterinarian" HeaderText="Veterinarian" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Pet" HeaderText="Pet" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Pet Owner" HeaderText="Pet Owner" ReadOnly="True" SortExpression="ID" />
                <asp:CheckBoxField DataField="Paid" HeaderText="Paid" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Appointment_Date" HeaderText="Appointment Date" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Appointment_Time" HeaderText="Appointment Time" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Vet_Comments" HeaderText="Vet Comments" ReadOnly="True" SortExpression="ID" />
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
