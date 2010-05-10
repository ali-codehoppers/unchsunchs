<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="PeopleTypeList.aspx.cs" Inherits="Maintenance_PeopleTypeList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <style type="text/css">
        .field span{width:150px;display:inline-block;}
        .text_field span{width:150px;display:inline-block;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<div class="text_field"><span>People Type:</span><asp:TextBox ID="tbPeopleType" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                runat="server" ErrorMessage="*" CssClass="error" ControlToValidate="tbPeopleType" ValidationGroup="Top"></asp:RequiredFieldValidator></div>
<div class="field"><span>Allow Multiple Entries:</span><asp:CheckBox ID="cbMultiple" runat="server"  /></div>    
<div class="button_bar"><asp:Button ID="btnAdd" runat="server" Text="Add People Type" OnClick="btnAdd_Click" ValidationGroup="Top"/></div>
<div class="grid">
    <asp:GridView ID="gvPeopleTypes" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" DataKeyNames="people_type_id" CssClass="grid_table" PageSize="50" DataSourceID="odsPeopleType" OnRowUpdating="gvPeopleTypes_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="Edit" InsertVisible="False" SortExpression="dept_id">
                <ItemTemplate>
                   <center>
                        <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Images/edit.png" AlternateText="Edit"
                            CommandName="Edit" />
                    </center>
                </ItemTemplate>
                <EditItemTemplate>
                    <center>
                        <asp:ImageButton ID="btnEdit1" runat="server" ImageUrl="~/Images/edit.png" AlternateText="Update"
                            CommandName="Update" />                
                    </center>
                </EditItemTemplate>
                <HeaderStyle Width="45px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete" InsertVisible="False" SortExpression="dept_id">
                <ItemTemplate>
                    <center>
                        <asp:ImageButton ID="ImageButton1" CssClass="noborder" runat="server" ImageUrl="~/Images/delete.png"
                            CommandName="Delete" 
                            OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                    </center>
                </ItemTemplate>
                <EditItemTemplate>
                    <center>
                        <asp:ImageButton ID="ImageButton12" CssClass="noborder" runat="server" ImageUrl="~/Images/delete.png"
                            CommandName="Cancel" />
                    </center>                
                </EditItemTemplate>
                <HeaderStyle Width="45px" />
            </asp:TemplateField>                        
            <asp:TemplateField HeaderText="People Type" SortExpression="people_type">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("people_type") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                runat="server" ErrorMessage="*" CssClass="error" ControlToValidate="TextBox1" ></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("people_type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Multiple?" SortExpression="flg_multiple">
                <EditItemTemplate>
                    <center>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("flg_multiple") %>' />
                    </center>
                </EditItemTemplate>
                <ItemTemplate>
                    <center>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("flg_multiple") %>'
                        Enabled="false" />
                    </center>
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
    <asp:ObjectDataSource ID="odsPeopleType" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetPeopleTypeByCoId"
        TypeName="PeopleTypeTableAdapters.PeopleTypeTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_people_type_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="people_type" Type="String" />
            <asp:Parameter Name="flg_multiple" Type="Boolean" />
            <asp:Parameter Name="Original_people_type_id" Type="Int32" />
            <asp:Parameter Name="people_type_id" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="co_id" Type="Int32" />
            <asp:Parameter Name="people_type" Type="String" />
            <asp:Parameter Name="flg_multiple" Type="Boolean" />
            <asp:Parameter Name="flg_delete" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
</div>
    
</asp:Content>


