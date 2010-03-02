<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="DepartmentHazardList.aspx.cs" Inherits="Maintenance_DepartmentHazardList"
    Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Includes/yui/build/fonts/fonts-min.css" />

    <script type="text/javascript" src="<%=Request.ApplicationPath%>/Includes/yui/build/animation/animation-min.js"></script>

    <script type="text/javascript" src="<%=Request.ApplicationPath%>/Includes/yui/build/dragdrop/dragdrop-min.js"></script>

    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Common/StyleSheets/DDStyle.css">

    <script type="text/javascript" src="<%=Request.ApplicationPath%>/Includes/unchs/DragDrop.js"></script>

</asp:Content>
<asp:Content ContentPlaceHolderID="HeadingPlaceHolder" ID="ContenPlaceHolder2" runat="server">
    Default Department Key Hazard List</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="ddl_field">
        <span style="width:100px;">Department:</span><asp:DropDownList ID="ddlDepartment" runat="server"
            DataSourceID="odsDepartment" DataTextField="co_name_short" DataValueField="dept_id" 
            AutoPostBack="true">
        </asp:DropDownList>
    </div>
    <div class="ddl_field">
        <span style="width:100px;">Category:</span><asp:DropDownList ID="ddlCategory" runat="server"
            DataSourceID="odsCategories" DataTextField="category_name" DataValueField="category_id" >
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                runat="server" ErrorMessage="*" CssClass="error" ControlToValidate="ddlCategory" ValidationGroup="Top"></asp:RequiredFieldValidator>
    </div>    
    <div class="text_field">
        <table cellpadding="0" cellspacing="0" border="0"><tr>
        <td valign="middle">
        <span style="width:100px;">Hazard:</span></td><td><asp:TextBox ID="tbName" runat="server" Rows="3"
            TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                runat="server" ErrorMessage="*" CssClass="error" ControlToValidate="tbName" ValidationGroup="Top"></asp:RequiredFieldValidator>
        </td>
        </tr>
        </table>
    </div>
        <div class="button_bar">
            <asp:Button ID="btnAdd" runat="server" Text="Add Hazard" OnClick="btnAdd_Click" ValidationGroup="Top" />
            <asp:Button ID="btnUpate" runat="server" OnClick="btnUpate_Click" Text="Update Hazard"
                Visible="False" ValidationGroup="Top" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            <asp:HiddenField ID="hfDeptPersonId" runat="server" />
        </div>
        <hr />
        <input type="hidden" name="idOrdering" id="idOrdering" />
        <div class="button_bar">
            <asp:Button ID="btnSave" runat="server" Text="Save Ordering" OnClick="btnSave_Click"
                OnClientClick="return saveReorderedList();" />
        </div>
        <div class="workArea">
            <ul id="dragDropUL" class="draglist">
                <asp:Repeater ID="repeater" runat="server" DataSourceID="odsDepartmentHazard" OnItemCommand="repeater_ItemCommand">
                    <ItemTemplate>
                        <li class="ddLi" id="li_<%#DataBinder.Eval(Container.DataItem, "sequence")%>">
                            <!--<div class="liData">-->
                            <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Images/edit.png" AlternateText="Edit"
                                CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "sequence")%>' />
                            <!--</div>-->
                            <!--<div class="liData">-->
                            <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/delete.png" AlternateText="Delete"
                                CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "sequence")%>'
                                OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                            <!--</div>-->
                            <!--<div class="liData">-->
                            <span style="display:inline-block;width:200px"><%#DataBinder.Eval(Container.DataItem, "category_name")%></span>
                            <%#DataBinder.Eval(Container.DataItem, "name_desc")%>
                            <!--</div>-->
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <asp:ObjectDataSource ID="odsDepartment" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsDepartmentHazard" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDepartmentHazardByDeptId" TypeName="DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDepartment" Name="dept_id" PropertyName="SelectedValue"
                    Type="Int32" DefaultValue="0" />
                <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" DefaultValue="0" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Original_sequence" Type="Int32" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="dept_id" Type="Int32" />
                <asp:Parameter Name="name_desc" Type="String" />
                <asp:Parameter Name="index_seq" Type="Int32" />
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="Original_sequence" Type="Int32" />
                <asp:Parameter Name="category_id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="dept_id" Type="Int32" />
                <asp:Parameter Name="co_id" Type="Int32" />
                <asp:Parameter Name="name_desc" Type="String" />
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="category_id" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCategories" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetCategoriesByType" TypeName="CategoriesTableAdapters.CategoryTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            <asp:Parameter DefaultValue="H" Name="category_type" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
