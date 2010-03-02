<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="DocumentTypeList.aspx.cs" Inherits="Maintenance_DocumentTypeList" Title="Untitled Page" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <style type="text/css">
        .text_field span{width:200px;height:100%;display:inline-block;}    
        .field span{width:200px;display:inline-block;}    
        .ddl_field span{width:200px;display:inline-block;}    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
    Document Type List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div class="ddl_field">
        <span>Department:</span><asp:DropDownList ID="ddlDepartment" runat="server" 
            DataSourceID="odsDepartment" DataTextField="co_name_short" DataValueField="dept_id"
            AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
        </asp:DropDownList>
    
    </div>
    <div class="text_field">
        <span>Document Type Desc:</span><asp:TextBox ID="tbDesc" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="tbDesc" ValidationGroup="Add"></asp:RequiredFieldValidator>    
    </div>
    <div class="text_field">
        <span>Sort Order:</span><ew:NumericBox ID="tbSortOrder" runat="server"></ew:NumericBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="tbSortOrder" ValidationGroup="Add"></asp:RequiredFieldValidator>    
    </div>
    <div class="field">
        <span>Required?:</span><asp:CheckBox ID="cbReqd" runat="server" />
    </div>    
    <div class="text_field">
        <span>Style:</span><asp:TextBox ID="tbStyle" runat="server"></asp:TextBox>
    </div>    
    <div class="text_field">
        <span>Custom Document:</span>
        <asp:FileUpload ID="fileContents" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="fileContents" ValidationGroup="Add"></asp:RequiredFieldValidator>    
    </div>
    <div class="button_bar">
        <asp:Button ID="btnAdd" runat="server" Text="Add Document Type" OnClick="btnAdd_Click" ValidationGroup="Add" />
    </div>
    <div class="grid">
                <asp:GridView ID="gvDocTypes" runat="server" AutoGenerateColumns="False" CssClass="grid_table"
        DataKeyNames="doc_data_type_id" DataSourceID="odsDocTypes" PageSize="50" AllowPaging="True" AllowSorting="True">
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
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
                        <asp:TemplateField HeaderText="Document Type" SortExpression="doc_data_type_desc">
                        
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("doc_data_type_desc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("doc_data_type_desc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Index" SortExpression="sort_order">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("sort_order") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("sort_order") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Required?" SortExpression="required">
                            <EditItemTemplate>
                                <center>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("required") %>' />
                                </center>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <center>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("required") %>' Enabled="false" />
                                </center>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Style" SortExpression="style">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("style") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("style") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="People Type" >                    
                            <ItemTemplate>                
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"~/Maintenance/DocumentTypePeopleTypeList.aspx?" + WebConstants.Request.DEPT_ID + "=" + Eval("dept_id") + "&" + WebConstants.Request.DOC_TYPE_ID + "=" + Eval("doc_data_type_id") + "&" + WebConstants.Request.DOC_TYPE_NAME + "=" + Eval("doc_data_type_desc") %>'>People Types</asp:HyperLink>                                                        
                            </ItemTemplate>                             
                        </asp:TemplateField>

                    </Columns>
        </asp:GridView>    
    </div>
    <asp:ObjectDataSource ID="odsDepartment" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDocTypes" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDocTypeByDeptId" TypeName="DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter" DeleteMethod="Delete" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Original_doc_data_type_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="doc_data_type_desc" Type="String" />
            <asp:Parameter Name="style" Type="String" />
            <asp:Parameter Name="flg_landscape" Type="Boolean" />
            <asp:Parameter Name="Original_doc_data_type_id" Type="Int32" />
            <asp:Parameter Name="sort_order" Type="Int32" />
            <asp:Parameter Name="required" Type="Boolean" />
        </UpdateParameters>
    </asp:ObjectDataSource>

</asp:Content>

