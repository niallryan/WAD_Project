<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="search.aspx.vb" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:Label ID="Label1" runat="server" Text="Search Orders By ID"></asp:Label><br />

<asp:TextBox ID="txtsearch" runat="server"></asp:TextBox><br />

<asp:Button ID="Button1" runat="server" Text="Search" />

<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/ProjectDatabase.mdb" 
                      SelectCommand="SELECT * FROM [Orders] WHERE ([OrderID] = ?)">
        
    <SelectParameters>
        <asp:ControlParameter ControlID="txtsearch" Name="OrderID" PropertyName="Text" Type="String" />
    </SelectParameters>
    
</asp:AccessDataSource>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="AccessDataSource1">

    <Columns>
            
        <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
        <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
        <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
        <asp:BoundField DataField="StockID" HeaderText="StockID" SortExpression="StockID" />
        
    </Columns>
    
</asp:GridView>

</asp:Content>

