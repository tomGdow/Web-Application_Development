<%@ Page Language="VB" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

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
      dim Title as TextBox
      dim Genre as TextBox
      dim Style as TextBox
      dim Price as TextBox
      
      GetData()
      
      'update data
      For i = 0 To DataGrid1.Items.Count-1
         Title = DataGrid1.Items(i).FindControl("Title")
         Genre = DataGrid1.Items(i).FindControl("Genre")
         Price = DataGrid1.Items(i).FindControl("Price")
      
         xmldoc.DataSet.Tables(0).Rows(i)("title") = Title.Text
         xmldoc.DataSet.Tables(0).Rows(i)("genre") = Genre.Text
         xmldoc.DataSet.Tables(0).Rows(i)("price") = Price.Text
      Next
      
      try
         xmldoc.Save(Server.MapPath("Data.xml"))
      catch
         output.Text = "Error updating data"
      end try
      
      BindControl()
   end sub
   
   sub GetData()
      try
         xmldoc.DataSet.ReadXml(Server.MapPath("Data.xml"))
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
   <asp:DataGrid id="DataGrid1" runat="server" 
      BorderColor="black" 
      GridLines="Vertical" 
      HeaderStyle-BackColor="#cccc99"
      ItemStyle-BackColor="#ffffff"
      AlternatingItemStyle-Backcolor="#cccccc" 
      AutogenerateColumns="false" >
      <Columns>
         <asp:TemplateColumn HeaderText="Title">
            <ItemTemplate>
               <asp:TextBox id="Title" runat="server" 
                  Text='<%# Container.DataItem("title") %>' />
            </ItemTemplate>
         </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="Genre">
            <ItemTemplate>
               <asp:TextBox id="Genre" runat="server" 
                  Text='<%# Container.DataItem("genre") %>' 
                  width="75px" />
            </ItemTemplate>
         </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="Price">
            <ItemTemplate>
               <asp:TextBox id="Price" runat="server" 
                  Text='<%# Container.DataItem("price") %>'
                  width="50px" />
            </ItemTemplate>
         </asp:TemplateColumn>
      </Columns>     
   </asp:DataGrid>
   
   <center>
   <asp:Button id="update" runat="server"
      OnClick="UpdateBtn_Click"
      text="Update!" />
   </center>
   </form>
</body>
</html>
