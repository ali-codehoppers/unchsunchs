<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="TermsConditions.aspx.cs" Inherits="TermsConditions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div class="terms">
You are using Simplicity for Business H&S Live as a free 14 days trial and in doing so it should be used as a proof of concept as Risk Assessment and Method Statement are an import way to safe working and should be treated as so.
As an employer, you must assess and manage health and safety risks - whether you are a big business, a small business or just a one-person operation. Accidents and ill health can ruin lives and damage your business. You are not expected to eliminate all risk, but you are required to protect people as far as 'reasonably practicable'.
</div>
<div class="terms">
    A risk assessment is an important tool in protecting your workers and your business. It helps you focus on those risks that have the potential to cause harm. Most of these can be readily controlled by straightforward measures.
</div>
<div class="terms">
Once you have completed the assessment it is important to put your results into practice. If you need to make a number of improvements, you should produce an action plan to deal with the most important first. You should review your assessment on an ongoing basis to make sure that it remains up to date and effective.    </div>
    <div class="button_bar" style="text-align:center">
        <asp:Button ID="btnAgree" runat="server" 
            Text="I accept to the Terms & Conditions" onclick="btnAgree_Click" 
            style="height: 26px;text-align:center" Width="300px" />
    </div>
</asp:Content>

