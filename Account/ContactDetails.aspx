<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ContactDetails.aspx.vb" Inherits="Account_ContactUs" %>

<%@ Import Namespace="System.XML" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<form method="post" action="EditXML.aspx" ID=Form1>

    <p>Complete the fields below to submit your contact details.</p>

    <strong>Contact Details</strong>
 
 <table>
	
    <asp:label id="lblXMLFile" runat="server" />
   
        <tr>
            <td>FirstName:</td> 
            <td><asp:Textbox id="txtFirstName" runat="server" width="400" visible="True"></asp:Textbox></td>
        </tr>
        <tr>
            <td>LastName:</td> 
            <td><asp:Textbox id="txtLastName" runat="server" width="400" visible="True"></asp:Textbox></td>
        </tr>
        <tr>
            <td>Address: </td>
            <td><asp:Textbox id="txtAddress" runat="server" visible="True" width="400"/></td>
        </tr>
        <tr>
            <td>City: </td> 
            <td><asp:Textbox id="txtCity" runat="server" width="400" visible="True"></asp:Textbox></td>
        </tr>
        <tr>
            <td>County: </td> 
            <td><asp:Textbox id="txtCounty" runat="server" width="400" visible="True"></asp:Textbox></td>
        </tr>

</table>

<p><asp:Button id="btnWriteXML" text="Write XML Document" OnClick="btnWriteXML_onClick" runat="server" /></p>

</form>

<a class="button one" href="EditXML.aspx">Edit Contact.xml File</a>

<script language="VB" runat="server" ID=Script1>	

Sub btnWriteXML_OnClick(sender As Object, e As EventArgs)
   Try
   
    Dim enc as Encoding
	Dim objXMLTW as new XMLTextWriter(Server.MapPath("contact.xml"), enc)
	objXMLTW.WriteStartDocument
	objXMLTW.WriteStartElement("Contact")
	
             objXMLTW.WriteStartElement("FirstName")
	objXMLTW.WriteString(Request("txtFirstName"))
	objXMLTW.WriteEndElement

             objXMLTW.WriteStartElement("LastName")
             objXMLTW.WriteString(Request("txtLastName"))
	objXMLTW.WriteEndElement
	
            objXMLTW.WriteStartElement("Address")
            objXMLTW.WriteString(Request("txtAddress"))
	objXMLTW.WriteEndElement
	
            objXMLTW.WriteStartElement("City")
            objXMLTW.WriteString(Request("txtCity"))
	objXMLTW.WriteEndElement
	
            objXMLTW.WriteStartElement("County")
            objXMLTW.WriteString(Request("txtCounty"))
	objXMLTW.WriteEndElement
	
             objXMLTW.WriteEndElement()
             objXMLTW.WriteEndDocument()
             objXMLTW.Flush()
	objXMLTW.Close

	ReadXML(Server.MapPath("contact.xml"))
	
	
	  Catch Ex as Exception
		lblXMLFile.Text = "The following error occurred: " & Ex.Message
   End Try
End Sub

Sub ReadXML(FileName as String)
Try

lblXMLFile.Text =""
Dim objXMLTR as new  XMLTextReader(FileName)
dim sCategory as String
dim bNested as Boolean
dim sLastElement as String
Dim sValue as String

Do While objXMLTR.Read


		If objXMLTR.NodeType = XMLNodeType.Element Then
			 if bNested = True  then
			    if sCategory <> "" then sCategory = sCategory & " > "  
			    sCategory = sCategory &  sLastElement
			 End if 
			  bNested = True
			 sLastElement = objXMLTR.Name
			 
		Else If objXMLTR.NodeType = XMLNodeType.Text or _
		  objXMLTR.NodeType = XMLNodeType.CData Then
			bNested = False
			sCategory = "<P>" & sCategory
			sValue = objXMLTR.value 
			 lblXMLFile.Text  = lblXMLFile.Text & "<B>" & sCategory & _
			    "<BR>" &  sLastElement & "</B><BR>" &  sValue 
			 sLastElement = ""
		     sCategory = ""
		End if
	Loop
	objXMLTR.close
Catch Ex as Exception
	lblXMLFile.Text = "The following error occurred: " & Ex.Message
End Try

End Sub
  </script>

</asp:Content>