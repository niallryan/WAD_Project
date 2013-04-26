<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="StockDataEntry.aspx.vb" Inherits="stockdataentry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="StockID" DataSourceID="ObjectDataSource1">

    <EditItemTemplate>
    
        StockID:
        <asp:Label ID="StockIDLabel1" runat="server" Text='<%# Eval("StockID") %>' /><br />
            
        Author:
        <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' /><br />
        
        Price:
        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' /><br />
            
        Stock_level:
        <asp:TextBox ID="Stock_levelTextBox" runat="server" Text='<%# Bind("Stock_level") %>' /><br />
            
        SupplierID:
        <asp:TextBox ID="SupplierIDTextBox" runat="server" Text='<%# Bind("SupplierID") %>' /><br />

        BookName:
        <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' /><br />
            
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
        &nbsp;
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        
    </EditItemTemplate>
        
    <InsertItemTemplate>
            
        StockID:
        <asp:TextBox ID="StockIDTextBox" runat="server" Text='<%# Bind("StockID") %>' />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StockIDTextBox" 
                                    ErrorMessage="You must enter a Stock ID">
        </asp:RequiredFieldValidator><br />
            
        Author:
        <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' /><br />
            
        Price:
        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' /><br />
        
        Stock_level:
        <asp:TextBox ID="Stock_levelTextBox" runat="server" Text='<%# Bind("Stock_level") %>' /><br />
            
        SupplierID:
        <asp:TextBox ID="SupplierIDTextBox" runat="server" Text='<%# Bind("SupplierID") %>' /><br />
            
        BookName:
        <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BookNameTextBox"
                                    ErrorMessage="You must enter a BookName">
        </asp:RequiredFieldValidator><br />
            
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
        &nbsp;
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        
    </InsertItemTemplate>
        
    <ItemTemplate>
    
        StockID:
        <asp:Label ID="StockIDLabel" runat="server" Text='<%# Eval("StockID") %>' /><br />
        
        Author:
        <asp:Label ID="AuthorLabel" runat="server" Text='<%# Bind("Author") %>' /><br />
        
        Price:
        <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' /><br />
            
        Stock_level:
        <asp:Label ID="Stock_levelLabel" runat="server" Text='<%# Bind("Stock_level") %>' /><br />
        
        SupplierID:
        <asp:Label ID="SupplierIDLabel" runat="server" Text='<%# Bind("SupplierID") %>' /><br />
         
        BookName:
        <asp:Label ID="BookNameLabel" runat="server" Text='<%# Bind("BookName") %>' /><br />

        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
        &nbsp;
        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
        &nbsp;
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        
    </ItemTemplate>
    
</asp:FormView>
    
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" 
                      OldValuesParameterFormatString="original_{0}" SelectMethod="GetStock" 
                      TypeName="StockDataSetTableAdapters.StockTableAdapter" UpdateMethod="Update">
        
        <DeleteParameters>
            <asp:Parameter Name="Original_StockID" Type="String" />
        </DeleteParameters>
        
        <InsertParameters>
            <asp:Parameter Name="StockID" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Price" Type="String" />
            <asp:Parameter Name="Stock_level" Type="Int32" />
            <asp:Parameter Name="SupplierID" Type="String" />
            <asp:Parameter Name="BookName" Type="String" />
        </InsertParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Price" Type="String" />
            <asp:Parameter Name="Stock_level" Type="Int32" />
            <asp:Parameter Name="SupplierID" Type="String" />
            <asp:Parameter Name="BookName" Type="String" />
            <asp:Parameter Name="Original_StockID" Type="String" />        
        </UpdateParameters>

    </asp:ObjectDataSource>

</asp:Content>