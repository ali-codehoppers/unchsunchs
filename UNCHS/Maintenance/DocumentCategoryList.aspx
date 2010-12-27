<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="DocumentCategoryList.aspx.cs" Inherits="Maintenance_DocumentCategoryList" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/CategoryControl.ascx" TagName="CategoryControl"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
       <div style="float: left;">
        <img src="<%=this.ResolveClientUrl("~/images/big_pnl_left.jpg")%>" alt="" height="20" />
    </div>
    <div style="float: left; width: 96.05%;">
        <img src="<%=this.ResolveClientUrl("~/Images/big_pnl_mid.jpg")%>" alt="" style="width: 100%"
            height="20" />
    </div>
    <div>
        <img src="<%=this.ResolveClientUrl("~/images/big_pnl_right.jpg")%>" alt="" height="20" />
    </div>
    <div style="background-color: White; border-top: 1px solid white">
        <div style="margin: auto; width: 98%">
            <div style="float: left">
                <img src="<%=this.ResolveClientUrl("~/images/bc_left.jpg")%>" alt="" width="8" height="31" /></div>
            <div class="breadcrum_mid" style="height: 23px; padding-top: 8px; float: left; width: 96%">
                Document Category List
            </div>
            <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
        </div>
    </div> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<div style="background-color: White; padding: 15px 10px 25px 10px">
    <uc1:CategoryControl id="CategoryControl1" runat="server" CategoryType="D">
    </uc1:CategoryControl>  
        </div>
    <div style="float: left; width: 100%">
        <div style="float: left">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt=""
                Width="15" Height="14" /></div>
        <div style="background-color: White; float: left; height: 14px; width: 96.2%;">
        </div>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt=""
            Width="15" Height="14" />
    </div>      
</asp:Content>

