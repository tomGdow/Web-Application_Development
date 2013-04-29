<%@ Page Language="VB" AutoEventWireup="True" CodeFile="meNineAgain.aspx.vb" Inherits="meNineAgain" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<script language="VB" runat="server">

  Sub Page_Load(Sender As Object, E As EventArgs)

    Dim strConnection As String
    Dim strSQL        As String
    Dim objDataSet    As New DataSet()
    Dim objConnection As OleDbConnection
    Dim objAdapter    As OleDbDataAdapter

    ' set the connection and query details
        strConnection = "Provider=Microsoft.Jet.OLEDB.4.0; " & _
                        "Data Source=|DataDirectory|enzymeDatabase.mdb;"
        strSQL = "SELECT * FROM Stock;"

    ' open the connection and set the command
    objConnection = New OledbConnection(strConnection)
    objAdapter = New OledbDataAdapter(strSQL, objConnection)

    ' fill the dataset with the data
        objAdapter.Fill(objDataSet, "Stock")
        ' create an XML file called currentStock and fill this with our data
        objDataSet.WriteXml(Server.MapPath("currentStocktwoow.xml"))
        
        

  End Sub

</script>
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
   <asp:Button ID="Button1" 
            runat="server" onclick="Page_Load" 
            Text="Create &quot;current_stock.xml&quot; file" />
    
    </div>

    <a href='currentStocktwoow.xml'>View XML file</a>
    <br />
    <asp:Button ID="Button2" runat="server" Height="48px" Text="Button" 
        Width="118px" />
    <br />
    <br />
    <asp:Button ID="Button3" runat="server" CssClass="rightfloat" Height="39px" 
                        Text="Submit" Width="85px" />
                    <asp:DropShadowExtender ID="Button1_DropShadowExtender" runat="server" 
                        Enabled="True" TargetControlID="Button1">
                    </asp:DropShadowExtender>
                    <asp:RoundedCornersExtender ID="Button1_RoundedCornersExtender" runat="server" 
                        Enabled="True" TargetControlID="Button1">
                    </asp:RoundedCornersExtender>
    <br />
    </form>
</body>
</html>
