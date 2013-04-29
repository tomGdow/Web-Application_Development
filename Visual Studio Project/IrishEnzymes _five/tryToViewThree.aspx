<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dbconn, sql, dbcomm, dbread
    dbconn = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;" & _
                                 "Data Source=|DataDirectory|Northwind.mdb;")
        dbconn.Open()
        sql = "SELECT * FROM Suppliers"
        dbcomm = New OleDbCommand(sql, dbconn)
        dbread = dbcomm.ExecuteReader()
        myNorthwindTwo.DataSource = dbread
        myNorthwindTwo.DataBind()
        dbread.Close()
        dbconn.Close()
    End Sub
</script>
<html>
<head>

<title>My Exercise Three</title>

</head>
<body>
<form id="Form1" runat="server">
<asp:Repeater id="myNorthwindTwo" runat="server">
<HeaderTemplate>
<table border="1" width="100%">
<tr>
<th>SupplierID</th>
<th>CompanyName</th>
<th>ContactName</th>
<th>ContactTitle</th>
<th>Address</th>
<th>City</th>
<th>Country</th>
</tr>
</HeaderTemplate>

<ItemTemplate>
<tr>
<td><%# Container.DataItem("SupplierID")%></td>
<td><%# Container.DataItem("Description")%></td>
<td><%# Container.DataItem("Price")%></td>
<td><%# Container.DataItem("Stock_level")%></td>
<td><%# Container.DataItem("SupplierID")%></td>


</tr>
</ItemTemplate>

<AlternatingItemTemplate>
<tr bgcolor="#e8e8e8">
<td><%# Container.DataItem("SupplierID")%></td>
<td><%# Container.DataItem("Description")%></td>
<td><%# Container.DataItem("Price")%></td>
<td><%# Container.DataItem("Stock_level")%></td>
<td><%# Container.DataItem("SupplierID")%></td>
</AlternatingItemTemplate>

<FooterTemplate>
</table>
</FooterTemplate>

</asp:Repeater>
</form>

</body>
</html>