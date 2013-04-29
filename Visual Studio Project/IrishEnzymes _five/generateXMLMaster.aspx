<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="generateXMLMaster.aspx.vb" Inherits="generateXMLMaster" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

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
        objDataSet.WriteXml(Server.MapPath("currentStock.xml"))

  End Sub

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div style="height: 33px; width: 688px">

    <asp:Button ID="Button1" 
            runat="server" onclick="Page_Load" 
            Text="Generate XML File" Width="163px" />
    
    </div>

    <a href='currentStock.xml'>View XML file</a>
    <br />
    
    </div>
</asp:Content>

