<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="TermsConditions.aspx.cs" Inherits="TermsConditions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div>
    </div>
    <div class="button_bar">
        <asp:Button ID="btnAgree" runat="server" 
            Text="I accept to the Terms & Conditions" onclick="btnAgree_Click" 
            style="height: 26px" Width="300px" />
    </div>
</asp:Content>

