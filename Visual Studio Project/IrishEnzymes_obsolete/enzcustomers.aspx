<%@ Page Language="VB" AutoEventWireup="false" CodeFile="enzcustomers.aspx.vb" Inherits="enzcustomers" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <br />
        &nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit" Height="39px" 
            Width="85px" />
        <asp:RoundedCornersExtender ID="Button1_RoundedCornersExtender" runat="server" 
            Enabled="True" TargetControlID="Button1">
        </asp:RoundedCornersExtender>
        <br />
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="35px" Width="163px"></asp:TextBox>
        
        <asp:DropShadowExtender ID="TextBox1_DropShadowExtender" runat="server" 
            Enabled="True" TargetControlID="TextBox1">
        </asp:DropShadowExtender>
        <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" 
            runat="server" Enabled="True" TargetControlID="TextBox1" 
            WatermarkText="Surname">
        </asp:TextBoxWatermarkExtender>
        
        <asp:AutoCompleteExtender ID="tbSearchCustomerRecords_AutoCompleteExtender" 
        runat="server" TargetControlID="TextBox1" ServiceMethod="SearchCustomers" MinimumPrefixLength="2"
            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" 
></asp:AutoCompleteExtender>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/enzymeDatabase.mdb" 
            SelectCommand="SELECT * FROM [Customers] WHERE ([Surname] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Surname" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="CustomerID" DataSourceID="AccessDataSource1" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" 
                    SortExpression="Firstname" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" 
                    SortExpression="Surname" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Telephone" HeaderText="Telephone" 
                    SortExpression="Telephone" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
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
        <br />
        <br />
        <asp:DragPanelExtender ID="GridView1_DragPanelExtender" runat="server" 
            DragHandleID="GridView1" Enabled="True" TargetControlID="GridView1">
        </asp:DragPanelExtender>
        <br />
    
    </div>
    </form>
</body>
</html>
