<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="DepartmentWorkList.aspx.cs" Inherits="Maintenance_DepartmentWorkList" Title="Simplicity4Business" %>

<%@ Register src="../Common/UserControls/SuggestionsControl.ascx" tagname="SuggestionsControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/fonts/fonts-min.css")%>" />

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/animation/animation-min.js")%>"></script>

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/dragdrop/dragdrop-min.js")%>"></script>

    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/DDStyle.css")%>" />

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/unchs/DragDrop.js")%>"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TabPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
    Default Works List 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    <uc1:SuggestionsControl ID="SuggestionsControl1" runat="server" CategoryType="W" SuggestionType="W" EntityName="Work"/>
    
</asp:Content>

