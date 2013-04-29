<%@ Page Language="VB" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat=server>
   private i, j as integer
   private strOutput as string = ""
   public xmldoc as new XMLDataDocument()
   
   sub Page_Load(Sender as Object, e as EventArgs)
      if not Page.IsPostBack then
         GetData()
         BindControl()
      end if
   end sub
   
   sub UpdateBtn_Click(Sender as Object, e as EventArgs)
        Dim StockID As TextBox
        Dim Description As TextBox
        Dim Price As TextBox
        Dim Stock_level As TextBox
        Dim SupplierID As TextBox
      
      GetData()
      'update data
      For i = 0 To DataGrid1.Items.Count-1
            StockID = DataGrid1.Items(i).FindControl("StockID")
            Description = DataGrid1.Items(i).FindControl("Description")
            Price = DataGrid1.Items(i).FindControl("Price")
            Stock_level = DataGrid1.Items(i).FindControl("Stock_level")
            SupplierID = DataGrid1.Items(i).FindControl("SupplierID")
      
            xmldoc.DataSet.Tables(0).Rows(i)("stockid") = StockID.Text
            xmldoc.DataSet.Tables(0).Rows(i)("description") = Description.Text
            xmldoc.DataSet.Tables(0).Rows(i)("price") = Price.Text
            xmldoc.DataSet.Tables(0).Rows(i)("stock_level") = Stock_level.Text
            xmldoc.DataSet.Tables(0).Rows(i)("supplierid") = SupplierID.Text
      Next
      
      try
            xmldoc.Save(Server.MapPath("currentStock.xml"))
      catch
         output.Text = "Error updating data"
      end try
      
      BindControl()
   end sub
   
   sub GetData()
      try
         xmldoc.DataSet.ReadXml(Server.MapPath("currentStock.xml"))
      catch ex as Exception
         output.Text = "Error accessing XML file"
      end try
   end sub
   
   sub BindControl()
      DataGrid1.DataSource = xmldoc.DataSet
      DataGrid1.DataMember = xmldoc.DataSet.Tables(0).TableName
      DataGrid1.DataBind()
   end sub
</script>

<html><body>
   
   
   <center>
   <asp:Button id="update" runat="server"
      OnClick="UpdateBtn_Click"
      text="Update!" />
   </center>
   </form>
</body>
</html>

