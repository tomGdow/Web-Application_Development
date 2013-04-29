<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="stockEntryMaster.aspx.vb" Inherits="Stock_stockEntryMaster" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div>
   <br />
   <br />
   <asp:Panel ID="Panel1" runat="server" Height="20px" Width="521px" 
        style="margin-right: 9px">
            <p>Stock may be Managed via a Data Access Layer connected to the Stock Table</p>
            </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" Height="20px" Width="521px" 
        style="margin-right: 9px">
            <p>Stock items are sorted alphabetically by Description</p> 
            </asp:Panel>
   
   <br />
    <br />
     <br />
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
            DataKeyNames="StockID" DataSourceID="ObjectDataSource1" 
        CellPadding="4" ForeColor="#333333" Height="214px" Width="469px" 
            CssClass="marginLeft">
            <EditItemTemplate>
                StockID:
                <asp:Label ID="StockIDLabel1" runat="server" Text='<%# Eval("StockID") %>' />
                <br />
                Description :
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' Height="26px" 
                    ontextchanged="DescriptionTextBox_TextChanged" Width="220px" />
                <br />
                Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' 
                    Height="26px" style="margin-left: 4px" Width="220px" />
                <br />
                Stock_level: &nbsp;
                <asp:TextBox ID="Stock_levelTextBox" runat="server" 
                    Text='<%# Bind("Stock_level") %>' Height = "26px" Width="220px" />
                <br />
                SupplierID:&nbsp;&nbsp;
                <asp:TextBox ID="SupplierIDTextBox" runat="server" 
                    Text='<%# Bind("SupplierID") %>' Height = "26px" Width="220px" />
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
                StockID:&nbsp;
                <asp:TextBox ID="StockIDTextBox" runat="server" Text='<%# Bind("StockID") %>' 
                    style="margin-left: 38px" Width="171px" 
                    ontextchanged="StockIDTextBox_TextChanged" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="StockIDTextBox" ErrorMessage="RequiredFieldValidator">Insert Stock ID</asp:RequiredFieldValidator>
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' style="margin-left: 19px" 
                    Width="171px" Height="16px" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="DescriptionTextBox" ErrorMessage="RequiredFieldValidator">Description  Required</asp:RequiredFieldValidator>
                <br />
                Price:&nbsp;
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' 
                    style="margin-left: 53px" Width="170px" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="PriceTextBox" ErrorMessage="RequiredFieldValidator">Price is Required</asp:RequiredFieldValidator>
                <br />
                Stock_level:&nbsp;<asp:TextBox ID="Stock_levelTextBox" runat="server" 
                    Text='<%# Bind("Stock_level") %>' 
                    ontextchanged="Stock_levelTextBox_TextChanged" style="margin-left: 21px" 
                    Width="171px" />
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="Stock_levelTextBox" ErrorMessage="RequiredFieldValidator">Stock Level Required</asp:RequiredFieldValidator>
                <br />SupplierID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox 
                    ID="SupplierIDTextBox" runat="server" 
                    Text='<%# Bind("SupplierID") %>' Width="169px" Height="17px" />
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="SupplierIDTextBox" ErrorMessage="RequiredFieldValidator">Insert Supplier ID</asp:RequiredFieldValidator>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                StockID:
                <asp:Label ID="StockIDLabel" runat="server" Text='<%# Eval("StockID") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                Price:
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                Stock_level:
                <asp:Label ID="Stock_levelLabel" runat="server" 
                    Text='<%# Bind("Stock_level") %>' />
                <br />
                SupplierID:
                <asp:Label ID="SupplierIDLabel" runat="server" 
                    Text='<%# Bind("SupplierID") %>' />
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
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetStock" 
            TypeName="DataSet1TableAdapters.StockTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_StockID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StockID" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="String" />
                <asp:Parameter Name="Stock_level" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="String" />
                <asp:Parameter Name="Stock_level" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="String" />
                <asp:Parameter Name="Original_StockID" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    
    </div>
</asp:Content>

