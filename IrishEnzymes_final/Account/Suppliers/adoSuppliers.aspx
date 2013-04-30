<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" CodeFile="adoSuppliers.aspx.vb"
    Inherits="Suppliers_adoSuppliers" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<script language="VB" runat="server">
    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        'Create a connection string
        Dim connString As String
        connString = "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=|DataDirectory|enzymeDatabase.mdb;"
    
        'Open a connection
        Dim objConnection As OleDbConnection
        objConnection = New OleDbConnection(connString)
        objConnection.Open()
    
        'Specify the SQL string
        Dim strSQL As String = "SELECT * FROM Suppliers"
    
        'Create a command object
        Dim objCommand As OleDbCommand
        objCommand = New OleDbCommand(strSQL, objConnection)

        'Get a datareader
        Dim objDataReader As OleDbDataReader
        objDataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection)

        'Do the DataBinding
        dgResults.DataSource = objDataReader
        dgResults.DataBind()
    
        'Close the datareader/db connection
        objDataReader.Close()
    End Sub
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <br />
        <asp:Panel ID="Panel1" runat="server" Height="32px" Width="521px">
            Supplier details as visualized with an ADO.net connection to the Suppliers Table
        </asp:Panel>
        <br />
        <asp:DataGrid ID="dgResults" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
            CssClass="marginLeft">
            <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
            <EditItemStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:DataGrid>
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
