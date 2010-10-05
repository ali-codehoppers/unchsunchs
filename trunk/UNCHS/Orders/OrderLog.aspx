<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="OrderLog.aspx.cs" Inherits="Orders_OrderLog" Title="Simplicity4Business" %>
<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
    Add/Amend H&amp;S Folder
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server"><uc1:TabControl ID="TabControl1" runat="server" Selected="Log" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    <div class="button_bar" style="text-align:right;">

<input type="image" onclick="window.opener='x';window.close();return false;" src="../Images/Cancel.gif" onmouseover="this.src='../Images/Cancel_rollover_selected.gif';" onmouseout="this.src='../Images/Cancel.gif';"/>

</div>
    <div class="grid">
        <asp:GridView ID="gvLogs" runat="server" AutoGenerateColumns="False" DataKeyNames="log_id" DataSourceID="odsLog" PageSize="50" Width="50%" CssClass="grid_table">
            <Columns>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                    <center>
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                            ImageUrl="~/Images/delete.png" AlternateText="Delete"></asp:ImageButton>
                    </center>
                    </ItemTemplate>
                    <HeaderStyle Width="45px" />
                </asp:TemplateField>
                <asp:BoundField DataField="user_name" HeaderText="Created By" SortExpression="user_name">
                    <HeaderStyle Width="70px" />
                </asp:BoundField>
                <asp:BoundField DataField="creation_time" HeaderText="Creation Time" SortExpression="creation_time">
                    <ItemStyle Width="30%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Folder" SortExpression="file_path">
                    <EditItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# Bind("file_path") %>' >Folder</asp:HyperLink>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# Bind("file_path") %>'>Folder</asp:HyperLink>                        
                    </ItemTemplate>
                    <ItemStyle Width="30%" />
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <HeaderStyle CssClass="grid_header" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
        </asp:GridView>
    </div>
    <asp:ObjectDataSource ID="odsLog" runat="server" DeleteMethod="Delete"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetLogByOrderId"
        TypeName="DepartmentOrderDetailTableAdapters.DepartmentOrderLogTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_log_id" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="order_id" QueryStringField="deptOrderId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

