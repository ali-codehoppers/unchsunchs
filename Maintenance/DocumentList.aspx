<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="DocumentList.aspx.cs" Inherits="Maintenance_DocumentList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <style type="text/css">
        .text_field span{width:150px;height:100%;display:inline-block;}    
        .field span{width:150px;display:inline-block;}    
        .ddl_field span{width:150px;display:inline-block;}    
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
    Risk Assessments List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div class="ddl_field">
        <span style="width:100px;">Department:</span><asp:DropDownList ID="ddlDepartment" runat="server" 
            DataSourceID="odsDepartment" DataTextField="co_name_short" DataValueField="dept_id"
            AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
        </asp:DropDownList>
    </div>
                    
    <div class="grid">
        <asp:GridView ID="gvDocs" runat="server" AutoGenerateColumns="False" CssClass="grid_table"
        DataKeyNames="doc_id" DataSourceID="odsDocs" PageSize="50" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:TemplateField HeaderText="Edit" >
                    <HeaderStyle Width="50px" />
                    <ItemTemplate>                                        
                        <asp:ImageButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Edit"
                            ImageUrl="~/Images/edit.png" AlternateText="Edit" ></asp:ImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Update"
                            ImageUrl="~/Images/edit.png" AlternateText="Update" ValidationGroup="Grid" ></asp:ImageButton>                    
                    </EditItemTemplate>              
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>            
                <asp:TemplateField HeaderText="Delete" >
                    <HeaderStyle Width="50px" />
                    <EditItemTemplate>
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            ImageUrl="~/Images/delete.png" AlternateText="Cancel" ></asp:ImageButton>                    
                    </EditItemTemplate>
                    <ItemTemplate>                                        
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                            ImageUrl="~/Images/delete.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');"></asp:ImageButton>
                    </ItemTemplate>         
                    <ItemStyle HorizontalAlign="Center" />     
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" SortExpression="category_name">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlCategory" runat="server"
                            DataSourceID="odsCategories" DataTextField="category_name" DataValueField="category_id" SelectedValue='<%# Bind("category_id") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("category_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code" SortExpression="doc_code">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbgDocCode" runat="server" Text='<%# Bind("doc_code") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" CssClass="error"
                            ControlToValidate="tbgDocCode" ValidationGroup="Grid"></asp:RequiredFieldValidator>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("doc_code") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Document Name" SortExpression="doc_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbgDocName" runat="server" Text='<%# Bind("doc_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" CssClass="error"
                            ControlToValidate="tbgDocName" ValidationGroup="Grid"></asp:RequiredFieldValidator>                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("doc_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>        
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
        </asp:GridView>    
        <asp:ObjectDataSource ID="odsDocs" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDocsByTypeName" TypeName="DepartmentOrderDocTableAdapters.DocumentTableAdapter" DeleteMethod="Delete" UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:Parameter DefaultValue="Risk Assessments" Name="doc_type_desc" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Original_doc_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="doc_name" Type="String" />
                <asp:Parameter Name="doc_desc" Type="String" />
                <asp:Parameter Name="doc_code" Type="String" />
                <asp:Parameter Name="category_id" Type="Int32" />
                <asp:Parameter Name="Original_doc_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCategories" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCategoriesByType" TypeName="CategoriesTableAdapters.CategoryTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_category_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="category_name" Type="String" />
                <asp:Parameter Name="Original_category_id" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:Parameter DefaultValue="D" Name="category_type" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="co_id" Type="Int32" />
                <asp:Parameter Name="dept_id" Type="Int32" />
                <asp:Parameter Name="category_name" Type="String" />
                <asp:Parameter Name="category_type" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsDepartment" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        &nbsp;

    </div>

</asp:Content>

