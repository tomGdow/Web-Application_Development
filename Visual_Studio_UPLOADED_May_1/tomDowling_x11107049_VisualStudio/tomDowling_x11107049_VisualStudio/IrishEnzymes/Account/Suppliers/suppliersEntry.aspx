<%@ Page Language="VB" AutoEventWireup="false" CodeFile="suppliersEntry.aspx.vb" Inherits="Suppliers_suppliersEntry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="SupplierID" 
            DataSourceID="ObjectDataSource1">
            <EditItemTemplate>
                SupplierID:
                <asp:Label ID="SupplierIDLabel1" runat="server" 
                    Text='<%# Eval("SupplierID") %>' />
                <br />
                SupplierName:
                <asp:TextBox ID="SupplierNameTextBox" runat="server" 
                    Text='<%# Bind("SupplierName") %>' />
                <br />
                SupplierAddress:
                <asp:TextBox ID="SupplierAddressTextBox" runat="server" 
                    Text='<%# Bind("SupplierAddress") %>' />
                <br />
                Phone:
                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                <br />
                Country:
                <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                SupplierID:
                <asp:TextBox ID="SupplierIDTextBox" runat="server" 
                    Text='<%# Bind("SupplierID") %>' />
                <br />
                SupplierName:
                <asp:TextBox ID="SupplierNameTextBox" runat="server" 
                    Text='<%# Bind("SupplierName") %>' />
                <br />
                SupplierAddress:
                <asp:TextBox ID="SupplierAddressTextBox" runat="server" 
                    Text='<%# Bind("SupplierAddress") %>' />
                <br />
                Phone:
                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                <br />
                Country:
                <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                SupplierID:
                <asp:Label ID="SupplierIDLabel" runat="server" 
                    Text='<%# Eval("SupplierID") %>' />
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
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
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
    </form>
</body>
</html>
