<%@ Page Language="C#" MasterPageFile="~/Common/Register.master" AutoEventWireup="true" CodeFile="UploadOrders.aspx.cs" Inherits="Register_UploadOrders" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="field">
        <asp:FileUpload ID="fileUpload" runat="server" />
    </div>
    <div class="button_bar">
        <asp:Button ID="btnUpload" runat="server" Text="Upload" ValidationGroup="A" OnClick="btnUpload_Click" />
    </div>
    <div style="color:Gray">
        The file should be a CSV file with the following format. 
    </div>    
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/folder_import.png"/>        
    </div>
    <div>
    </div>
</asp:Content>

