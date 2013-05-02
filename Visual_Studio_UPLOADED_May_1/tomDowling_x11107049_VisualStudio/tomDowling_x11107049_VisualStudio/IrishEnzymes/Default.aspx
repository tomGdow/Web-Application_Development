<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div id ="wrapper">
   <div id = "loginSuccessWelcome">
        You have successfully logged in</div>
        <div id ="clearFloat">&nbsp;</div>
    <h1 id="welcomeOnHome">Welcome to Irish Enzymes</h1>
    
    <p class="openingPara">
        This Site was prepared by Thomas Dowling (x1107049)
    </p>
    <p class="openingPara">
        in part fulfillment of the Web Application Development Module</p>
    <p class="openingPara">
        of the Higher Diploma in Web Technologies Course</p>
    <p class="openingPara">
        at <a href="http://www.ncirl.ie/">the National College of Ireland</a></p>

        </div>
</asp:Content>
