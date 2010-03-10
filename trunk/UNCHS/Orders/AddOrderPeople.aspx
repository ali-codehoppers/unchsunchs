<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderPeople.aspx.cs" Inherits="Orders_AddOrderPeople" Title="Untitled Page" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    Add/Edit H&amp;S Folder
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc1:TabControl ID="TabControl1" runat="server" Selected="People" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">

    
    <div style="text-align: right">
        <div class="button_bar">
            <asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/Images/Back.gif" OnClick="btnBack_Click" 
                onmouseover="this.src='../Images/Back_rollover_selected.gif';"
                onmouseout="this.src='../Images/Back.gif';"/>
            <asp:ImageButton ID="btnNext" runat="server" OnClick="btnNext_Click" ImageUrl="~/Images/Next.gif"
                onmouseover="this.src='../Images/Next_rollover_selected.gif';"
                onmouseout="this.src='../Images/Next.gif';"/>
        </div>
    </div>
    <div class="button_bar">
            <asp:ImageButton ID="btnSaveAll" runat="server" OnClick="btnSaveAll_Click" ImageUrl="~/Images/Save_All.gif"
                onmouseover="this.src='../Images/Save_All_roll_sel.gif';"
                onmouseout="this.src='../Images/Save_All.gif';"/>
    </div>
    <div class="grid">
        <asp:GridView ID="gvPeople" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CssClass="grid_table"
            DataKeyNames="sequence" DataSourceID="odsDepartmentPeople"
            PageSize="50" OnDataBound="gvPeople_DataBound" >
            <Columns>
                <asp:BoundField DataField="name_desc" HeaderText="Person" SortExpression="name_desc" />
                <asp:TemplateField HeaderText="Supervisor?">
                    <ItemTemplate>
                    <center>
                        <asp:CheckBox Visible='<%#Eval("flg_supervisor")%>' Enabled='<%#Eval("flg_supervisor")%>'  runat="server" ID="chkboxSupervisor" Checked='<%#GetChecked(Convert.ToString(Eval("superrvisor_check")))%>' /> 
                    </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Aider?">
                    <ItemTemplate>
                    <center>
                        <asp:CheckBox Visible='<%#Eval("flg_first_aider")%>' Enabled='<%#Eval("flg_first_aider")%>'  runat="server" ID="chkboxFirstAider" Checked='<%#GetChecked(Convert.ToString(Eval("firstaiderr_check")))%>' /> 
                    </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fire Warden?">
                    <ItemTemplate>
                    <center>
                        <asp:CheckBox Visible='<%#Eval("flg_fire_warden")%>' Enabled='<%#Eval("flg_fire_warden")%>' runat="server" ID="chkboxFireWarden" Checked='<%#GetChecked(Convert.ToString(Eval("firewardenn_check")))%>' /> 
                    </center>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <HeaderStyle CssClass="grid_header" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
        </asp:GridView>
        &nbsp;
    </div>
    <asp:HiddenField ID="hfDeptId" runat="server" />


    <asp:ObjectDataSource ID="odsDepartmentPeople" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllOrderPersonsByOrderId" TypeName="DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfDeptId" Name="dept_id" PropertyName="Value" Type="Int32" DefaultValue="0" />
            <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" DefaultValue="0" />
            <asp:QueryStringParameter DefaultValue="0" Name="order_seq" QueryStringField="deptOrderId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
