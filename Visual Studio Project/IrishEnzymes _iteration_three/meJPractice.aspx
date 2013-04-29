﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="meJPractice.aspx.vb" Inherits="meJPractice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <h2>
        Modify customers</h2>
    <p>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" DataFile="~/App_Data/enzymeDatabase.mdb" 
            DeleteCommand="DELETE FROM [Customers] WHERE (([CustomerID] = ?))" 
            InsertCommand="INSERT INTO [Customers] ([CustomerID], [Firstname], [Surname], [City], [Email], [Telephone]) VALUES (?, ?, ?, ?, ?, ?)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Customers] ORDER BY [CustomerID]" 
            UpdateCommand="UPDATE [Customers] SET [Firstname] = ?, [Surname] = ?, [City] = ?, [Email] = ?, [Telephone] = ? WHERE (([CustomerID] = ?))">
            <DeleteParameters>
                <asp:Parameter Name="original_CustomerID" Type="String" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Surname" Type="String" />
                <asp:Parameter Name="original_Surname" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Telephone" Type="String" />
                <asp:Parameter Name="original_Telephone" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
                <asp:Parameter Name="original_CustomerID" Type="String" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Surname" Type="String" />
                <asp:Parameter Name="original_Surname" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Telephone" Type="String" />
                <asp:Parameter Name="original_Telephone" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" DataKeyNames="CustomerID" 
            DataSourceID="AccessDataSource1" Height="29px" Width="52%" 
            style="margin-right: 0px">
            <FieldHeaderStyle Font-Bold="True" ForeColor="#CC0000" />
            <Fields>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" 
                    SortExpression="Firstname" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" 
                    SortExpression="Surname" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Telephone" HeaderText="Telephone" 
                    SortExpression="Telephone" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </p>
    
    </div>
    </form>
</body>
</html>
