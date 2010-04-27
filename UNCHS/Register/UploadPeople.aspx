<%@ Page Language="C#" MasterPageFile="~/Common/Register.master" AutoEventWireup="true" CodeFile="UploadPeople.aspx.cs" Inherits="Register_UploadPeople" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div>
            <asp:Label ID="Label3" runat="server" Text="Select File:"> </asp:Label>
            <asp:FileUpload ID="FileUploader" runat="server" />
            <asp:Button ID="UploadButton" runat="server" Text="Upload" OnClick="UploadButton_Click" />
        </div>
        <div style="color:Gray">
            The file should be a CSV file with the following format. 
        </div>
        <div>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/people_excel.png"/>
        </div>
    </div>
</asp:Content>

