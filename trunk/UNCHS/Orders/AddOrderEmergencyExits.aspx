<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="AddOrderEmergencyExits.aspx.cs" Inherits="Orders_AddOrderEmergencyExits" Title="Untitled Page" %>
<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Common/StyleSheets/Tab.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
   Add/Edit H&amp;S Folder
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc2:TabControl ID="TabControl2" runat="server" Selected="Emergency" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
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
    <div class="warning_text">Data may go to continuation sheet if it exceeds the number of recods.</div>
<div class="field">
    <span class="heading">Emergency Procedures:</span>
</div>
<div class="text_field">    
    <asp:TextBox ID="tbExitHeader" runat="server" Rows="3" TextMode="MultiLine" Width="610px"></asp:TextBox>    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="tbExitHeader"
        ErrorMessage="*" ValidationGroup="Exit"></asp:RequiredFieldValidator>
</div>
<div class="button_bar">
    <asp:ImageButton ID="btnAddExit" runat="server" OnClick="btnAddExit_Click" ValidationGroup="Exit" ImageUrl="~/Images/Add_Emergency_Procedure.gif" onmouseover="this.src='../Images/Add_Emergency_Procedure_roll_sel.gif';" onmouseout="this.src='../Images/Add_Emergency_Procedure.gif';"/>

</div>
<div class="grid">
    <asp:GridView ID="gvExit" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="sequence" DataSourceID="odsExit" OnRowDeleting="gvExit_RowDeleting" OnRowUpdating="gvExit_RowUpdating" PageSize="50" CssClass="grid_table"  >
        <Columns>
                <asp:TemplateField HeaderText="Edit">
                    <EditItemTemplate>
                        <center>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update"
                            ImageUrl="~/Images/edit.png" AlternateText="Update"></asp:ImageButton>
                        </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <center>
                        <asp:ImageButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                            ImageUrl="~/Images/edit.png" AlternateText="Edit"></asp:ImageButton>
                    </center>
                    </ItemTemplate>
                    <HeaderStyle Width="45px"/>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <EditItemTemplate>
                    <center>
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            ImageUrl="~/Images/delete.png" AlternateText="Cancel"></asp:ImageButton>
                    </center>
                    </EditItemTemplate>
                    <ItemTemplate>
                    <center>
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                            ImageUrl="~/Images/delete.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                        </asp:ImageButton>
                    </center>
                    </ItemTemplate>
                    <HeaderStyle Width="45px"/>
                </asp:TemplateField>                                        
            <asp:BoundField DataField="emer_exit_title" HeaderText="Title" SortExpression="emer_exit_title" />
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
<asp:ObjectDataSource ID="odsExit" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllEmergencyExits" TypeName="DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="sequence" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="order_seq" QueryStringField="deptOrderId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

