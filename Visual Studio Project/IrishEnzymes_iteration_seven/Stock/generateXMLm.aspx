﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="generateXMLm.aspx.vb" Inherits="generateXMLm" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script language="VB" runat="server">

  Sub Page_Load(Sender As Object, E As EventArgs)

    Dim strConnection As String
    Dim strSQL        As String
    Dim objDataSet    As New DataSet()
    Dim objConnection As OleDbConnection
    Dim objAdapter    As OleDbDataAdapter

    ' set the connection and query details
        strConnection = "Provider=Microsoft.Jet.OLEDB.4.0; " & _
                        "Data Source=|DataDirectory|enzymeDatabase.mdb;"
        strSQL = "SELECT * FROM Stock Order By Description;"

    ' open the connection and set the command
    objConnection = New OledbConnection(strConnection)
    objAdapter = New OledbDataAdapter(strSQL, objConnection)

    ' fill the dataset with the data
        objAdapter.Fill(objDataSet, "Stock")
        ' create an XML file called currentStock and fill this with our data
        objDataSet.WriteXml(Server.MapPath("currentStock.xml"))

  End Sub

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div>
    <br />
        <br />
    <asp:Panel ID="Panel1" runat="server" Height="32px" Width="701px">
            An XML file detailing the Current Stock may be generated by clicking on the 
            Button below<br /> </asp:Panel>

<asp:Panel ID="Panel2" runat="server" Height="32px" Width="701px">
            The generated file is called <em>currentStock.xml</em>
          <br /> </asp:Panel>
        <br />
    <asp:Button ID="Button1" 
            runat="server" onclick="Page_Load" 
            Text="Generate XML File" Height="45px" Width="168px" 
            CssClass="marginLeftTwo" />
    
        <asp:RoundedCornersExtender ID="Button1_RoundedCornersExtender" runat="server" 
            Enabled="True" TargetControlID="Button1">
        </asp:RoundedCornersExtender>
        <asp:DropShadowExtender ID="Button1_DropShadowExtender" runat="server" 
            Enabled="True" TargetControlID="Button1">
        </asp:DropShadowExtender>
        <br />
       
    </div>

    <br />
     <br />
    <asp:Panel ID="Panel3" runat="server" Height="32px" Width="701px">
            A 'raw' (unformatted) version of the xml file may be viewed by cliking on the following button
          <br /> </asp:Panel>
           <br />
    <input   type=button onClick="parent.location='currentStock.xml'" 
        value= 'View XML File' Runat="Server" style="width: 170px; height: 40px" 
        class="marginLeftTwo">
    <br />
     <br />
      <br />
   <asp:Panel ID="Panel4" runat="server" Height="32px" Width="701px">
            A formatted verion of the XML file may be viewed by clicking on the following 
            link
          <br /> </asp:Panel>
        <br />
    <br />
    <a href = "./formattedXML.aspx" class="marginLeftTwo" >Formatted XML</a>
    <br />
    &nbsp;</div><br />
    <br />
</asp:Content>

