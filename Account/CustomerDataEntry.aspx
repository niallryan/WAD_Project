<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="CustomerDataEntry.aspx.vb" Inherits="customerdataentry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="CustomerID" DataSourceID="ObjectDataSource1">
    
    <EditItemTemplate>

        CustomerID:
        <asp:Label ID="CustomerIDLabel1" runat="server" Text='<%# Eval("CustomerID") %>' /><br />

        Firstname:
        <asp:TextBox ID="FirstnameTextBox" runat="server" Text='<%# Bind("Firstname") %>' /><br />

        Surname:
        <asp:TextBox ID="SurnameTextBox" runat="server" Text='<%# Bind("Surname") %>' /><br />
           
        City:
        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' /><br />

        Email:
        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' /><br />

        Telephone:
        <asp:TextBox ID="TelephoneTextBox" runat="server" Text='<%# Bind("Telephone") %>' /><br />

        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
        &nbsp;
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        
    </EditItemTemplate>
        
    <InsertItemTemplate>
       
        CustomerID:
        <asp:TextBox ID="CustomerIDTextBox" runat="server" Text='<%# Bind("CustomerID") %>' />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="CustomerIDTextBox" 
                                    ErrorMessage="You must enter a Customer ID">
        </asp:RequiredFieldValidator><br />
            
        Firstname:
        <asp:TextBox ID="FirstnameTextBox" runat="server" Text='<%# Bind("Firstname") %>' /><br />
            
        Surname:
        <asp:TextBox ID="SurnameTextBox" runat="server" Text='<%# Bind("Surname") %>' /><br />
            
        City:
        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' /><br />
            
        Email:
        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="EmailTextBox" Display="Dynamic" 
                                        ErrorMessage="Please enter a valid email address." 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
        </asp:RegularExpressionValidator><br />
            
        Telephone:
        <asp:TextBox ID="TelephoneTextBox" runat="server" Text='<%# Bind("Telephone") %>' /><br />
            
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
        &nbsp;
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    
    </InsertItemTemplate>
    
    <ItemTemplate>
        
        CustomerID:
        <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' /><br />
         
        Firstname:
        <asp:Label ID="FirstnameLabel" runat="server" Text='<%# Bind("Firstname") %>' /><br />

        Surname:
        <asp:Label ID="SurnameLabel" runat="server" Text='<%# Bind("Surname") %>' /><br />

        City:
        <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' /><br />
            
        Email:
        <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' /><br />
            
        Telephone:
        <asp:Label ID="TelephoneLabel" runat="server" Text='<%# Bind("Telephone") %>' /><br />

        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
        &nbsp;
        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
        &nbsp;
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        
    </ItemTemplate>

</asp:FormView>
    
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                      DeleteMethod="Delete" InsertMethod="Insert" 
                      OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomer" 
                      TypeName="CustomerDataSetTableAdapters.CustomersTableAdapter" 
                      UpdateMethod="Update">

    <DeleteParameters>
        <asp:Parameter Name="Original_CustomerID" Type="String" />
    </DeleteParameters>
        
    <InsertParameters>
        <asp:Parameter Name="CustomerID" Type="String" />
        <asp:Parameter Name="Firstname" Type="String" />
        <asp:Parameter Name="Surname" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Telephone" Type="String" />
    </InsertParameters>
        
    <UpdateParameters>
        <asp:Parameter Name="Firstname" Type="String" />
        <asp:Parameter Name="Surname" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Telephone" Type="String" />
        <asp:Parameter Name="Original_CustomerID" Type="String" />
    </UpdateParameters>

</asp:ObjectDataSource>

</asp:Content>