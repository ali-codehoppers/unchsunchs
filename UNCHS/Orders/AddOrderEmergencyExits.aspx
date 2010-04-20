<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="AddOrderEmergencyExits.aspx.cs" Inherits="Orders_AddOrderEmergencyExits" Title="Untitled Page" %>
<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc2" %>
<%@ Register src="../Common/UserControls/SuggestionsSelectControl.ascx" tagname="SuggestionsSelectControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
        <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css" )%>"/>

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
    <div style="text-align: right">
        <div class="button_bar">
            <div class="button_left">
                Add/Edit H&amp;S Folder
            </div>
        </div>
        <div class="button_right">
            <asp:ImageButton ID="ImageButton2" runat="server" OnClick="btnNext_Click" ImageUrl="~/Images/Next.gif"
                onmouseover="this.src='../Images/Next_rollover_selected.gif';" onmouseout="this.src='../Images/Next.gif';" />
        </div>
        <div class="button_right">
            <asp:ImageButton ID="ImageButton3" runat="server" OnClick="btnBack_Click" ImageUrl="~/Images/Back.gif"
                onmouseover="this.src='../Images/Back_rollover_selected.gif';" onmouseout="this.src='../Images/Back.gif';" />
        </div>
    </div>
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc2:TabControl ID="TabControl2" runat="server" Selected="Emergency" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">    
    <uc1:SuggestionsSelectControl ID="suggestionsSelectControl" runat="server" EntityName="Emergency Exits" SuggestionType="E" ImageName="Add_Emergency_Procedure"/>    
    <div class="warning_text" style="display:none">Data may go to continuation sheet if it exceeds the number of recods.</div>
<div class="field">
    <span class="heading">Emergency Procedures:</span>
</div>
<div class="text_field">    
    <asp:TextBox ID="tbExitHeader" runat="server" Rows="3" TextMode="MultiLine" Width="610px"></asp:TextBox>    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="tbExitHeader"
        ErrorMessage="*" ValidationGroup="Exit"></asp:RequiredFieldValidator>
</div>
<div style="text-align:right;margin-top:10px">
    <asp:ImageButton ID="btnAddExit" runat="server" OnClick="btnAddExit_Click" ValidationGroup="Exit" ImageUrl="~/Images/Add_Emergency_Procedure.gif" onmouseover="this.src='../Images/Add_Emergency_Procedure_roll_sel.gif';" onmouseout="this.src='../Images/Add_Emergency_Procedure.gif';"/>
    <input type="image" value="Emergency Procedures List"  src="../Images/Emergency_pro_list.gif" onclick="document.getElementById('suggestionDialog').style.display='block';suggestionDialog.show();return false;" onmouseover="this.src='../Images/Emergency_pro_list_rollover.gif';" onmouseout="this.src='../Images/Emergency_pro_list.gif';" style="margin-right:10px;margin-left:5px"/>
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

