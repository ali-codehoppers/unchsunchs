<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="UsersList.aspx.cs" Inherits="Admin_UsersList" Title="Simplicity4Business" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<div class="ddl_field"><span>Company:</span><asp:DropDownList ID="ddlCompany" 
        runat="server" DataSourceID="odsCompany" DataTextField="ShortName" 
        DataValueField="CompanyId" ondatabound="ddlCompany_DataBound" AutoPostBack="true">
        </asp:DropDownList></div>
<div class="ddl_field">
    <span>Role:</span><asp:DropDownList ID="ddlRole" runat="server" 
        AutoPostBack="True">
        <asp:ListItem Text="All" Value="all"></asp:ListItem>
        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
        <asp:ListItem Text="User" Value="User"></asp:ListItem>
    </asp:DropDownList>
</div>
<div class="grid">
    <asp:GridView ID="gvDocs" runat="server" AutoGenerateColumns="False" CssClass="grid_table"
        DataKeyNames="user_id" DataSourceID="odsUsers" PageSize="50" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:TemplateField HeaderText="Edit" >
                <HeaderStyle Width="50px" />
                <ItemTemplate>
                    <a href='AddUser.aspx?userId=<%# Eval("user_id") %>' style="border:none; text-decoration:none;">
                                <img src="../Images/edit.png" alt="Edit" class="noborder" /></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>            
            <asp:TemplateField HeaderText="Delete" >
                <HeaderStyle Width="50px" />
                <ItemTemplate>                                        
                    <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                        ImageUrl="~/Images/delete.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');"></asp:ImageButton>
                </ItemTemplate>         
                <ItemStyle HorizontalAlign="Center" />     
            </asp:TemplateField>
        
            <asp:BoundField DataField="co_name_short" HeaderText="Company" SortExpression="co_name_short" />
            <asp:BoundField DataField="user_name" HeaderText="User Name" SortExpression="user_name" />
            <asp:BoundField DataField="user_logon" HeaderText="User Login" SortExpression="user_logon" />
            <asp:BoundField DataField="user_enable" HeaderText="User Enable" SortExpression="user_enable" />
            <asp:BoundField DataField="user_enable_reminder" HeaderText="User Enable Reminder"
                SortExpression="user_enable_reminder" />
            <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" />
        </Columns>
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
        
    </asp:GridView>
    <asp:ObjectDataSource ID="odsUsers" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetUserByCoAndRole" 
        TypeName="UserTableAdapters.un_co_user_detailsTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_user_id" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCompany" DefaultValue="0" Name="co_id" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlRole" DefaultValue="0" Name="role" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCompany" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllCompanies" 
        
        TypeName="SimplicityCommLib.DataSets.Common.CompanyTableAdapters.CompanyTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_CompanyId" Type="Int32" />
            <asp:Parameter Name="Original_FlgDeleted" Type="Boolean" />
            <asp:Parameter Name="Original_ShortName" Type="String" />
            <asp:Parameter Name="Original_FullName" Type="String" />
            <asp:Parameter Name="Original_ContactTitle" Type="String" />
            <asp:Parameter Name="Original_ContactInitials" Type="String" />
            <asp:Parameter Name="Original_ContactForename" Type="String" />
            <asp:Parameter Name="Original_ContactSurname" Type="String" />
            <asp:Parameter Name="Original_CompanyNotes" Type="String" />
            <asp:Parameter Name="Original_FlgSystemLocked" Type="Boolean" />
            <asp:Parameter Name="Original_CreatedBy" Type="Int32" />
            <asp:Parameter Name="Original_DateCreated" Type="DateTime" />
            <asp:Parameter Name="Original_LastAmenededBy" Type="Int32" />
            <asp:Parameter Name="Original_DateLastAmended" Type="DateTime" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="FlgDeleted" Type="Boolean" />
            <asp:Parameter Name="ShortName" Type="String" />
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="ContactTitle" Type="String" />
            <asp:Parameter Name="ContactInitials" Type="String" />
            <asp:Parameter Name="ContactForename" Type="String" />
            <asp:Parameter Name="ContactSurname" Type="String" />
            <asp:Parameter Name="CompanyNotes" Type="String" />
            <asp:Parameter Name="FlgSystemLocked" Type="Boolean" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:Parameter Name="LastAmenededBy" Type="Int32" />
            <asp:Parameter Name="DateLastAmended" Type="DateTime" />
            <asp:Parameter Name="Original_CompanyId" Type="Int32" />
            <asp:Parameter Name="Original_FlgDeleted" Type="Boolean" />
            <asp:Parameter Name="Original_ShortName" Type="String" />
            <asp:Parameter Name="Original_FullName" Type="String" />
            <asp:Parameter Name="Original_ContactTitle" Type="String" />
            <asp:Parameter Name="Original_ContactInitials" Type="String" />
            <asp:Parameter Name="Original_ContactForename" Type="String" />
            <asp:Parameter Name="Original_ContactSurname" Type="String" />
            <asp:Parameter Name="Original_CompanyNotes" Type="String" />
            <asp:Parameter Name="Original_FlgSystemLocked" Type="Boolean" />
            <asp:Parameter Name="Original_CreatedBy" Type="Int32" />
            <asp:Parameter Name="Original_DateCreated" Type="DateTime" />
            <asp:Parameter Name="Original_LastAmenededBy" Type="Int32" />
            <asp:Parameter Name="Original_DateLastAmended" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="FlgDeleted" Type="Boolean" />
            <asp:Parameter Name="ShortName" Type="String" />
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="ContactTitle" Type="String" />
            <asp:Parameter Name="ContactInitials" Type="String" />
            <asp:Parameter Name="ContactForename" Type="String" />
            <asp:Parameter Name="ContactSurname" Type="String" />
            <asp:Parameter Name="CompanyNotes" Type="String" />
            <asp:Parameter Name="FlgSystemLocked" Type="Boolean" />
            <asp:Parameter Name="CreatedBy" Type="Int32" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:Parameter Name="LastAmenededBy" Type="Int32" />
            <asp:Parameter Name="DateLastAmended" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>    
</div>
</asp:Content>

