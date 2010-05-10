<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="DocumentTypePeopleTypeList.aspx.cs" Inherits="Maintenance_DocumentTypePeopleTypeList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <style type="text/css">
        .text_field span{width:150px;height:100%;display:inline-block;}    
        .field span{width:150px;display:inline-block;}    
        .ddl_field span{width:150px;display:inline-block;}    
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
    Document Type People Type List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div class="field">
        <span>Document Type: </span>
        <asp:Label ID="lblDocType" runat="server" Text=""></asp:Label>
    </div>
    <div class="ddl_field">
        <span>People Type:</span>
        <asp:DropDownList ID="ddlPeopleType" runat="server" DataSourceID="odsPeopleType" DataTextField="people_type" DataValueField="people_type_id"></asp:DropDownList>    
    </div>
    <div class="button_bar">
        <asp:Button ID="btnAdd" runat="server" Text="Add People Type" OnClick="btnAdd_Click" />    
        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />    
    </div>
    <div class="grid">
        <asp:GridView ID="gvPeople" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="odsDocTypePeopleType" PageSize="50" CssClass="grid_table" AutoGenerateColumns="False" DataKeyNames="doc_type_people_type_id" >
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row"/>
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row"/>
            <RowStyle CssClass="grid_row"/>        
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
            
                <asp:TemplateField HeaderText="doc_data_type_desc" SortExpression="doc_data_type_desc">
                    <EditItemTemplate>
                         <asp:Label ID="Label12" runat="server" Text='<%# Bind("doc_data_type_desc") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("doc_data_type_desc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="people_type" SortExpression="people_type">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlPeopleType2" runat="server" DataSourceID="odsPeopleType" DataTextField="people_type" DataValueField="people_type_id" SelectedValue='<%# Bind("people_type_id") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("people_type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>        
        <asp:ObjectDataSource ID="odsPeopleType" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetPeopleTypeByCoId" TypeName="PeopleTypeTableAdapters.PeopleTypeTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsDocTypePeopleType" runat="server" DeleteMethod="Delete"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetByDocTypeId" TypeName="DepartmentOrderDocTableAdapters.DocTypePeopleTypeTableAdapter">
            <DeleteParameters>
                <asp:Parameter Name="Original_doc_type_people_type_id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="dept_id" QueryStringField="depId"
                    Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="doc_type_id" QueryStringField="docTypeId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

