﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="meCustomersAdd.aspx.vb" Inherits="meCustomersAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/enzymeDatabase.mdb" 
            DeleteCommand="DELETE FROM [Customers] WHERE (([CustomerID] = ?) OR ([CustomerID] IS NULL AND ? IS NULL))" 
            InsertCommand="INSERT INTO [Customers] ([CustomerID], [Firstname], [Surname], [City], [Email], [Telephone]) VALUES (?, ?, ?, ?, ?, ?)" 
            SelectCommand="SELECT * FROM [Customers] ORDER BY [Surname]" 
            
            UpdateCommand="UPDATE [Customers] SET [Firstname] = ?, [Surname] = ?, [City] = ?, [Email] = ?, [Telephone] = ? WHERE (([CustomerID] = ?) OR ([CustomerID] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
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
                <asp:Parameter Name="CustomerID" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
    
    </div>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="CustomerID" 
        DataSourceID="AccessDataSource1" Height="50px" Width="125px">
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
            <asp:CommandField ButtonType="Button" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    </form>
</body>
</html>