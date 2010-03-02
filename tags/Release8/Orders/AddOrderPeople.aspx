<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderPeople.aspx.cs" Inherits="Orders_AddOrderPeople" Title="Untitled Page" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Common/StyleSheets/Tab.css">
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Includes/yui/build/button/assets/skins/sam/button.css" />
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Includes/yui/build/container/assets/skins/sam/container.css" />

    <script type="text/javascript" src="<%=Request.ApplicationPath%>/Includes/yui/build/container/container-min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    Add/Edit H&amp;S Folder
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">

    <uc1:TabControl ID="TabControl1" runat="server" Selected="People" />
    <div style="text-align: right">
        <div class="button_bar">
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" />
        </div>
    </div>
    <div class="button_bar">
        <asp:Button ID="btnSaveAll" runat="server" Text="Save All" Width="100px" OnClick="btnSaveAll_Click"
           />
    </div>
    <div class="grid">
        <asp:GridView ID="gvPeople" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="sdsDepartmentPerson" 
        PageSize="50" CssClass="grid_table" OnRowDataBound="gvPeople_RowDataBound"   >
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" HorizontalAlign="Center"/>
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" HorizontalAlign="Center"/>
            <RowStyle CssClass="grid_row" HorizontalAlign="Center"/>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsDepartmentPerson" runat="server" ConnectionString="<%$ ConnectionStrings:UNCHSConnectionString %>"
            SelectCommand="DeptPeopleSelectCommand" SelectCommandType="StoredProcedure" DeleteCommand="DeptPeopleDeleteByName" DeleteCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
