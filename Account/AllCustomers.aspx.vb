
Partial Class AllCustomers
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) _
        Handles Me.Load
        Dim customersAdapter As New CustomerDataSetTableAdapters.CustomersTableAdapter()
        GridView1.DataSource = customersAdapter.GetCustomer()
        GridView1.DataBind()
    End Sub
End Class