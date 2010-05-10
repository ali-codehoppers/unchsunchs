<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderKeyAspects.aspx.cs" Inherits="Orders_AddOrderKeyAspects" Title="Untitled Page" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Common/StyleSheets/Tab.css" />
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Includes/yui/build/button/assets/skins/sam/button.css" />
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Includes/yui/build/container/assets/skins/sam/container.css" />

    <script type="text/javascript" src="<%=Request.ApplicationPath%>/Includes/yui/build/container/container-min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    Add/Edit H&amp;S Folder
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <uc2:TabControl ID="TabControl2" runat="server" Selected="Aspects" />
    <div style="text-align: right">
        <div class="button_bar">
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" />
        </div>
    </div>
    <div class="field">
        <span class="heading">Key Aspects of Site Induction:</span>
    </div>
    <div class="text_field">
        <asp:TextBox ID="tbKeyAspectHeader" runat="server" Rows="3" TextMode="MultiLine" width="780"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tbKeyAspectHeader"
            ErrorMessage="*" ValidationGroup="KeyAspect"></asp:RequiredFieldValidator>
    </div>
    <div class="button_bar">
        <asp:Button ID="btnAddKeyAspect" runat="server" Text="Add Key Aspect" OnClick="btnAddKeyAspect_Click"
            ValidationGroup="KeyAspect" />
    </div>
    <div class="grid">
        <asp:GridView ID="gvKeyAspect" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" DataKeyNames="sequence" DataSourceID="odsKeyAspect"
            OnRowDeleting="gvKeyAspect_RowDeleting" CssClass="grid_table"
            OnRowUpdating="gvKeyAspect_RowUpdating" PageSize="50">
            <Columns>
                <asp:TemplateField HeaderText="Edit">
                    <EditItemTemplate>
                        <center>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update"
                            ImageUrl="~/Images/edit.png" AlternateText="Update"></asp:ImageButton>
                        </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <center>
                        <asp:ImageButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                            ImageUrl="~/Images/edit.png" AlternateText="Edit"></asp:ImageButton>
                    </center>
                    </ItemTemplate>
                    <HeaderStyle Width="45px"/>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <EditItemTemplate>
                    <center>
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            ImageUrl="~/Images/delete.png" AlternateText="Cancel"></asp:ImageButton>
                    </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <center>
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                            ImageUrl="~/Images/delete.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                        </asp:ImageButton>
                    </center>
                    </ItemTemplate>
                    <HeaderStyle Width="45px"/>
                </asp:TemplateField>                
                <asp:BoundField DataField="key_aspect_header" HeaderText="Key Aspects" SortExpression="key_aspect_header" />                
            </Columns>
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <HeaderStyle CssClass="grid_header" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
        </asp:GridView>
        &nbsp;
    </div>
    <asp:HiddenField ID="hfDeptId" runat="server" />
    <asp:ObjectDataSource ID="odsKeyAspect" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllKeyAspects" TypeName="DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter"
        DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="sequence" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfDeptId" DefaultValue="0" Name="dept_id" PropertyName="Value"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="order_seq" QueryStringField="deptOrderId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
