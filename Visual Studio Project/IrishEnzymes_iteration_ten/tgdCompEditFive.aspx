<%@ Page Language="VB" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<script runat=server>
    private i, j as integer
private strOutput as string = ""
public xmldoc as new XMLDataDocument()

sub Page_Load(Sender as Object, e as EventArgs)
if not Page.IsPostBack then
  GetData()
  BindControl()
end if
end sub

sub UpdateBtn_Click(Sender as Object, e as EventArgs)
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
      catch
         output.Text = "Error updating data"
      end try

      BindControl()
   end sub

   sub GetData()
      try
            xmldoc.DataSet.ReadXml(Server.MapPath("newSupplier.xml"))
      catch ex as Exception
         output.Text = "Error accessing XML file"
      end try
   end sub

   sub BindControl()
      DataGrid1.DataSource = xmldoc.DataSet
      DataGrid1.DataMember = xmldoc.DataSet.Tables(0).TableName
      DataGrid1.DataBind()
   end sub
</script>

<html><body>
   <asp:Label id="output" runat="server" />
   <form id="Form1" runat="server">
   <asp:scriptmanager ID="Scriptmanager1" runat="server"></asp:scriptmanager>
   <asp:DataGrid id="DataGrid1" runat="server"
      GridLines="None"
      HeaderStyle-BackColor="#cccc99"
      ItemStyle-BackColor="#ffffff"
      AlternatingItemStyle-Backcolor="#cccccc"
      AutogenerateColumns="False" CellPadding="4" ForeColor="#333333" 
       Height="183px" Width="447px" >
<AlternatingItemStyle BackColor="White" ForeColor="#284775"></AlternatingItemStyle>
      <Columns>
         <asp:TemplateColumn HeaderText="SupplierName">
            <ItemTemplate>
               <asp:TextBox id="SupplierName" runat="server"
                  Text='<%# Container.DataItem("SupplierName") %>' width="150px" Height = "30"/>
            </ItemTemplate>
         </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="SupplierAddress">
            <ItemTemplate>
               <asp:TextBox id="SupplierAddress" runat="server"
                  Text='<%# Container.DataItem("SupplierAddress") %>'
                  width="150px" Height = "30" />
            </ItemTemplate>
         </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="SupplierID">
            <ItemTemplate>
               <asp:TextBox id="SupplierID" runat="server"
                  Text='<%# Container.DataItem("SupplierID") %>'
                  width="150px" Height = "30" />
            </ItemTemplate>
         </asp:TemplateColumn>



          <asp:TemplateColumn HeaderText="Country">
            <ItemTemplate>
               <asp:TextBox id="Country" runat="server"
                  Text='<%# Container.DataItem("Country") %>'
                  width="150px" Height = "30"/>
            </ItemTemplate>
         </asp:TemplateColumn>

          <asp:TemplateColumn HeaderText="Phone">
            <ItemTemplate>
               <asp:TextBox id="Phone" runat="server"
                  Text='<%# Container.DataItem("Phone") %>'
                  width="150px" Height = "30"/>
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

   <center>
   <asp:Button id="update" runat="server"
      OnClick="UpdateBtn_Click"
      text="Update!" />
   </center>
   </form>
</body>
</html>

