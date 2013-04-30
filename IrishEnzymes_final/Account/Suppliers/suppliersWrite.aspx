<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" %>

<%@ Import Namespace="System.XML" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script language="VB" runat="server" id="Script2">	
        Sub btnWriteXML_OnClick(ByVal sender As Object, ByVal e As EventArgs)
            Try
                Dim enc As Encoding
                'Create file, overwrite if exists
                'enc is encoding object required by constructor
                'It is null, so default encoding is used
                Dim objXMLTW As New XmlTextWriter(Server.MapPath("newSupplier.xml"), enc)
                objXMLTW.WriteStartDocument()
                'Top level (Parent element)
                objXMLTW.WriteStartElement("NewSupplier")
	
                'Child elements, from request form
                objXMLTW.WriteStartElement("SupplierName")
                objXMLTW.WriteString(Request("txtSupplierName"))
                objXMLTW.WriteEndElement()

                objXMLTW.WriteStartElement("SupplierAddress")
                objXMLTW.WriteString(Request("txtAddress"))
                objXMLTW.WriteEndElement()
	
                objXMLTW.WriteStartElement("Country")
                objXMLTW.WriteString(Request("txtCountry"))
                objXMLTW.WriteEndElement()
	
                objXMLTW.WriteStartElement("Phone")
                objXMLTW.WriteString(Request("txtPhone"))
                objXMLTW.WriteEndElement()
	
                objXMLTW.WriteStartElement("SupplierID")
                objXMLTW.WriteString(Request("txtSupplierID"))
                objXMLTW.WriteEndElement()
	
                objXMLTW.WriteEndElement() 'End top level element
                objXMLTW.WriteEndDocument() 'End Document
                objXMLTW.Flush() 'Write to file
                objXMLTW.Close()
                'Display File Just Created
                ReadXML(Server.MapPath("newSupplier.xml"))
            
           
	
          
            Catch Ex As Exception
                lblXMLFile.Text = "The following error occurred: " & Ex.Message
            End Try
        End Sub

        Sub ReadXML(ByVal FileName As String)
            Try

                lblXMLFile.Text = ""
                Dim objXMLTR As New XmlTextReader(FileName)
                Dim sCategory As String
                Dim bNested As Boolean
                Dim sLastElement As String
                Dim sValue As String

                'Read method loops through the XML stream
                Do While objXMLTR.Read

                    'Output elements and values
                    'This generates output on Screen (tgd)
                    If objXMLTR.NodeType = XmlNodeType.Element Then
                        If bNested = True Then
                            If sCategory <> "" Then sCategory = sCategory & " > "
                            sCategory = sCategory & sLastElement
                        End If
                        bNested = True
                        sLastElement = objXMLTR.Name
			 
                    ElseIf objXMLTR.NodeType = XmlNodeType.Text Or _
                      objXMLTR.NodeType = XmlNodeType.CDATA Then
                        bNested = False
                        sCategory = "<p>" & sCategory
                        sValue = objXMLTR.Value
                        lblXMLFile.Text = lblXMLFile.Text & "<br>" & sCategory & _
                           "<br />" & sLastElement & "</B><br>" & sValue
                        sLastElement = ""
                        sCategory = ""
                    End If
                Loop
                objXMLTR.Close()
            Catch Ex As Exception
                lblXMLFile.Text = "The following error occurred: " & Ex.Message
            End Try

        End Sub
  
        Protected Sub txtSupplierName_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub
    
    </script>
    <script runat="server">

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%">
        <tr>
            <td width="50%" valign="top">
                <asp:Button ID="btnWriteXML" Text="Write XML Document" OnClick="btnWriteXML_onClick"
                    runat="server" PostBackUrl="~/Suppliers/suppliersWrite.aspx" />
                <strong>New Supplier</strong>
            </td>
        </tr>
        <tr>
            <td>
                SupplierName:
            </td>
            <td>
                <asp:TextBox ID="txtSupplierName" runat="server" Width="200" Visible="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                SupplierAddress:
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" Visible="True" Width="200" />
            </td>
        </tr>
        <tr>
            <td>
                Country:
            </td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server" Width="200" Visible="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Phone:
            </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" Width="200" Visible="True" MaxLength="30"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                SupplierID:
            </td>
            <td>
                <asp:TextBox ID="txtSupplierID" runat="server" Width="200" Visible="True" MaxLength="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="100%" valign="top">
                <asp:Label ID="lblXMLFile" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
