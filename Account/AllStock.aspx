<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AllStock.aspx.vb" Inherits="AllStock" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
<div>
    
    <h1>All Stock</h1>
    
    <div class="nav">

        <div>
            <a class="button" href="Stock.xml">Current Stock XML</a> <br />
            <a class="button" href="AddHTMLToXML.aspx">View Stock.xml as HTML.</a> <br />
            <a class="button" href="StockDataEntry.aspx">Add, Edit or Delete Stock.</a>
        </div>

    </div>

    <p>            
        <asp:GridView ID="GridView1" runat="server" CssClass="DataWebControlStyle">
          <HeaderStyle CssClass="HeaderStyle" />
          <AlternatingRowStyle CssClass="AlternatingRowStyle" />
        </asp:GridView>
    </p>

</div>

<script language="VB" runat="server">

  Sub Page_Load(Sender As Object, E As EventArgs)

    Dim strConnection As String
    Dim strSQL        As String
    Dim objDataSet    As New DataSet()
    Dim objConnection As OleDbConnection
    Dim objAdapter    As OleDbDataAdapter

    ' set the connection and query details
        strConnection = "Provider=Microsoft.Jet.OLEDB.4.0; " & _
                        "Data Source=|DataDirectory|ProjectDatabase.mdb;"
        strSQL = "SELECT * FROM Stock;"

    ' open the connection and set the command
    objConnection = New OledbConnection(strConnection)
    objAdapter = New OledbDataAdapter(strSQL, objConnection)

    ' fill the dataset with the data
        objAdapter.Fill(objDataSet, "Stock")
        ' create an XML file called Stock and fill this with our data
        objDataSet.WriteXml(Server.MapPath("Stock.xml"))
    ' add a link to our web page to the XML file created
   

  End Sub

</script>

</asp:Content>

