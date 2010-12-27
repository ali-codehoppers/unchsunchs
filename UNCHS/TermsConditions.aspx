<%@ Page Title="" Language="C#" MasterPageFile="~/Common/subMain.master" AutoEventWireup="true"
    CodeFile="TermsConditions.aspx.cs" Inherits="TermsConditions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server" >
    <div style="float: left;">
        <img src="<%=this.ResolveClientUrl("~/images/big_pnl_left.jpg")%>" alt="" height="20" />
    </div>
    <div style="float: left; width: 97.05%;">
        <img src="<%=this.ResolveClientUrl("~/Images/big_pnl_mid.jpg")%>" alt="" style="width: 100%"
            height="20" />
    </div>
    <div>
        <img src="<%=this.ResolveClientUrl("~/images/big_pnl_right.jpg")%>" alt="" height="20" />
    </div>
    <div style="background-color: White; border-bottom:1px solid white">
        <div style="margin: auto; width: 900px;">
            <div class="terms">
                Simplicity for Business H&S Live is a unique document management application that
                assists you in easily and quickly creating and maintaining your health and safety
                documents, that are required as part of your Company&#8217;s health and safety policy
                and procedures.
            </div>
            <div class="terms">
                Risk Assessments and Method Statements are important tools in protecting both your
                workers and your business and for supporting you in maintaining safe working practices
                and should be treated as such. They help you to focus on those risks that have the
                potential to cause harm. Most of these risks can be readily controlled by straightforward
                measures.
            </div>
            <div class="terms">
                Simplicity for Business H&S Live alone cannot ensure the safety of your staff or
                your business. As an employer, it is your responsibility to assess and manage health
                and safety risks &#8211; whether you are a large or small business, or a one person
                operation. Accidents and ill health can ruin lives and damage your business. You
                are not expected to eliminate all risk, but you are required to protect people as
                far as is &#8216;reasonably practicable&#8217;. Once you have completed the risk
                assessment, it is important to put your results into practice. If you need to make
                a number of improvements, you should produce an action plan to deal with and implement
                those improvements, starting with the most important actions first.
                
            </div>
            <div class="button_bar" style="text-align: center;">
                    <asp:Button ID="btnAgree" runat="server" Text="I accept that I have Read and Understood the above Disclaimer"
                        OnClick="btnAgree_Click" Style="height: 26px; text-align: center" Width="500px" />
                </div>
        </div>

            

    </div>
    <div style="float:left; width:100%">
            <div style="float:left"><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt="" width="15" height="14" /></div>
            <div style="background-color:White; float:left; height:14px;width:97.2%;"></div>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt="" width="15" height="14" />
        </div>
    
</asp:Content>
