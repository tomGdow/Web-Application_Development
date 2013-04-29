<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="suppliersEntryMaster.aspx.vb" Inherits="Suppliers_suppliersEntryMaster" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div>
     <br />
      <br />
       <asp:Panel ID="Panel1" runat="server" Height="20px" Width="607px" 
        style="margin-right: 9px">
            <p>Supplier Details may be Managed via a Data Access Layer connected to the Suppliers Table</p>
            </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" Height="20px" Width="521px" 
        style="margin-right: 9px">
            <p>Data are sorted alphabetically by Supplier Name</p> 
            </asp:Panel>
       <br />
        <br />
         <br />
          <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="SupplierID" 
            DataSourceID="ObjectDataSource1" AllowPaging="True" CellPadding="4" 
         ForeColor="#333333" style="margin-right: 26px" Height="180px" 
         Width="375px" CssClass="marginLeft">
            <EditItemTemplate>
                SupplierID:
                <asp:Label ID="SupplierIDLabel1" runat="server" 
                    Text='<%# Eval("SupplierID")' />
                <br />
                SupplierName:
                <asp:TextBox ID="SupplierNameTextBox" runat="server" 
                    Text='<%# Bind("SupplierName") %>'  
                    ontextchanged="SupplierNameTextBox_TextChanged" />
                <br />
                SupplierAddress:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="SupplierAddressTextBox" runat="server" 
                    Text='<%# Bind("SupplierAddress") %>' Height="24px" 
                    Width="218px" />
                <br />
                Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox ID="PhoneTextBox" runat="server" 
                    Text='<%# Bind("Phone") %>' Width="216px"  />
                <br />
                Country:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="CountryTextBox" runat="server" 
                    Text='<%# Bind("Country")  %>' Width="219px" />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                <asp:ConfirmButtonExtender ID="UpdateButton_ConfirmButtonExtender" 
                    runat="server" ConfirmText="Are You Sure?" Enabled="True" 
                    TargetControlID="UpdateButton">
                </asp:ConfirmButtonExtender>
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#F5DEB3" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                SupplierID:<br />&nbsp;
                <asp:TextBox ID="SupplierIDTextBox" runat="server" 
                    Text='<%# Bind("SupplierID") %>' Height="31px" Width="214px" />
                <br />
                SupplierName:
                <br />
                <asp:TextBox ID="SupplierNameTextBox" runat="server" 
                    Text='<%# Bind("SupplierName") %>' Height="26px" Width="216px" />
                <br />
                SupplierAddress:<br />&nbsp;<asp:TextBox ID="SupplierAddressTextBox" runat="server" 
                    Text='<%# Bind("SupplierAddress") %>' Height="28px" 
                    style="margin-bottom: 5px" Width="211px" />
                <br />
                Phone:<br />&nbsp;<asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' 
                    Height="27px" style="margin-bottom: 4px" Width="212px" />
                <br />
                Country:<br />&nbsp;&nbsp;<asp:TextBox ID="CountryTextBox" runat="server" 
                    Text='<%# Bind("Country") %>' Height="28px" 
                    ontextchanged="CountryTextBox_TextChanged" Width="209px" />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                <asp:ConfirmButtonExtender ID="InsertButton_ConfirmButtonExtender" 
                    runat="server" ConfirmText="Are You Sure" Enabled="True" 
                    TargetControlID="InsertButton">
                </asp:ConfirmButtonExtender>
                &nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                SupplierID:
                <asp:Label ID="SupplierIDLabel" runat="server" Text= '<%# Eval("SupplierID") %>' />
 
                <br />
                SupplierName:
                <asp:Label ID="SupplierNameLabel" runat="server" 
                    Text='<%# Bind("SupplierName") %>' />
                <br />
                SupplierAddress:
                <asp:Label ID="SupplierAddressLabel" runat="server" 
                    Text='<%# Bind("SupplierAddress") %>' />
                <br />
                Phone:
                <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                <br />
                Country:
                <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                <asp:ConfirmButtonExtender ID="DeleteButton_ConfirmButtonExtender" 
                    runat="server" ConfirmText="Are You Sure?" Enabled="True" 
                    TargetControlID="DeleteButton">
                </asp:ConfirmButtonExtender>
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            DeleteMethod="Delete" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetSupplies" 
            TypeName="DataSet2TableAdapters.SuppliersTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_SupplierID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SupplierID" Type="String" />
                <asp:Parameter Name="SupplierName" Type="String" />
                <asp:Parameter Name="SupplierAddress" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SupplierName" Type="String" />
                <asp:Parameter Name="SupplierAddress" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Original_SupplierID" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    
    </div>
</asp:Content>

