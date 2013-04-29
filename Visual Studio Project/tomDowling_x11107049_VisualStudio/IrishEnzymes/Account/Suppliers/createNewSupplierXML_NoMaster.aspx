<%@ Page Language="VB" %>

<%@ Import Namespace="System.XML" %>
<html>
<head>
    <title>hello> </title>
    <script language="VB" runat="server" id="Script1">	
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
    <style type="text/css">
        .style1
        {
            width: 46%;
        }
    </style>
</head>
<body>
    <center>
        <p>
            <a href="../../Default.aspx">Home</a> | <a href="../Customers/customers.aspx">Customers</a>
            | <a href="../Stock/StockEntryMaster.aspx">Stock</a> | <a href="adoSuppliers.aspx">Suppliers</a>
            | <a href="../Searches/searchCustomers2.aspx">Search</a></p>
        <br />
        <a href="./newSupplier.xml" class="marginLeftTwo" target="_blank">View XML</a>
        <br />
        <b>Use </b>
    </center>
    <form method="post" runat="server" id="Form1">
    <table style="height: 189px; width: 83%; margin-left: 55px">
        <tr>
            <td valign="top" class="style1">
                <asp:Button ID="btnWriteXML" Text="Write XML Document" OnClick="btnWriteXML_onClick"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                SupplierName:
            </td>
            <td>
                <asp:TextBox ID="txtSupplierName" runat="server" Width="200" Visible="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                SupplierAddress:
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" Visible="True" Width="200" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                Country:
            </td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server" Width="200" Visible="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Phone:
            </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" Width="200" Visible="True" MaxLength="30"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                SupplierID:
            </td>
            <td>
                <asp:TextBox ID="txtSupplierID" runat="server" Width="200" Visible="True" MaxLength="10"></asp:TextBox>
            </td>
        </tr>
        </td>
        <tr>
            <td valign="top" class="style1">
                <asp:Label ID="lblXMLFile" runat="server" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
