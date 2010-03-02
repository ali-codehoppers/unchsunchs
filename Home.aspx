<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" Title="Untitled Page" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<div>
    <div class="home_left">
        <div class="button_bar"><asp:Button ID="btnSearch" runat="server" Text="Search Folder" OnClick="btnSearch_Click" /></div>
        <div class="button_bar"><asp:Button ID="btnAdd" runat="server" Text="Add New Folder" OnClick="btnAdd_Click" /></div>
    </div>
    <div class="home_middle">
        <asp:Label ID="lblCompany" runat="server" Text="Label" CssClass="company_label"></asp:Label>
    </div>
</div>
</asp:Content>

