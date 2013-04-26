<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OrdersADOConnection.aspx.vb" Inherits="OrdersADOConnection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<div class="nav">
    <a class="button" href="search.aspx">Search Orders By OrderID</a>
</div>

<asp:DataGrid id="dgResults" runat="server" />

<script language="VB" runat="server">
  sub Page_Load(sender as Object, e as EventArgs)
    'Create a connection string
    Dim connString as String
        connString = "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=|DataDirectory|ProjectDatabase.mdb;"
    
    'Open a connection
    Dim objConnection as OleDbConnection
    objConnection = New OleDbConnection(connString)
    objConnection.Open()
    
    'Specify the SQL string
    Dim strSQL as String = "SELECT * FROM Orders"
    
    'Create a command object
    Dim objCommand as OleDbCommand
    objCommand = New OleDbCommand(strSQL, objConnection)

    'Get a datareader
    Dim objDataReader as OleDbDataReader
    objDataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection)

    'Do the DataBinding
    dgResults.DataSource = objDataReader
    dgResults.DataBind()    
    
    'Close the datareader/db connection
    objDataReader.Close()
  end sub
</script>

</asp:Content>

