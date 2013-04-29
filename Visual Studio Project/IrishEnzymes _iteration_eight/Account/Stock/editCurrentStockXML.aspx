<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

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
        Dim StockID As TextBox
        Dim Description As TextBox
        Dim Price As TextBox
        Dim Stock_Level As TextBox
        Dim SupplierID As TextBox

GetData()
'update data
        For i = 0 To DataGrid1.Items.Count - 1
            StockID = DataGrid1.Items(i).FindControl("StockID")
            Description = DataGrid1.Items(i).FindControl("Description")
            Price = DataGrid1.Items(i).FindControl("Price")
            Stock_Level = DataGrid1.Items(i).FindControl("Stock_Level")
            SupplierID = DataGrid1.Items(i).FindControl("SupplierID")

            xmldoc.DataSet.Tables(0).Rows(i)("stockid") = StockID.Text
            xmldoc.DataSet.Tables(0).Rows(i)("description") = Description.Text
            
            xmldoc.DataSet.Tables(0).Rows(i)("price") = Price.Text
            xmldoc.DataSet.Tables(0).Rows(i)("stock_level") = Stock_Level.Text
            xmldoc.DataSet.Tables(0).Rows(i)("supplierid") = SupplierID.Text
            
        Next

        Try
            xmldoc.Save(Server.MapPath("currentStock.xml"))
      catch
         output.Text = "Error updating data"
      end try

      BindControl()
   end sub

   sub GetData()
      try
            xmldoc.DataSet.ReadXml(Server.MapPath("currentStock.xml"))
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<br />
        <asp:Panel ID="Panel1" runat="server" Height="32px" Width="521px">
            Use this page to edit the XML File of current stock (Stock/<em>currentStock.xml</em>)<br />
        </asp:Panel>

 <center>
   <asp:Button id="Button1" runat="server"
      OnClick="UpdateBtn_Click"
      text="Update XML" />
   </center>

   <br />
   <br />

 <asp:Label id="output" runat="server" />

   <asp:DataGrid id="DataGrid1" runat="server"
      GridLines="None"
      HeaderStyle-BackColor="#cccc99"
      ItemStyle-BackColor="#ffffff"
      AlternatingItemStyle-Backcolor="#cccccc"
      AutogenerateColumns="False" CellPadding="4" ForeColor="#333333" 
       Height="183px" Width="447px" CssClass="marginLeft" >
<AlternatingItemStyle BackColor="White" ForeColor="#284775"></AlternatingItemStyle>
      <Columns>
         <asp:TemplateColumn HeaderText="StockID">
            <ItemTemplate>
               <asp:TextBox id="StockID" runat="server"
                  Text='<%# Container.DataItem("StockID") %>' width="50px"/>
            </ItemTemplate>
         </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="Description">
            <ItemTemplate>
               <asp:TextBox id="Description" runat="server"
                  Text='<%# Container.DataItem("Description") %>'
                  width="150px" />
            </ItemTemplate>
         </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="SupplierID">
            <ItemTemplate>
               <asp:TextBox id="SupplierID" runat="server"
                  Text='<%# Container.DataItem("SupplierID") %>'
                  width="50px" />
            </ItemTemplate>
         </asp:TemplateColumn>



          <asp:TemplateColumn HeaderText="Price">
            <ItemTemplate>
               <asp:TextBox id="Price" runat="server"
                  Text='<%# Container.DataItem("Price") %>'
                  width="50px" />
            </ItemTemplate>
         </asp:TemplateColumn>

          <asp:TemplateColumn HeaderText="Stock_Level">
            <ItemTemplate>
               <asp:TextBox id="Stock_Level" runat="server"
                  Text='<%# Container.DataItem("Stock_Level") %>'
                  width="50px" />
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

   

</asp:Content>

