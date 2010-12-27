<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="Home" Title="Simplicity4Business" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div style="float: left;">
        <img src="<%=this.ResolveClientUrl("~/images/big_pnl_left.jpg")%>" alt="" height="20" />
    </div>
    <div style="float: left; width: 66.4%;">
        <img src="<%=this.ResolveClientUrl("~/Images/big_pnl_mid.jpg")%>" alt="" style="width: 100%"
            height="20" />
    </div>
    <div>
        <img src="<%=this.ResolveClientUrl("~/images/big_pnl_right.jpg")%>" alt="" height="20" />
    </div>
    <asp:Image ID="homeimage" runat="server" ImageUrl="~/Images/Health_safety_main_image.jpg" Width="590px"/>
    <div style="float:left; width:70.7%">
            <div style="float:left"><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt="" width="15" height="14" /></div>
            <div style="background-color:White; float:left; height:14px; width:94.3%"></div>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt="" width="15" height="14" />
        </div>
</asp:Content>

