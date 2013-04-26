<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="CustomerOrderDetails.aspx.vb" Inherits="CustomerOrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/ProjectDatabase.mdb"
                        SelectCommand="SELECT Customers.CustomerID, Orders.OrderID, Orders.Item, Orders.Cost
                                       FROM 
                                       Orders 
                                       INNER JOIN 
                                       Customers 
                                       ON 
                                       Orders.CustomerID = Customers.CustomerID">
</asp:AccessDataSource>
    
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
              DataKeyNames="CustomerID" DataSourceID="AccessDataSource1">

    <Columns>
        
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
        <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
        <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
        <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
    
    </Columns>
    
</asp:GridView>
    
<asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/ProjectDatabase.mdb" 
                      SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = ?)">
        
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="CustomerID" PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
    
</asp:AccessDataSource>

<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="AccessDataSource2">

    <Columns>
            
        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
        <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
        <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Telephone" HeaderText="Telephone" SortExpression="Telephone" />
        
    </Columns>

</asp:GridView>

</asp:Content>

