<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<script language="VB" runat="server">
  sub Page_Load(sender as Object, e as EventArgs)
    'Create a connection string
    Dim connString as String
        connString = "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=|DataDirectory|enzymeDatabase.mdb;"
    
    'Open a connection
    Dim objConnection as OleDbConnection
    objConnection = New OleDbConnection(connString)
    objConnection.Open()
    
    'Specify the SQL string
        Dim strSQL As String = "SELECT * FROM Suppliers"
    
    'Create a command object
    Dim objCommand as OleDbCommand
    objCommand = New OleDbCommand(strSQL, objConnection)

    'Get a datareader
    Dim objDataReader as OleDbDataReader
    objDataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection)

    'Do the DataBinding
    dgResults.DataSource = objDataReader
    dgResults.DataBind()    
    
    'Close the datareader/db connection
    objDataReader.Close()
  end sub
</script> 

<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<asp:DataGrid id="dgResults" runat="server" CellPadding="4" ForeColor="#333333" 
    GridLines="None" >
    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
    <EditItemStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
</asp:DataGrid>

</form>


