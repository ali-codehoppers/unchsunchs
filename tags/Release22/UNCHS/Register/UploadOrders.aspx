﻿<%@ Page Language="C#" MasterPageFile="~/Common/Register.master" AutoEventWireup="true" CodeFile="UploadOrders.aspx.cs" Inherits="Register_UploadOrders" Title="Simplicity4Business" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="content4" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
  <div class="selectcontainer"></div>
  <div class="schedule" ></div>
  <div class="checkout" ></div>
  <div class="userbillingselected" ></div>
  <div class="verification" ></div>
</asp:Content>
<asp:Content ID="conttent3" ContentPlaceHolderID="HeadingContentPlaceHolder" runat="server">Create Folders</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div class="field">Upload the Addresses for your existing orders.</div>
    <div class="field">
        <asp:FileUpload ID="fileUpload" runat="server" CssClass="field_txt"/>
        <asp:Button ID="btnUpload" runat="server" Text="Upload" 
            OnClick="btnUpload_Click" style="font: normal 12px Arial, Verdana, Helvetica, sans-serif;color: #333;height:18px;background-image: url(../Images/filed_gradient.jpg);background-repeat: repeat-x;border: 1px solid #cccccc;" />
    </div>
    <div style="color:Gray">
        The file should be a CSV file with the following format.<br />
        Please also note that headers should be provided in the first row. Any data in first row will not be processed. <br /><br />
        Click <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register/CSVHelp.aspx?return=1">here</asp:HyperLink> on help on how to create CSV file. 
    </div>    
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/folder_import.png"/>        
    </div>
    <div class="button_bar">
        <asp:Button ID="btnContinue" runat="server" Text="Continue" onclick="btnContinue_Click" Visible="true" style="font: normal 12px Arial, Verdana, Helvetica, sans-serif;color: #333;height:30px;width:200px;background-image: url(../Images/filed_gradient.jpg);background-repeat: repeat-x;border: 1px solid #cccccc;"/>
    </div>
</asp:Content>

