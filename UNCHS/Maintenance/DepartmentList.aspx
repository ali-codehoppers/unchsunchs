<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="DepartmentList.aspx.cs" Inherits="Maintenance_DepartmentList" Title="Department List" %>

<asp:Content ContentPlaceHolderID="HeadingPlaceHolder" ID="HeadingContent" runat="server">
    Departments List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <asp:ObjectDataSource ID="odsDepartment" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfCoId" DefaultValue="0" Name="co_id" PropertyName="Value"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Original_dept_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="co_name_short" Type="String" />
            <asp:Parameter Name="co_name_long" Type="String" />
            <asp:Parameter Name="contact_title" Type="String" />
            <asp:Parameter Name="contact_initails" Type="String" />
            <asp:Parameter Name="contact_forename" Type="String" />
            <asp:Parameter Name="contact_surname" Type="String" />
            <asp:Parameter Name="address_no" Type="String" />
            <asp:Parameter Name="address_line1" Type="String" />
            <asp:Parameter Name="address_line2" Type="String" />
            <asp:Parameter Name="address_line3" Type="String" />
            <asp:Parameter Name="address_line4" Type="String" />
            <asp:Parameter Name="address_line5" Type="String" />
            <asp:Parameter Name="address_post_code" Type="String" />
            <asp:Parameter Name="address_full" Type="String" />
            <asp:Parameter Name="tel_1" Type="String" />
            <asp:Parameter Name="tel_2" Type="String" />
            <asp:Parameter Name="tel_fax" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="co_notes" Type="String" />
            <asp:Parameter Name="last_amended_by" Type="Int32" />
            <asp:Parameter Name="date_last_amended" Type="DateTime" />
            <asp:Parameter Name="dept_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="co_id" Type="Int32" />
            <asp:Parameter Name="flg_deleted" Type="Boolean" />
            <asp:Parameter Name="co_name_short" Type="String" />
            <asp:Parameter Name="co_name_long" Type="String" />
            <asp:Parameter Name="contact_title" Type="String" />
            <asp:Parameter Name="contact_initails" Type="String" />
            <asp:Parameter Name="contact_forename" Type="String" />
            <asp:Parameter Name="contact_surname" Type="String" />
            <asp:Parameter Name="address_no" Type="String" />
            <asp:Parameter Name="address_line1" Type="String" />
            <asp:Parameter Name="address_line2" Type="String" />
            <asp:Parameter Name="address_line3" Type="String" />
            <asp:Parameter Name="address_line4" Type="String" />
            <asp:Parameter Name="address_line5" Type="String" />
            <asp:Parameter Name="address_post_code" Type="String" />
            <asp:Parameter Name="address_full" Type="String" />
            <asp:Parameter Name="tel_1" Type="String" />
            <asp:Parameter Name="tel_2" Type="String" />
            <asp:Parameter Name="tel_fax" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="co_notes" Type="String" />
            <asp:Parameter Name="created_by" Type="Int32" />
            <asp:Parameter Name="date_created" Type="DateTime" />
            <asp:Parameter Name="last_amended_by" Type="Int32" />
            <asp:Parameter Name="date_last_amended" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCompanies" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllCompanies" 
        TypeName="SimplicityCommLib.DataSets.Common.CompanyTableAdapters.CompanyTableAdapter"></asp:ObjectDataSource>
    <div class="field">
        <asp:HiddenField ID="hfCoId" runat="server" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Maintenance/AddDepartment.aspx">Add 
        a New Department</asp:HyperLink>
    </div>
    <div class="ddl_field">
        <asp:Label ID="lblCompany" runat="server" Text="Company"></asp:Label>
        <asp:DropDownList ID="ddlCompanies" runat="server" DataSourceID="odsCompanies" DataTextField="co_name_short" DataValueField="co_id" AutoPostBack="True" OnSelectedIndexChanged="ddlCompanies_SelectedIndexChanged">
        </asp:DropDownList>
    </div>
    <div class="grid">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CssClass="grid_table"
            DataKeyNames="dept_id" DataSourceID="odsDepartment"
             PageSize="50">
            <Columns>
                <asp:TemplateField HeaderText="Edit" InsertVisible="False" SortExpression="dept_id">
                    <ItemTemplate>
                    <center>
                        
                            <a href='AddDepartment.aspx?depId=<%# Eval("dept_id") %>' style="border:none; text-decoration:none;">
                                <img src="../Images/edit.png" alt="Edit" class="noborder" /></a>
                        
                    </center>                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete" InsertVisible="False" SortExpression="dept_id">
                    <ItemTemplate>
                    <center>
                        
                            <asp:ImageButton ID="ImageButton1" CssClass="noborder" runat="server" ImageUrl="~/Images/delete.png" CommandName="Delete"
                                 OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                        
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>                
                <asp:BoundField DataField="co_name_short" HeaderText="Short Name" SortExpression="co_name_short">
                    <HeaderStyle Width="20%" />
                </asp:BoundField>
                <asp:BoundField DataField="co_name_long" HeaderText="Long Name" SortExpression="co_name_long">
                    <HeaderStyle Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="address_full" HeaderText="Address" SortExpression="address_full">
                    <HeaderStyle Width="40%" />
                </asp:BoundField>
            </Columns>
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
        </asp:GridView>
    </div>
</asp:Content>
