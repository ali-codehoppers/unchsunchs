<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="AddDepartment.aspx.cs" Inherits="Maintenance_AddDepartment" Title="Add Department" %>
<asp:Content ContentPlaceHolderID="HeadContentPlaceHolder" ID="Content3" runat="server">
    <style type="text/css">
        .text_field span{width:150px;height:100%;display:inline-block;}    
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="HeadingPlaceHolder" ID="Content2" runat="server">
Add/Edit Department
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
     <div class="text_field"><span>Department Name Short:</span><asp:TextBox ID="txtCompanyShortName" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCompanyShortName"
             ErrorMessage="*Short Name Required">     </asp:RequiredFieldValidator></div>
     <div class="text_field"><span >Department Name Long:</span><asp:TextBox ID="txtCompanyLongName" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCompanyLongName"
             ErrorMessage="*Long Name Required"></asp:RequiredFieldValidator></div>
     <div class="text_field"><span >Contact Title:</span><asp:TextBox ID="txtContactTitle" runat="server"></asp:TextBox></div>
     <div class="text_field"><span >Contact Initials:</span><asp:TextBox ID="txtContactInitial" runat="server"></asp:TextBox></div>
     <div class="text_field"><span >Contact Forename:</span><asp:TextBox ID="txtForename" runat="server"></asp:TextBox></div>
     <div class="text_field"><span >Contact Surname:</span><asp:TextBox ID="txtSurname" runat="server"></asp:TextBox></div>
     <div class="text_field"><span >Address No:</span><asp:TextBox ID="txtAddressNo" runat="server"></asp:TextBox></div>
     <div class="text_field"><span >Address:</span><asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox></div>
     <div class="text_field"><span ></span><asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox></div>
     <div class="text_field"><span ></span><asp:TextBox ID="txtAddress3" runat="server"></asp:TextBox></div>
     <div class="text_field"><span ></span><asp:TextBox ID="txtAddress4" runat="server"></asp:TextBox></div>
     <div class="text_field"><span ></span><asp:TextBox ID="txtAddress5" runat="server"></asp:TextBox></div>
     <div class="text_field"><span >Postal Code:</span><asp:TextBox ID="txtPostalCode" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPostalCode"
             ErrorMessage="*Postal code Required"></asp:RequiredFieldValidator></div>
     
     <div class="text_field"><span >Phone 1:</span><asp:TextBox ID="txtTele1" runat="server"></asp:TextBox></div>
     <div class="text_field"><span >Phone 2:</span><asp:TextBox ID="txtTele" runat="server"></asp:TextBox></div>
     <div class="text_field"><span >Fax:</span><asp:TextBox ID="txtFax" runat="server"></asp:TextBox></div>
     <div class="text_field"><span >Email:</span><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail"
             ErrorMessage="*Enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
     </div>
     <div class="text_field">
        <table border="0" cellpadding="0" cellspacing="0"><tr><td style="vertical-align:middle;"><span >Notes:</span></td><td><asp:TextBox ID="txtCoNotes" runat="server" Rows="5"
            TextMode="MultiLine" ></asp:TextBox></td>
        </tr>
        </table>
     </div>
     <div class="button_bar"><asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>
         <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" /></div>
      <asp:ValidationSummary ID="ValidationSummary1" runat="server" /> 
</asp:Content>

