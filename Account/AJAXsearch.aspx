<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="AJAXsearch.aspx.vb" Inherits="AJAXsearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div>
    <a class="button two" href="Customers.aspx">Go back to Customers page.</a>
</div>

<div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:Label ID="Label1" runat="server" Text="Search Customers By Surname"></asp:Label>

        <br />

        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <br />

        <asp:AutoCompleteExtender ID="tbSearchCustomerRecords_AutoCompleteExtender" runat="server"
                                  TargetControlID="TextBox1" ServiceMethod="SearchCustomers"
                                  MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="false"
                                  CompletionSetCount="10" >   
        </asp:AutoCompleteExtender>

        <asp:Button ID="Button1" runat="server" Text="Submit" />

        <br />

        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/ProjectDatabase.mdb" 
                              SelectCommand="SELECT * FROM [Customers] WHERE ([Surname] = ?)">

            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Surname" PropertyName="Text" Type="String" />
            </SelectParameters>

        </asp:AccessDataSource>

        <br />

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                      AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CustomerID"
                      DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" 
                    SortExpression="Firstname" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" 
                    SortExpression="Surname" />
                <asp:BoundField DataField="City" HeaderText="City" 
                    SortExpression="City" />
                <asp:BoundField DataField="Telephone" HeaderText="Telephone" SortExpression="Telephone" />
               
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    
    </div>
</asp:Content>