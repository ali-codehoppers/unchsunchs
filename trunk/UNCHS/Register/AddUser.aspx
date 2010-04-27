<%@ Page Language="C#" MasterPageFile="~/Common/Register.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="Register_AddUser" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .text_field span{width:150px;display:inline-block;}    
        .field span{width:150px;display:inline-block;}    
        .ddl_field span{width:150px;display:inline-block;}    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="text_field">
        <span>Full Name:</span><asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
         ControlToValidate="tbUserName" ValidationGroup="Add"></asp:RequiredFieldValidator>
    </div>
    <div class="text_field">
        <span>User Id:</span><asp:TextBox ID="tbUserLogon" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" 
        ControlToValidate="tbUserLogon" ValidationGroup="Add"></asp:RequiredFieldValidator>
    </div>
    <div class="text_field">
        <span>Password:</span><asp:TextBox ID="tbUserEnable" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" 
        ControlToValidate="tbUserEnable" ValidationGroup="Add"></asp:RequiredFieldValidator>
    </div>
    <div class="text_field">
        <span>Confirm Password:</span><asp:TextBox ID="tbConfirmUserEnable" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" 
        ControlToValidate="tbConfirmUserEnable" ValidationGroup="Add"></asp:RequiredFieldValidator>
    </div>
    
    <div class="text_field">
        <span>Password Reminder:</span><asp:TextBox ID="tbUserEnableReminder" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" 
        ControlToValidate="tbUserEnableReminder" ValidationGroup="Add"></asp:RequiredFieldValidator>
    </div>
    <div class="text_field">
        <span>Telephone:</span><asp:TextBox ID="tbTelephone" runat="server"></asp:TextBox>
    </div>
    <div class="text_field">
        <span>Telephone(Ext):</span><asp:TextBox ID="tbTelExt" runat="server"></asp:TextBox>
    </div>
    <div class="text_field">
        <span>Mobile:</span><asp:TextBox ID="tbMobile" runat="server"></asp:TextBox>
    </div>
    <div class="text_field">
        <span>Email:</span><asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
    </div>
    <div class="text_field">
        <span>Department:</span><asp:TextBox ID="tbDepartment" runat="server"></asp:TextBox>
    </div>
    <div class="text_field">
        <span>Location:</span><asp:TextBox ID="tbLocation" runat="server"></asp:TextBox>
    </div>
    <div class="button_bar">
        <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" Visible="true"/>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" 
            onclick="btnUpdate_Click" Visible="false"/> Please Save your Changes before Proceeding Further.
    </div>    

</asp:Content>

