<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryControl.ascx.cs" Inherits="Common_UserControls_CategoryControl" %>
<div class="ddl_field">
    <asp:Label ID="lblDepartment" runat="server" Text="Department:"></asp:Label><asp:DropDownList
        ID="ddlDepartment" runat="server" DataSourceID="odsDept" DataTextField="co_name_short"
        DataValueField="dept_id" OnDataBound="ddlDepartment_DataBound" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
    </asp:DropDownList>
</div>
<div class="text_field" >
    <span >Category:</span><asp:TextBox ID="tbCategory" runat="server"></asp:TextBox><asp:RequiredFieldValidator
        ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="tbCategory" ValidationGroup="Add"></asp:RequiredFieldValidator>
</div>
<div class="button_bar">
    <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" OnClick="btnAddCategory_Click" ValidationGroup="Add" />    
</div>
<div class="grid">
    <asp:GridView ID="gvCategories" runat="server" CssClass="grid_table" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="category_id" DataSourceID="odsCategories" PageSize="50" OnRowUpdating="gvCategories_RowUpdating" >
    
        <PagerStyle CssClass="grid_pager" />
        <FooterStyle CssClass="grid_footer" />
        <SelectedRowStyle CssClass="grid_selected_row" />
        <HeaderStyle CssClass="grid_header" />
        <AlternatingRowStyle CssClass="grid_alternating_row" />
        <RowStyle CssClass="grid_row" />
        <Columns>
            <asp:TemplateField HeaderText="Edit">
                <EditItemTemplate>
                    <asp:ImageButton ID="btnEdit1" runat="server" ImageUrl="~/Images/edit.png" AlternateText="Update" CommandName="Update"
                          />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="btnEdit1" runat="server" ImageUrl="~/Images/edit.png" AlternateText="Edit"
                        CommandName="Edit"  />
                </ItemTemplate>
                <HeaderStyle Width="50px" HorizontalAlign="Center"/>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>            
            <asp:TemplateField HeaderText="Delete">
                <EditItemTemplate>
                    <asp:ImageButton ID="btnEdit2" runat="server" ImageUrl="~/Images/delete.png" AlternateText="Cancel" CommandName="Cancel"
                          />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="btnEdit2" runat="server" ImageUrl="~/Images/delete.png" AlternateText="Delete"
                        CommandName="Delete"  />
                </ItemTemplate>
                <HeaderStyle Width="50px" HorizontalAlign="Center"/>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>            
            
            <asp:BoundField DataField="category_name" HeaderText="Category Name" SortExpression="category_name" />
        </Columns>

    </asp:GridView>    
    
</div>
<asp:HiddenField ID="hfCategoryType" runat="server" />
<asp:ObjectDataSource ID="odsDept" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsCategories" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCategoriesByType" TypeName="CategoriesTableAdapters.CategoryTableAdapter" UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="Original_category_id" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="category_name" Type="String" />
        <asp:Parameter Name="Original_category_id" Type="Int32" />
        <asp:Parameter Name="category_id" Type="Int32" />
    </UpdateParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
            Type="Int32" />
        <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
        <asp:ControlParameter ControlID="hfCategoryType" DefaultValue="" Name="category_type"
            PropertyName="Value" Type="String" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="co_id" Type="Int32" />
        <asp:Parameter Name="dept_id" Type="Int32" />
        <asp:Parameter Name="category_name" Type="String" />
        <asp:Parameter Name="category_type" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>
