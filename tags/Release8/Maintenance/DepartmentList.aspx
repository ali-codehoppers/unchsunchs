<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="DepartmentList.aspx.cs" Inherits="Maintenance_DepartmentList" Title="Department List" %>

<asp:Content ContentPlaceHolderID="HeadingPlaceHolder" ID="HeadingContent" runat="server">
    Departments List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <asp:ObjectDataSource ID="odsDepartment" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter"
        DeleteMethod="Delete" InsertMethod="Insert">
        <DeleteParameters>
            <asp:Parameter Name="Original_dept_id" Type="Int32" />
        </DeleteParameters>
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
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div class="field">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Maintenance/AddDepartment.aspx">Add a New Department</asp:HyperLink>
    </div>
    <div class="grid">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid"
            BorderWidth="1px" CellPadding="3" DataKeyNames="dept_id" DataSourceID="odsDepartment"
            ForeColor="Black" GridLines="Vertical" Width="100%" PageSize="50">
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
                        
                            <asp:ImageButton ID="ImageButton1" CssClass="noborder" runat="server" ImageUrl="~/Images/delete.png"
                                OnCommand="DeleteDepartment" CommandArgument='<%# Eval("dept_id") %>' OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                        
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
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
    </div>
</asp:Content>
