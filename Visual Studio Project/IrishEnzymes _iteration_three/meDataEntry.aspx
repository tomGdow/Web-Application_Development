<%@ Page Language="VB" AutoEventWireup="false" CodeFile="meDataEntry.aspx.vb" Inherits="meDataEntry" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" 
            DataKeyNames="StockID" DataSourceID="ObjectDataSource2" ForeColor="#333333" 
            Height="260px" Width="443px">
            <EditItemTemplate>
                StockID:
                <asp:Label ID="StockIDLabel1" runat="server" Text='<%# Eval("StockID") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                Price:
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                Stock_level:
                <asp:TextBox ID="Stock_levelTextBox" runat="server" 
                    Text='<%# Bind("Stock_level") %>' />
                <br />
                SupplierID:
                <asp:TextBox ID="SupplierIDTextBox" runat="server" 
                    Text='<%# Bind("SupplierID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                StockID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="StockIDTextBox" runat="server" Text='<%# Bind("StockID") %>' />
                <br />
                Description:&nbsp;&nbsp;
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                Stock_level:&nbsp;
                <asp:TextBox ID="Stock_levelTextBox" runat="server" 
                    Text='<%# Bind("Stock_level") %>' />
                <br />
                SupplierID:&nbsp;&nbsp;
                <asp:TextBox ID="SupplierIDTextBox" runat="server" 
                    Text='<%# Bind("SupplierID") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                <asp:ConfirmButtonExtender ID="InsertButton_ConfirmButtonExtender" 
                    runat="server" ConfirmText="Are You Sure?" Enabled="True" 
                    TargetControlID="InsertButton">
                </asp:ConfirmButtonExtender>
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
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            DeleteMethod="Delete" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetProducts" 
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
    </form>
</body>
</html>
