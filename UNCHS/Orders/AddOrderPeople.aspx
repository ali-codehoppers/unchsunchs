<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderPeople.aspx.cs" Inherits="Orders_AddOrderPeople" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    <div style="float: left;">
        <img src="<%=this.ResolveClientUrl("~/images/big_pnl_left.jpg")%>" alt="" height="20" />
    </div>
    <div style="float: left; width: 96.05%;">
        <img src="<%=this.ResolveClientUrl("~/Images/big_pnl_mid.jpg")%>" alt="" style="width: 100%"
            height="20" />
    </div>
    <div>
        <img src="<%=this.ResolveClientUrl("~/images/big_pnl_right.jpg")%>" alt="" height="20" />
    </div>
    <div style="background-color: White; border-top: 1px solid white">
        <div style="margin: auto; width: 98%">
            <div style="float: left">
                <img src="<%=this.ResolveClientUrl("~/images/bc_left.jpg")%>" alt="" width="8" height="31" /></div>
            <div class="breadcrum_mid" style="height: 23px; padding-top: 8px; float: left; width: 96%">
                Add/Amend H&amp;S Folder - People
            </div>
            <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc1:TabControl ID="TabControl1" runat="server" Selected="People" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height:240px;">
        <div class="grid">
            <asp:GridView ID="gvPeople" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CssClass="grid_table" DataKeyNames="sequence" DataSourceID="odsDepartmentPeople"
                PageSize="50" OnDataBound="gvPeople_DataBound">
                <Columns>
                    <asp:BoundField DataField="name_desc" HeaderText="Person" SortExpression="name_desc" />
                    <asp:TemplateField HeaderText="Supervisor?">
                        <ItemTemplate>
                            <center>
                                <asp:CheckBox Visible='<%#Eval("flg_supervisor")%>' Enabled='<%#Eval("flg_supervisor")%>'
                                    runat="server" ID="chkboxSupervisor" Checked='<%#GetChecked(Convert.ToString(Eval("superrvisor_check")))%>' />
                            </center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Aider?">
                        <ItemTemplate>
                            <center>
                                <asp:CheckBox Visible='<%#Eval("flg_first_aider")%>' Enabled='<%#Eval("flg_first_aider")%>'
                                    runat="server" ID="chkboxFirstAider" Checked='<%#GetChecked(Convert.ToString(Eval("firstaiderr_check")))%>' />
                            </center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fire Warden?">
                        <ItemTemplate>
                            <center>
                                <asp:CheckBox Visible='<%#Eval("flg_fire_warden")%>' Enabled='<%#Eval("flg_fire_warden")%>'
                                    runat="server" ID="chkboxFireWarden" Checked='<%#GetChecked(Convert.ToString(Eval("firewardenn_check")))%>' />
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
        <div class="button_bar">
            <div class="button_right" style="padding-left: 340px;">
                <div style="float: left">
                    <asp:Image runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:LinkButton ID="btnSaveAll" runat="server" OnClick="btnSaveAll_Click" CssClass="txt_white">Save All</asp:LinkButton>
                </div>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
        </div>
        <asp:HiddenField ID="hfDeptId" runat="server" />
        <asp:ObjectDataSource ID="odsDepartmentPeople" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllOrderPersonsByOrderId" TypeName="DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfDeptId" Name="dept_id" PropertyName="Value" Type="Int32"
                    DefaultValue="0" />
                <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" DefaultValue="0" />
                <asp:QueryStringParameter DefaultValue="0" Name="order_seq" QueryStringField="deptOrderId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="button_right" style="float: left; padding-left: 340px; padding-top: 20px">
            <asp:ImageButton ID="btnBack" runat="server" OnClick="btnBack_Click" ImageUrl="~/Images/btn_pre.jpg" />
        </div>
        <div class="button_right" style="padding-top: 20px">
            <asp:ImageButton ID="btnNext" runat="server" OnClick="btnNext_Click" ImageUrl="~/Images/btn_next.jpg" />
        </div>
    </div>
    <div style="float: left; width: 100%">
        <div style="float: left">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt=""
                Width="15" Height="14" /></div>
        <div style="background-color: White; float: left; height: 14px; width: 96.2%;">
        </div>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt=""
            Width="15" Height="14" />
    </div>
</asp:Content>
