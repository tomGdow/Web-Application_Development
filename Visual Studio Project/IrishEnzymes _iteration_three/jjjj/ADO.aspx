<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>


<script runat="server">
    Sub Page_Load(sender As Object, e As EventArgs)
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

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div>
    <asp:DataGrid id="dgResults" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" >
        <AlternatingItemStyle BackColor="White" />
        <EditItemStyle BackColor="#fff" />
        <FooterStyle BackColor="#009B48" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#009B48" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:DataGrid>


        </div>
</asp:Content>

