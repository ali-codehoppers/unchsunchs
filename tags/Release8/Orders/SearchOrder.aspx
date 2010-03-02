<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="SearchOrder.aspx.cs" Inherits="Orders_SearchOrder" Title="Untitled Page"
    EnableEventValidation="true" %>

<%@ Register Assembly="jQueryDatePicker" Namespace="Westwind.Web.Controls" TagPrefix="ww" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <style type="text/css">
        .ddl_margin
        {
            margin-right:5px;
            width: 105px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    Search H&amp;S Folder
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="field">
        <asp:Label ID="lblDepartment" CssClass="label" runat="server" Text="Department:" style="width:100px;"></asp:Label><asp:DropDownList
            ID="ddlDepartments" runat="server" AppendDataBoundItems="True" DataSourceID="odsDepartments"
            DataTextField="co_name_short" DataValueField="dept_id" OnDataBound="ddlDepartments_DataBound" CssClass="ddl_margin" Width="155px" >
        </asp:DropDownList>
        <span class="label" style="width:100px;">Reference:</span><asp:TextBox ID="tbOrderRef" runat="server"></asp:TextBox>
    </div>
    <div class="field">
        <span class="label" style="width:100px;">Post Code:</span><asp:TextBox ID="tbPostCode" runat="server"></asp:TextBox>    
        <span class="label" style="margin-left:5px;width:100px;">Site Address:</span><asp:TextBox ID="tbSiteAddress" runat="server" Width="300px"></asp:TextBox>
    </div>
    <div class="field">
        <span class="label" style="width:100px;">Order Date:</span><span class="label" style="width:40px;">From:</span><ww:jQueryDatePicker ID="tbDateFrom" runat="server"
            DisplayMode="AutoPopup" ></ww:jQueryDatePicker>
        <span class="label" style="margin-left:5px;width:25px;">To:</span><ww:jQueryDatePicker ID="tbToDate" runat="server"
            DisplayMode="AutoPopup" ></ww:jQueryDatePicker>
    </div>
    <div class="field" style="display:none;">
        <span class="label">Client Reference:</span><asp:TextBox ID="tbClientRef" runat="server"></asp:TextBox></div>
    <div class="button_bar">
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        <asp:ObjectDataSource ID="odsDepartments" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsDeptOrder" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetSearchResults"
            TypeName="DepartmentOrderTableAdapters.DepartmentOrderSearchCommandTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDepartments" DefaultValue="0" Name="dept_id"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="tbSiteAddress" DefaultValue="" Name="site_add" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="tbOrderRef" Name="ord_ref" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="tbClientRef" Name="client_ref" PropertyName="Text"
                    Type="String" DefaultValue="" />
                <asp:ControlParameter ControlID="tbDateFrom" DefaultValue="" Name="from_date" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="tbToDate" Name="to_date" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="tbPostCode" Name="postal_code" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" CssClass="grid_table"
        AutoGenerateColumns="False" DataKeyNames="sequence" OnRowDeleting="GridView1_RowDeleting" DataSourceID="odsDeptOrder"
        PageSize="50" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField ShowHeader="True" HeaderText="Edit">
                <ItemTemplate>
                    <center>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" ImageUrl="~/Images/edit.png" 
                        CommandName="EditOrder" CommandArgument='<%# Eval("sequence") %>' AlternateText="Edit" />
                    </center>
                </ItemTemplate>
                <HeaderStyle Width="45px" />
            </asp:TemplateField>
            
            
            <asp:TemplateField ShowHeader="True" HeaderText="Delete">
                <ItemTemplate>
                    <center>
                    <asp:ImageButton ID="LinkButton3" runat="server" CausesValidation="False" ImageUrl="~/Images/delete.png"
                        CommandName="Delete" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                    </asp:ImageButton>
                    </center>
                </ItemTemplate>
                <HeaderStyle Width="45px" />
            </asp:TemplateField>
            
            <asp:TemplateField ShowHeader="True" HeaderText="Cancel">
                <ItemTemplate>
                    <center>
                    <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" ImageUrl="~/Images/cancel_order.png" Visible='<%#!Convert.ToBoolean(Eval("flg_cancelled"))%>'
                        CommandName="CancelOrder" CommandArgument='<%# Eval("sequence") %>' AlternateText="Cancel" OnClientClick="return confirm('Are you sure you want to Cancel this order?');" />                    
                    <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" ImageUrl="~/Images/un_cancel_order.png" Visible='<%#Convert.ToBoolean(Eval("flg_cancelled"))%>'
                        CommandName="UncancelOrder" CommandArgument='<%# Eval("sequence") %>' AlternateText="Uncancel" OnClientClick="return confirm('Are you sure you want to Uncancel this order?');" />
                    </center>
                </ItemTemplate>
                <HeaderStyle Width="45px" />
            </asp:TemplateField>
                     <asp:BoundField DataField="order_sms" HeaderText="SMS Reference" SortExpression="order_sms">
                
            </asp:BoundField>
            <asp:TemplateField HeaderText="Address" SortExpression="address_post_code">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("address_post_code") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("address_no") %> '></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("address_line1") %> '></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("address_post_code") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>            
            <asp:BoundField DataField="date_order_created" HeaderText="Date Created" SortExpression="date_order_created"
                DataFormatString="{0:dd/MM/yyyy}">
                
            </asp:BoundField>
            <asp:BoundField DataField="date_order_review" HeaderText="Review Date" SortExpression="date_order_review"
                DataFormatString="{0:dd/MM/yyyy}">
                
            </asp:BoundField>
        </Columns>
        <PagerStyle CssClass="grid_pager" />
        <FooterStyle CssClass="grid_footer" />
        <HeaderStyle CssClass="grid_header" />
        <SelectedRowStyle CssClass="grid_selected_row" />
        <HeaderStyle CssClass="grid_header" />
        <AlternatingRowStyle CssClass="grid_alternating_row" />
        <RowStyle CssClass="grid_row" />
    </asp:GridView>
    <input id="__SAVESCROLL" name="__SAVESCROLL" value="0" type="hidden" runat="server" />
</asp:Content>
