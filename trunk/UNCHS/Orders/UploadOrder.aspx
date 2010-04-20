<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="UploadOrder.aspx.cs" Inherits="Orders_UploadOrder" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    Upload H&amp;S Folder<br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="field">
        <asp:Label ID="lblDepartment" runat="server" CssClass="label" Style="width: 100px"
            Text="Department:"></asp:Label><asp:DropDownList ID="ddlDepartments" runat="server"
                AppendDataBoundItems="True" CssClass="ddl_margin" DataSourceID="odsDepartments"
                DataTextField="co_name_short" DataValueField="dept_id" OnDataBound="ddlDepartments_DataBound"
                Width="155px">
            </asp:DropDownList>
        &nbsp;
    </div>
    <div class="field">
        <asp:FileUpload ID="fileUpload" runat="server" />
    </div>
    <div class="button_bar">
        <asp:Button ID="btnUpload" runat="server" Text="Upload" ValidationGroup="A" OnClick="btnUpload_Click" />
    </div>
    <div style="font-size: 3; font-weight: bold; color: Navy;">
<br />
        Format of CSV
        <table>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        <table width="669" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <b>address_line1,address_line2,address_line3,address_line4,address_line5,address_post_code</b>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Address 1,Address 2,Address 3,Address 4,Address 5,AB00 0ZZ</b>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="odsDepartments" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
