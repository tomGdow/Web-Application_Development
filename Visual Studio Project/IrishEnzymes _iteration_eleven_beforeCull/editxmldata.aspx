<%@ Page Language="VB" %>

<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script runat="server">
    Private i, j As Integer
    Private strOutput As String = ""
    Public xmldoc As New XmlDataDocument()
   
    Sub Page_Load(ByVal Sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            GetData()
            BindControl()
        End If
    End Sub
   
    Sub UpdateBtn_Click(ByVal Sender As Object, ByVal e As EventArgs)
        Dim Title As TextBox
        Dim Genre As TextBox
        Dim Style As TextBox
        Dim Price As TextBox
      
        GetData()
      
        'update data
        For i = 0 To DataGrid1.Items.Count - 1
            Title = DataGrid1.Items(i).FindControl("Title")
            Genre = DataGrid1.Items(i).FindControl("Genre")
            Price = DataGrid1.Items(i).FindControl("Price")
      
            xmldoc.DataSet.Tables(0).Rows(i)("title") = Title.Text
            xmldoc.DataSet.Tables(0).Rows(i)("genre") = Genre.Text
            xmldoc.DataSet.Tables(0).Rows(i)("price") = Price.Text
        Next
      
        Try
            xmldoc.Save(Server.MapPath("Data.xml"))
        Catch
            output.Text = "Error updating data"
        End Try
      
        BindControl()
    End Sub
   
    Sub GetData()
        Try
            xmldoc.DataSet.ReadXml(Server.MapPath("Data.xml"))
        Catch ex As Exception
            output.Text = "Error accessing XML file"
        End Try
    End Sub
   
    Sub BindControl()
        DataGrid1.DataSource = xmldoc.DataSet
        DataGrid1.DataMember = xmldoc.DataSet.Tables(0).TableName
        DataGrid1.DataBind()
    End Sub
</script>
<html>
<body>
    <asp:Label ID="output" runat="server" />
    <form id="Form1" runat="server">
    <asp:DataGrid ID="DataGrid1" runat="server" BorderColor="black" GridLines="Vertical"
        HeaderStyle-BackColor="#cccc99" ItemStyle-BackColor="#ffffff" AlternatingItemStyle-BackColor="#cccccc"
        AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateColumn HeaderText="Title">
                <ItemTemplate>
                    <asp:TextBox ID="Title" runat="server" Text='<%# Container.DataItem("title") %>' />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Genre">
                <ItemTemplate>
                    <asp:TextBox ID="Genre" runat="server" Text='<%# Container.DataItem("genre") %>'
                        Width="75px" />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Price">
                <ItemTemplate>
                    <asp:TextBox ID="Price" runat="server" Text='<%# Container.DataItem("price") %>'
                        Width="50px" />
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>
    <center>
        <asp:Button ID="update" runat="server" OnClick="UpdateBtn_Click" Text="Update!" />
    </center>
    </form>
</body>
</html>
