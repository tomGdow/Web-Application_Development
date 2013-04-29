<%@ Page Language="VB" AutoEventWireup="true" CodeFile="formattedXML.aspx.vb" Inherits="Stock_formattedXML" %>

<%@ Import Namespace="System.Data" %>
<script runat="server">
sub Page_Load
if Not Page.IsPostBack then
  dim mystockList=New DataSet
            mystockList.ReadXml(MapPath("currentStock.xml"))
            stocklist.DataSource = mystockList
  stocklist.DataBind()
end if
end sub
</script>

<html>
<head>



    <link href="../../Styles/xmlStyle.css" rel="stylesheet" type="text/css" />



</head>
<body>

<form id="Form1" runat="server">
<asp:Repeater id="stocklist" runat="server">

<HeaderTemplate>
<table border="0" width="60%">
<tr>
<th>Stock ID</th>
<th>Description</th>
<th>Stock Level</th>
<th>Supplier ID</th>

</tr>
</HeaderTemplate>



<ItemTemplate>
<tr>
<td><%# Container.DataItem("StockID")%></td>
<td><%#Container.DataItem("Description")%></td>
<td><%#Container.DataItem("Stock_level")%></td>
<td><%#Container.DataItem("SupplierID")%></td>


</tr>
</ItemTemplate>

<SeparatorTemplate>
<tr>
<td colspan="6"></td>
</tr>
</SeparatorTemplate>

<FooterTemplate>
</table>
</FooterTemplate>

</asp:Repeater>
</form>
</body>
</html>
