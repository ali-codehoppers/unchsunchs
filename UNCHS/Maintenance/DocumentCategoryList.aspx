<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="DocumentCategoryList.aspx.cs" Inherits="Maintenance_DocumentCategoryList" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/CategoryControl.ascx" TagName="CategoryControl"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
    Document Category List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <uc1:CategoryControl id="CategoryControl1" runat="server" CategoryType="D">
    </uc1:CategoryControl>        
</asp:Content>

