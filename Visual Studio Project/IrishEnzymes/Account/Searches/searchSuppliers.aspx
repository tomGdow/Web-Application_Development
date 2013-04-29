<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="searchSuppliers.aspx.vb" Inherits="searchSuppliers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="32px" Width="521px">
            Search Suppliers by Name (eg Sigma)</asp:Panel>
        <br />
        <br />
        <asp:Panel ID="Panel2" runat="server" Height="50px" Width="308px">
            <asp:TextBox ID="TextBox1" runat="server" Height="35px" Width="163px"></asp:TextBox>
            <asp:DropShadowExtender ID="TextBox1_DropShadowExtender" runat="server" Enabled="True"
                TargetControlID="TextBox1">
            </asp:DropShadowExtender>
            <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" runat="server"
                Enabled="True" TargetControlID="TextBox1" WatermarkText="Supplier Name">
            </asp:TextBoxWatermarkExtender>
            <asp:AutoCompleteExtender ID="tbSearchCustomerRecords_AutoCompleteExtender" runat="server"
                TargetControlID="TextBox1" ServiceMethod="SearchCustomers" MinimumPrefixLength="2"
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
        </asp:Panel>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/enzymeDatabase.mdb"
            SelectCommand="SELECT * FROM Suppliers WHERE (SupplierName = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="SupplierName" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="AccessDataSource1" CellPadding="4"
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
