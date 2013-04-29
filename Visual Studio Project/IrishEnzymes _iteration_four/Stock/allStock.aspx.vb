

Partial Class allStock
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) _
        Handles Me.Load
        Dim productsAdapter As New DataSet1TableAdapters.StockTableAdapter
        GridView1.DataSource = productsAdapter.GetProducts()
        GridView1.DataBind()
    End Sub
End Class

