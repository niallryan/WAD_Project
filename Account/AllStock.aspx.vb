Partial Class AllStock
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) _
        Handles Me.Load
        Dim stockAdapter As New StockDataSetTableAdapters.StockTableAdapter
        GridView1.DataSource = stockAdapter.GetStock()
        GridView1.DataBind()
    End Sub
End Class