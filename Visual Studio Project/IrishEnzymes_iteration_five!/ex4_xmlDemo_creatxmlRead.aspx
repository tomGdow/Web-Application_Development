<%@ Page language="vb"%>
<%@ Import Namespace="System.XML" %>
<html><head>

  <script language="VB" runat="server" ID=Script1>	


Sub btnWriteXML_OnClick(sender As Object, e As EventArgs)
   Try
   
    Dim enc as Encoding
	'Create file, overwrite if exists
	'enc is encoding object required by constructor
	'It is null, so default encoding is used
	Dim objXMLTW as new XMLTextWriter(Server.MapPath("applicant.xml"), enc)
	objXMLTW.WriteStartDocument
	'Top level (Parent element)
	objXMLTW.WriteStartElement("Applicant")
	
	'Child elements, from request form
	objXMLTW.WriteStartElement("Name")
	objXMLTW.WriteString(Request("txtName"))
	objXMLTW.WriteEndElement

	objXMLTW.WriteStartElement("Address")
	objXMLTW.WriteString(Request("txtAddress"))
	objXMLTW.WriteEndElement
	
	objXMLTW.WriteStartElement("City")
	objXMLTW.WriteString(Request("txtCity"))
	objXMLTW.WriteEndElement
	
	objXMLTW.WriteStartElement("State")
	objXMLTW.WriteString(Request("txtState"))
	objXMLTW.WriteEndElement
	
	objXMLTW.WriteStartElement("Zip")
	objXMLTW.WriteString(Request("txtZip"))
	objXMLTW.WriteEndElement
	
	objXMLTW.WriteEndElement 'End top level element
	objXMLTW.WriteEndDocument 'End Document
	objXMLTW.Flush 'Write to file
	objXMLTW.Close
	
	
	
	 
   End Try
End Sub


  </script>
</head>
<body>
<center><b>XML Text Reader/Text Writer Demo</b></center>
<form method="post" action="ex4_xmlDemo_creatxmlRead.aspx" runat="server" ID=Form1>

 <table WIDTH = "100%">
	<tr>
	

	<TD width="50%" valign = top>
	Complete the fields below to create and display the XML file "applicant.xml" (write permission for the Internet Anonymous user must be enabled)<P>
	
	<p><strong>Applicant</strong>
      <p><table><tr><td>
      Name:</td> 
<td><asp:Textbox id=txtName runat="server" width="200" 
      visible="True"></asp:Textbox></td></tr>
      <tr><td>Address: </td> 
<td>
	
	<asp:Textbox id="txtAddress" runat="server"  visible="True" width="200"/></td></tr>
      <tr><td>
      City: </td> 
<td>
<asp:Textbox id=txtCity runat="server" width="200" 
      visible="True"></asp:Textbox></td></tr>
      <tr><td>
      State: </td> 
<td>
<asp:Textbox id=txtState runat="server" width="200" visible="True" 
      MaxLength="2"></asp:Textbox></td></tr>
      <tr><td>
      Zip: </td> 
<td>
<asp:Textbox id=txtZip runat="server" width="200" 
      visible="True" maxlength="10"></asp:Textbox></td></tr>
     
	
	</table></p>
	</TD>
	</tr>
</table>
 </form>
 </body></html>
