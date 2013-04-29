<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="searchCustomers2.aspx.vb" Inherits="searchCustomers2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="32px" Width="521px">
            Search Customers by Firstname (eg Thomas) or by Surname (eg Dowling)<br />
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" Height="32px" Width="521px">
            Click on Select in Search Results to See Customer Order Details<br />
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server" Height="50px" Width="333px">
            <asp:TextBox ID="TextBox1" runat="server" Height="35px" Width="195px"></asp:TextBox>
            <asp:DropShadowExtender ID="TextBox1_DropShadowExtender" runat="server" Enabled="True"
                TargetControlID="TextBox1">
            </asp:DropShadowExtender>
            <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" runat="server"
                Enabled="True" TargetControlID="TextBox1" WatermarkText="Surname or Firstname">
            </asp:TextBoxWatermarkExtender>
            <%-- first AutoCompleExtender refers to SearchCustomers function  --%>
            <asp:AutoCompleteExtender ID="tbSearchCustomerRecords_AutoCompleteExtender" runat="server"
                TargetControlID="TextBox1" ServiceMethod="SearchCustomers" MinimumPrefixLength="2"
                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" UseContextKey="True">
            </asp:AutoCompleteExtender>
            <%-- second AutoCompleExtender refers to SearchCustomers2 function  --%>
            <asp:AutoCompleteExtender ID="tbSearchCustomerRecords2_AutoCompleteExtender" runat="server"
                TargetControlID="TextBox1" ServiceMethod="SearchCustomers2" MinimumPrefixLength="2"
                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" UseContextKey="True">
            </asp:AutoCompleteExtender>
            <asp:Button ID="Button1" runat="server" CssClass="rightfloat" Height="39px" Text="Submit"
                Width="85px" />
            <asp:DropShadowExtender ID="Button1_DropShadowExtender" runat="server" Enabled="True"
                TargetControlID="Button1">
            </asp:DropShadowExtender>
            <asp:RoundedCornersExtender ID="Button1_RoundedCornersExtender" runat="server" Enabled="True"
                TargetControlID="Button1">
            </asp:RoundedCornersExtender>
            <br />
            <br />
        </asp:Panel>
        <br />
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/enzymeDatabase.mdb"
            SelectCommand="SELECT * FROM Customers WHERE (Firstname = ?) OR (Surname = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Firstname" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox1" Name="Surname" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CustomerID" DataSourceID="AccessDataSource1"
            ForeColor="#333333" GridLines="None" CssClass="marginLeftTwo">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Telephone" HeaderText="Telephone" SortExpression="Telephone" />
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
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/enzymeDatabase.mdb"
            SelectCommand="SELECT Orders.OrderID, Orders.CustomerID, Orders.Item, Orders.Cost, Orders.StockID, Customers.Firstname, Customers.Surname FROM (Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID) WHERE (Orders.CustomerID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="CustomerID" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccessDataSource2"
            ForeColor="#333333" GridLines="None" CssClass="marginLeft">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="StockID" HeaderText="StockID" SortExpression="StockID" />
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
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
    </div>
</asp:Content>
