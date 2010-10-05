<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="DepartmentPersonList.aspx.cs" Inherits="Maintenance_DepartmentPersonList"
    Title="Simplicity4Business" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/fonts/fonts-min.css")%>" />

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/animation/animation-min.js")%>"></script>

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/dragdrop/dragdrop-min.js")%>"></script>

    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/DDStyle.css")%>" />

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/unchs/DragDrop.js")%>"></script>

    <style type="text/css">
        .text_field span{width:150px;height:100%;display:inline-block;}    
        .field span{width:150px;display:inline-block;}    
        .ddl_field span{width:150px;display:inline-block;}    
    </style>

</asp:Content>
<asp:Content ContentPlaceHolderID="HeadingPlaceHolder" ID="ContenPlaceHolder2" runat="server">
    Default Person List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="ddl_field">
        <span>Department:</span><asp:DropDownList ID="ddlDepartment" runat="server" 
            DataSourceID="odsDepartment" DataTextField="co_name_short" DataValueField="dept_id"
            AutoPostBack="true">
        </asp:DropDownList></div>
    <div class="text_field">
        <span>Person:</span><asp:TextBox ID="tbName" runat="server" ></asp:TextBox><asp:RequiredFieldValidator
            ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" CssClass="error"
            ControlToValidate="tbName" ValidationGroup="Top"></asp:RequiredFieldValidator></div>
    <div class="field">
        <asp:Label ID="lblSupervisor" runat="server" Text="Supervisor:"></asp:Label><asp:CheckBox ID="chkboxSupervisor" runat="server" /></div>
    <div class="field">
        <asp:Label ID="lblFirstAider" runat="server" Text="First Aider:"></asp:Label><asp:CheckBox ID="chkboxFirstAider" runat="server" /></div>
    <div class="field">
        <asp:Label ID="lblFireWarden" runat="server" Text="Fire Warden:"></asp:Label><asp:CheckBox ID="chkboxWarden" runat="server" /></div>
    <div class="button_bar">
        <asp:Button ID="btnAdd" runat="server" Text="Add Person" OnClick="btnAdd_Click" ValidationGroup="Top" />
        <asp:Button ID="btnUpate" runat="server" OnClick="btnUpate_Click" Text="Update Person"
            Visible="False" ValidationGroup="Top" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
        <asp:HiddenField ID="hfDeptPersonId" runat="server" />
    </div>
    <hr />
    <input type="hidden" name="idOrdering" id="idOrdering" />
    <div class="grid">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" DataKeyNames="sequence" CssClass="grid_table"
            DataSourceID="odsDepartmentPerson" PageSize="50" OnDataBound="GridView1_DataBound">
            <Columns>
                <asp:TemplateField HeaderText="Edit" InsertVisible="False" SortExpression="dept_id">
                    <ItemTemplate>
                       <center>
                            <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Images/edit.png" AlternateText="Edit"
                                OnCommand="UpdateDepartmentPerson" CommandArgument='<%#Eval("sequence")%>' />
                        </center>
                    </ItemTemplate>
                    <HeaderStyle Width="45px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete" InsertVisible="False" SortExpression="dept_id">
                    <ItemTemplate>
                        <center>
                            <asp:ImageButton ID="ImageButton1" CssClass="noborder" runat="server" ImageUrl="~/Images/delete.png"
                                OnCommand="DeleteDepartmentPerson" CommandArgument='<%# Eval("sequence") %>'
                                OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                        </center>
                    </ItemTemplate>
                    <HeaderStyle Width="45px" />
                </asp:TemplateField>                
                <asp:BoundField DataField="name_desc" HeaderText="Person" SortExpression="name_desc" />
                <asp:TemplateField HeaderText="Supervisor" SortExpression="flg_supervisor">
                    <EditItemTemplate>
                        <center>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("flg_supervisor") %>' />
                        </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <center>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("flg_supervisor") %>'
                            Enabled="false" />
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Aider" SortExpression="flg_first_aider">
                    <EditItemTemplate>
                        <center>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("flg_first_aider") %>' />
                        </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <center>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("flg_first_aider") %>'
                            Enabled="false" />
                        </center>                            
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fire Warden" SortExpression="flg_fire_warden">
                    <EditItemTemplate>
                        <center>
                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("flg_fire_warden") %>' />
                        </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <center>
                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("flg_fire_warden") %>'
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
    </div>
    &nbsp;<div>
        <asp:ObjectDataSource ID="odsDepartment" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDepartmentsByCoId"
            TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_dept_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
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
                <asp:Parameter Name="Original_dept_id" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
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
        <asp:ObjectDataSource ID="odsDepartmentPerson" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDepartmentPersonByDeptId" TypeName="DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter"
            DeleteMethod="Delete" InsertMethod="Insert">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDepartment" Name="dept_id" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Original_sequence" Type="Int32" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="dept_id" Type="Int32" />
                <asp:Parameter Name="co_id" Type="Int32" />
                <asp:Parameter Name="name_desc" Type="String" />
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="flg_supervisor" Type="Boolean" />
                <asp:Parameter Name="flg_first_aider" Type="Boolean" />
                <asp:Parameter Name="flg_fire_warden" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
