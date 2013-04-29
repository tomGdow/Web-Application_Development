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
<asp:DataList id="cdcatalog" runat="server" CellPadding="4" ForeColor="#333333">

    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />

<HeaderTemplate>
My CD Catalog
</HeaderTemplate>

    <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />

<ItemTemplate>
"<%# Container.DataItem("StockID")%>"
"<%# Container.DataItem(Description)%>"
<%# Container.DataItem("Price")%> -
<%# Container.DataItem("Stock_level")%>
<%# Container.DataItem("SupplierID")%>
</ItemTemplate>

    <AlternatingItemStyle BackColor="White" />
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />

<FooterTemplate>
Copyright Hege Refsnes
</FooterTemplate>

    <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />

</asp:DataList>
</form>

</body>
</html>
