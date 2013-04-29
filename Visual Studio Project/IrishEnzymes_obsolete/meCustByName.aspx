<%@ Page Language="VB" AutoEventWireup="false" CodeFile="meCustByName.aspx.vb" Inherits="meCustByName" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <br />
        &nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit" Height="39px" 
            Width="85px" />
        <asp:RoundedCornersExtender ID="Button1_RoundedCornersExtender" runat="server" 
            Enabled="True" TargetControlID="Button1">
        </asp:RoundedCornersExtender>
        <br />
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="35px" Width="163px"></asp:TextBox>
        
        <asp:DropShadowExtender ID="TextBox1_DropShadowExtender" runat="server" 
            Enabled="True" TargetControlID="TextBox1">
        </asp:DropShadowExtender>
        <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" 
            runat="server" Enabled="True" TargetControlID="TextBox1" 
            WatermarkText="Surname">
        </asp:TextBoxWatermarkExtender>
        
        <asp:AutoCompleteExtender ID="tbSearchCustomerRecords_AutoCompleteExtender" 
        runat="server" TargetControlID="TextBox1" ServiceMethod="SearchCustomers" MinimumPrefixLength="2"
            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" UseContextKey="True" 
></asp:AutoCompleteExtender>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/enzymeDatabase.mdb" 
            
            SelectCommand="SELECT * FROM Suppliers WHERE (SupplierName = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="SupplierName" PropertyName="Text" 
                    Type="String" />
                
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="AccessDataSource1">
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
