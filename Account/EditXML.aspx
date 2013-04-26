<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EditXML.aspx.vb" Inherits="EditXML" Debug="true" %>

<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

<script runat=server>
   private i, j as integer
   private strOutput as string = ""
   public xmldoc as new XMLDataDocument()
   
   sub Page_Load(Sender as Object, e as EventArgs)
      if not Page.IsPostBack then
         GetData()
         BindControl()
      end if
    End Sub
   
   sub UpdateBtn_Click(Sender as Object, e as EventArgs)
        Dim FirstName As TextBox
        Dim LastName As TextBox
        Dim Address As TextBox
        Dim City As TextBox
        Dim County As TextBox 
       
      
      GetData()
      'update data
      For i = 0 To DataGrid1.Items.Count-1
            FirstName = DataGrid1.Items(i).FindControl("FirstName")
            LastName = DataGrid1.Items(i).FindControl("LastName")
            Address = DataGrid1.Items(i).FindControl("Address")
            City = DataGrid1.Items(i).FindControl("City")
            County = DataGrid1.Items(i).FindControl("County")
      
            xmldoc.DataSet.Tables(0).Rows(i)("FirstName") = FirstName.Text
            xmldoc.DataSet.Tables(0).Rows(i)("LastName") = LastName.Text
            xmldoc.DataSet.Tables(0).Rows(i)("Address") = Address.Text
            xmldoc.DataSet.Tables(0).Rows(i)("City") = City.Text
            xmldoc.DataSet.Tables(0).Rows(i)("County") = County.Text
     
      Next
      
      try
            xmldoc.Save(Server.MapPath("contact.xml"))
      catch
         output.Text = "Error updating data"
      end try
      
      BindControl()
   end sub
   
   sub GetData()
      try
            xmldoc.DataSet.ReadXml(Server.MapPath("contact.xml"))
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

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<a class="button three" href="ContactDetails.aspx">Click here to go back to the Contact page.</a>

<asp:Label id="output" runat="server" />

<form id="Form1">

    <asp:DataGrid id="DataGrid1" runat="server">
      
        <Columns>
            
            <asp:TemplateColumn HeaderText="FirstName">
                <ItemTemplate>
                    <asp:TextBox id="FirstName" runat="server" Text='<%# Container.DataItem("FirstName") %>' />
                </ItemTemplate>
            </asp:TemplateColumn>
         
            <asp:TemplateColumn HeaderText="LastName">
                <ItemTemplate>
                    <asp:TextBox id="LastName" runat="server" Text='<%# Container.DataItem("LastName") %>' />
                </ItemTemplate>
            </asp:TemplateColumn>
            
            <asp:TemplateColumn HeaderText="Address">
                <ItemTemplate>
                    <asp:TextBox id="Address" runat="server" Text='<%# Container.DataItem("Address") %>' />
                </ItemTemplate>         
            </asp:TemplateColumn>
         
            <asp:TemplateColumn HeaderText="City">            
                <ItemTemplate>
                    <asp:TextBox id="City" runat="server" Text='<%# Container.DataItem("City") %>' />
                </ItemTemplate>         
            </asp:TemplateColumn>
         
            <asp:TemplateColumn HeaderText="County">         
                <ItemTemplate>
                    <asp:TextBox id="County" runat="server" Text='<%# Container.DataItem("County") %>' />
                </ItemTemplate>         
            </asp:TemplateColumn>
      
        </Columns>     

    </asp:DataGrid>
   
    <asp:Button id="update" runat="server" OnClick="UpdateBtn_Click" text="Update!" />
   
</form>

</asp:Content>