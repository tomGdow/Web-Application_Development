<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="searchOrders.aspx.vb" Inherits="searchOrders" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div>
    
         <br />
        <asp:Panel ID="Panel1" runat="server" Height="32px" Width="521px">
            Search Orders by Custormer Id (Integer) or Item (eg Monoamine oxidase)</asp:Panel>
            <br />
            <br />
            <asp:Panel ID="Panel2" runat="server" Height="50px" Width="302px">
                <asp:TextBox ID="TextBox1" runat="server" Height="35px" Width="163px"></asp:TextBox>
                <asp:DropShadowExtender ID="TextBox1_DropShadowExtender" runat="server" 
            Enabled="True" TargetControlID="TextBox1">
                </asp:DropShadowExtender>
                <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" 
            runat="server" Enabled="True" TargetControlID="TextBox1" 
            WatermarkText="Customer Id or Item Name">
                </asp:TextBoxWatermarkExtender>
                <asp:AutoCompleteExtender ID="tbSearchCustomerRecords_AutoCompleteExtender" 
        runat="server" TargetControlID="TextBox1" ServiceMethod="SearchOrders" MinimumPrefixLength="2"
            CompletionInterval="100" EnableCaching="false" 
    CompletionSetCount="10" UseContextKey="True" 
>
                </asp:AutoCompleteExtender>
                <asp:Button ID="Button1" runat="server" CssClass="rightfloat" Height="39px" 
                    Text="Submit" Width="85px" />
                <asp:DropShadowExtender ID="Button1_DropShadowExtender" runat="server" 
                    Enabled="True" TargetControlID="Button1">
                </asp:DropShadowExtender>
                <asp:RoundedCornersExtender ID="Button1_RoundedCornersExtender" runat="server" 
                    Enabled="True" TargetControlID="Button1">
                </asp:RoundedCornersExtender>
         </asp:Panel>
           
      
        <br />
         <asp:AutoCompleteExtender ID="AutoCompleteExtender1" 
        runat="server" TargetControlID="TextBox1" ServiceMethod="SearchOrders2" MinimumPrefixLength="1"
            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" UseContextKey="True" 
></asp:AutoCompleteExtender>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/enzymeDatabase.mdb" 
            
            
             SelectCommand="SELECT Orders.OrderID, Orders.CustomerID, Orders.Item, Orders.Cost, Orders.StockID, Customers.Surname, Customers.Firstname FROM (Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID) WHERE (Orders.Item = ?) OR (Orders.CustomerID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Item" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="TextBox1" Name="CustomerID" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>

        <asp:GridView ID="GridView1" runat="server" DataSourceID="AccessDataSource1" 
            AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" 
            GridLines="None" AutoGenerateColumns="False" DataKeyNames="CustomerID">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" 
                    SortExpression="OrderID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="StockID" HeaderText="StockID" 
                    SortExpression="StockID" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" 
                    SortExpression="Surname" />
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" 
                    SortExpression="Firstname" />
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
         <asp:DragPanelExtender ID="GridView1_DragPanelExtender" runat="server" 
             DragHandleID="GridView1" Enabled="True" TargetControlID="GridView1">
         </asp:DragPanelExtender>
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
         <br />
        <br />
        <br />
        <br />
        <br />
        <br />


    
    </div>
</asp:Content>

