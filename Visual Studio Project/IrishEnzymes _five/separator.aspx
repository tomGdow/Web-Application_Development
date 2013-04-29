<%@ Import Namespace="System.Data" %>
<script runat="server">
sub Page_Load
if Not Page.IsPostBack then
  dim mycdcatalog=New DataSet
            mycdcatalog.ReadXml(MapPath("currentStock.xml"))
  cdcatalog.DataSource=mycdcatalog
  cdcatalog.DataBind()
end if
end sub
</script>

<html>
<body>

<form id="Form1" runat="server">
<asp:Repeater id="cdcatalog" runat="server">

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
