<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="searchStock.aspx.vb" Inherits="searchStock" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div>
    
            <br />
        <asp:Panel ID="Panel1" runat="server" Height="32px" Width="521px">
            Search Stock by Stock Id (Integer) or Description (eg Alcohol dehydrogenase)</asp:Panel>
            <br />
            <asp:Panel ID="Panel2" runat="server" Height="50px" style="margin-right: 0px" 
                Width="307px">
                <asp:TextBox ID="TextBox1" runat="server" Height="35px" Width="163px"></asp:TextBox>
                <asp:DropShadowExtender ID="TextBox1_DropShadowExtender" runat="server" 
            Enabled="True" TargetControlID="TextBox1">
                </asp:DropShadowExtender>
                <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" 
            runat="server" Enabled="True" TargetControlID="TextBox1" 
            WatermarkText="Stock Id or Description">
                </asp:TextBoxWatermarkExtender>
                <asp:AutoCompleteExtender ID="tbSearchCustomerRecords_AutoCompleteExtender" 
        runat="server" TargetControlID="TextBox1" ServiceMethod="SearchStock" MinimumPrefixLength="2"
            CompletionInterval="100" EnableCaching="false" 
    CompletionSetCount="10" UseContextKey="True" 
>
                </asp:AutoCompleteExtender>
                <asp:AutoCompleteExtender ID="tbSearchCustomerRecords2_AutoCompleteExtender" 
        runat="server" TargetControlID="TextBox1" ServiceMethod="SearchStock2" MinimumPrefixLength="1"
            CompletionInterval="100" EnableCaching="false" 
    CompletionSetCount="10" UseContextKey="True" 
>
                </asp:AutoCompleteExtender>
                <asp:Button ID="Button1" runat="server" CssClass="rightfloat" Height="39px" 
                    style="margin-top: 0px" Text="Submit" Width="85px" />
                <asp:DropShadowExtender ID="Button1_DropShadowExtender" runat="server" 
                    Enabled="True" TargetControlID="Button1">
                </asp:DropShadowExtender>
                <asp:RoundedCornersExtender ID="Button1_RoundedCornersExtender" runat="server" 
                    Enabled="True" TargetControlID="Button1">
                </asp:RoundedCornersExtender>
            </asp:Panel>
         
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/enzymeDatabase.mdb" 
            
            
                SelectCommand="SELECT Stock.StockID, Stock.Description, Stock.Price, Stock.Stock_level, Stock.SupplierID, Suppliers.SupplierName, Suppliers.SupplierAddress FROM (Stock INNER JOIN Suppliers ON Stock.SupplierID = Suppliers.SupplierID) WHERE (Stock.Description = ?) OR (Stock.StockID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Description" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="TextBox1" Name="StockID" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="AccessDataSource1" 
            CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="StockID" HeaderText="StockID" 
                    SortExpression="StockID" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Stock_level" HeaderText="Stock_level" 
                    SortExpression="Stock_level" />
                <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" 
                    SortExpression="SupplierID" />
                <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" 
                    SortExpression="SupplierName" />
                <asp:BoundField DataField="SupplierAddress" HeaderText="SupplierAddress" 
                    SortExpression="SupplierAddress" />
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
</asp:Content>

