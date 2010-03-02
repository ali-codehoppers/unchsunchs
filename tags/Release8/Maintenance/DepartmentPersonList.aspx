<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="DepartmentPersonList.aspx.cs" Inherits="Maintenance_DepartmentPersonList"
    Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Includes/yui/build/fonts/fonts-min.css" />

    <script type="text/javascript" src="<%=Request.ApplicationPath%>/Includes/yui/build/animation/animation-min.js"></script>

    <script type="text/javascript" src="<%=Request.ApplicationPath%>/Includes/yui/build/dragdrop/dragdrop-min.js"></script>

    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Common/DDStyle.css" />

    <script type="text/javascript" src="<%=Request.ApplicationPath%>/Includes/unchs/DragDrop.js"></script>

    <style type="text/css">
        .text_field span{width:150px;height:100%;display:inline-block;}    
        .field span{width:150px;display:inline-block;}    
        .ddl_field span{width:150px;display:inline-block;}    
    </style>

</asp:Content>
<asp:Content ContentPlaceHolderID="HeadingPlaceHolder" ID="ContenPlaceHolder2" runat="server">
    Default Department Person List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="ddl_field">
        <span>Department:</span><asp:DropDownList ID="ddlDepartment" runat="server" 
            DataSourceID="odsDepartment" DataTextField="co_name_short" DataValueField="dept_id"
            AutoPostBack="true" OnDataBound="ddlDepartment_DataBound" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
        </asp:DropDownList></div>
    <div class="text_field">        
        <span>Person:</span><asp:TextBox ID="tbName" runat="server" ></asp:TextBox><asp:RequiredFieldValidator
            ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" CssClass="error"
            ControlToValidate="tbName" ValidationGroup="Top"></asp:RequiredFieldValidator></div>

    <asp:Repeater ID="rptPeopleType" runat="server" DataSourceID="odsPeopleType" OnItemDataBound="rptPeopleType_ItemDataBound">
        <ItemTemplate>
            <div class="field">
                <asp:HiddenField ID="hfPeopleTypeId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "people_type_id")%>'/>
                <span><%#DataBinder.Eval(Container.DataItem, "people_type")%>:</span>
                <asp:CheckBox ID="cbPeopleType" runat="server" />
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <div class="button_bar">
        <asp:Button ID="btnAdd" runat="server" Text="Add Person" OnClick="btnAdd_Click" ValidationGroup="Top" />
        <asp:Button ID="btnUpate" runat="server" OnClick="btnUpate_Click" Text="Update Person"
            Visible="False" ValidationGroup="Top" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
        <asp:HiddenField ID="hfPersonName" runat="server" />
    </div>
    <div class="grid">
        <asp:GridView ID="gvPeople" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="sdsDepartmentPerson" PageSize="50" CssClass="grid_table" OnRowCommand="gvPeople_RowCommand"  >
            <Columns> 
                <asp:TemplateField HeaderText="Edit" >                   
                    <ItemTemplate>
                        <center>
                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="True" CommandName="EditPerson" CommandArgument='<%# Eval("Person Name") %>'
                                ImageUrl="~/Images/edit.png" AlternateText="Edit" ></asp:ImageButton>
                        </center>
                    </ItemTemplate>                    
                    <HeaderStyle Width="45px" />
                </asp:TemplateField>    
                                                           
                <asp:TemplateField HeaderText="Delete" >                   
                    <ItemTemplate>
                        <center>
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="DeletePerson" CommandArgument='<%# Eval("Person Name") %>'
                                ImageUrl="~/Images/delete.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');"></asp:ImageButton>
                        </center>
                    </ItemTemplate>           
                    <HeaderStyle Width="45px" />         
                </asp:TemplateField>    
            </Columns>
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" HorizontalAlign="Center"/>
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" HorizontalAlign="Center"/>
            <RowStyle CssClass="grid_row" HorizontalAlign="Center"/>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsDepartmentPerson" runat="server" ConnectionString="<%$ ConnectionStrings:UNCHSConnectionString %>"
            SelectCommand="DeptPeopleSelectCommand" SelectCommandType="StoredProcedure" DeleteCommand="DeptPeopleDeleteByName" DeleteCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:Parameter Name="people_name" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        <asp:ObjectDataSource ID="odsDepartment" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDepartmentsByCoId"
            TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsPeopleType" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetPeopleTypeByCoId" TypeName="PeopleTypeTableAdapters.PeopleTypeTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
