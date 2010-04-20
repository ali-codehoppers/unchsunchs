<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="AddOrderRiskAssessments.aspx.cs" Inherits="Orders_AddOrderRiskAssessments" Title="Untitled Page" %>

<%@ Register Src="../Common/UserControls/OrderDocControl.ascx" TagName="OrderDocControl"
    TagPrefix="uc2" %>
<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
            <div style="text-align: right">
        <div class="button_bar">
            <div class="button_left">
                Add/Edit H&amp;S Folder
            </div>
        </div>
        <div class="button_right">
            <asp:ImageButton ID="ImageButton2" runat="server" OnClick="btnNext_Click" ImageUrl="~/Images/Next.gif"
                onmouseover="this.src='../Images/Next_rollover_selected.gif';" onmouseout="this.src='../Images/Next.gif';" />
        </div>
        <div class="button_right">
            <asp:ImageButton ID="ImageButton3" runat="server" OnClick="btnBack_Click" ImageUrl="~/Images/Back.gif"
                onmouseover="this.src='../Images/Back_rollover_selected.gif';" onmouseout="this.src='../Images/Back.gif';" />
        </div>
    </div>
    <br />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server"><uc1:TabControl ID="TabControl1" runat="server" Selected="Risks" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">    
    <uc2:OrderDocControl id="OrderDocControl1" runat="server" DocTypeName="Risk Assessments">
    </uc2:OrderDocControl>
    
</asp:Content>

