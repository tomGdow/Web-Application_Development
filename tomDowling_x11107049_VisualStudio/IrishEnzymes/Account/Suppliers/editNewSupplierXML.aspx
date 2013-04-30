<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" %>

<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<script runat="server">

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
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
            Dim SupplierName As TextBox
            Dim SupplierAddress As TextBox
            Dim Country As TextBox
            Dim Phone As TextBox
            Dim SupplierID As TextBox

            GetData()
            'update data
            For i = 0 To DataGrid1.Items.Count - 1
                SupplierName = DataGrid1.Items(i).FindControl("SupplierName")
                SupplierAddress = DataGrid1.Items(i).FindControl("SupplierAddress")
                Country = DataGrid1.Items(i).FindControl("Country")
                Phone = DataGrid1.Items(i).FindControl("Phone")
                SupplierID = DataGrid1.Items(i).FindControl("SupplierID")

                xmldoc.DataSet.Tables(0).Rows(i)("suppliername") = SupplierName.Text
                xmldoc.DataSet.Tables(0).Rows(i)("SupplierAddress") = SupplierAddress.Text
            
                xmldoc.DataSet.Tables(0).Rows(i)("Country") = Country.Text
                xmldoc.DataSet.Tables(0).Rows(i)("Phone") = Phone.Text
                xmldoc.DataSet.Tables(0).Rows(i)("supplierid") = SupplierID.Text
            
            Next

            Try
                xmldoc.Save(Server.MapPath("newSupplier.xml"))
            Catch
                output.Text = "Error updating data"
            End Try

            BindControl()
        End Sub

        Sub GetData()
            Try
                xmldoc.DataSet.ReadXml(Server.MapPath("newSupplier.xml"))
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <br />
    <asp:Panel ID="Panel4" runat="server" Height="32px" Width="521px">
        Use this page to edit the new Supplier XML file (Suppliers/<em>newSupplier.xml</em>)<br />
    </asp:Panel>
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="output" runat="server" />
    <asp:DataGrid ID="DataGrid1" runat="server" GridLines="None" HeaderStyle-BackColor="#cccc99"
        ItemStyle-BackColor="#ffffff" AlternatingItemStyle-BackColor="#cccccc" AutoGenerateColumns="False"
        CellPadding="4" ForeColor="#333333" Height="183px" Width="447px" CssClass="marginLeftTwo">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775"></AlternatingItemStyle>
        <Columns>
            <asp:TemplateColumn HeaderText="SupplierName">
                <ItemTemplate>
                    <asp:TextBox ID="SupplierName" runat="server" Text='<%# Container.DataItem("SupplierName") %>'
                        Width="150px" Height="30" />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="SupplierAddress">
                <ItemTemplate>
                    <asp:TextBox ID="SupplierAddress" runat="server" Text='<%# Container.DataItem("SupplierAddress") %>'
                        Width="200px" Height="30" />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="SupplierID">
                <ItemTemplate>
                    <asp:TextBox ID="SupplierID" runat="server" Text='<%# Container.DataItem("SupplierID") %>'
                        Width="50px" Height="30" />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Country">
                <ItemTemplate>
                    <asp:TextBox ID="Country" runat="server" Text='<%# Container.DataItem("Country") %>'
                        Width="100px" Height="30" />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Phone">
                <ItemTemplate>
                    <asp:TextBox ID="Phone" runat="server" Text='<%# Container.DataItem("Phone") %>'
                        Width="100px" Height="30" />
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
        <EditItemStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333"></ItemStyle>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:DataGrid>
    <br />
    <center>
        <asp:Button ID="update" runat="server" OnClick="UpdateBtn_Click" Text="Update XML" />
        <br />
        <br />
        <br />
    </center>
    <asp:Panel ID="Panel2" runat="server" Height="32px" Width="521px" CssClass="marginLeftTwo">
        View the Generated or Current XML file (in a separate window)<br />
    </asp:Panel>
    <br />
    <a href="./newSupplier.xml" class="marginLeftTwo" target="_blank">View XML</a>
    <br />
    <br />
    <asp:Panel ID="Panel3" runat="server" Height="32px" Width="521px" CssClass="marginLeftTwo">
        (Suppliers/<em>NewSupplier.xml</em>)<br />
    </asp:Panel>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
