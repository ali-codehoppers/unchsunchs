﻿<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="DepartmentEmergencyCategoryList.aspx.cs" Inherits="Maintenance_DepartmentEmergencyCategoryList" Title="Untitled Page" %>
<%@ Register Src="../Common/UserControls/CategoryControl.ascx" TagName="CategoryControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TabPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
     Emergency Category List
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <uc1:CategoryControl id="CategoryControl1" runat="server" CategoryType="E"></uc1:CategoryControl>
</asp:Content>
