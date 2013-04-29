<%@ Page Language="VB" AutoEventWireup="false" CodeFile="meCustPRACTICE.aspx.vb" Inherits="meCustPRACTICE" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" UseContextKey="True" 
></asp:AutoCompleteExtender>

<asp:AutoCompleteExtender ID="tbSearchCustomerRecords2_AutoCompleteExtender" 
        runat="server" TargetControlID="TextBox1" ServiceMethod="SearchCustomers2" MinimumPrefixLength="1"
            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" UseContextKey="True" 
></asp:AutoCompleteExtender>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/enzymeDatabase.mdb" 
            
            SelectCommand="SELECT * FROM [Stock] WHERE ([Description] = ?)" 
            DeleteCommand="DELETE FROM [Stock] WHERE (([StockID] = ?) OR ([StockID] IS NULL AND ? IS NULL))" 
            InsertCommand="INSERT INTO [Stock] ([StockID], [Description], [Price], [Stock_level], [SupplierID]) VALUES (?, ?, ?, ?, ?)" 
            UpdateCommand="UPDATE [Stock] SET [Description] = ?, [Price] = ?, [Stock_level] = ?, [SupplierID] = ? WHERE (([StockID] = ?) OR ([StockID] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="StockID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StockID" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="String" />
                <asp:Parameter Name="Stock_level" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Description" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="String" />
                <asp:Parameter Name="Stock_level" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="String" />
                <asp:Parameter Name="StockID" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="AccessDataSource1" 
            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="StockID" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="StockID" HeaderText="StockID" ReadOnly="True" 
                    SortExpression="StockID" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Stock_level" HeaderText="Stock_level" 
                    SortExpression="Stock_level" />
                <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" 
                    SortExpression="SupplierID" />
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
    
    </div>
    </form>
</body>
</html>
