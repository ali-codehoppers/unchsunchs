<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderRequirements.aspx.cs" Inherits="Orders_AddOrderRequirements"
    Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc2" %>
<%@ Register src="../Common/UserControls/SuggestionsSelectControl.ascx" tagname="SuggestionsSelectControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css" )%>"/>
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
        <div style="text-align: right">
        <div class="button_bar">
            <div class="button_left">
                Add/Amend H&amp;S Folder - Requirements
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
<uc2:TabControl ID="TabControl2" runat="server" Selected="Requirements" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">    
    <uc1:SuggestionsSelectControl ID="suggestionsSelectControl" runat="server" EntityName="Sequence of Work" SuggestionType="R" ImageName="Add_requirement"/>        
    <div class="warning_text">Data may go to continuation sheet if it exceeds the number of recods.</div>    
    <div class="field">
        <span class="heading">Client/Site Specific Requirements:</span>
    </div>
    <div class="text_field">
        <asp:TextBox ID="tbRequirementTitle" runat="server" Rows="3" TextMode="MultiLine" width="98%"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="tbRequirementTitle"
            ErrorMessage="*" ValidationGroup="Requirement"></asp:RequiredFieldValidator>
    </div>
    <div style="text-align: right; margin-top: 10px">
	    <asp:ImageButton ID="btnAddRequirement" runat="server" OnClick="btnAddRequirement_Click" ValidationGroup="Requirement" ImageUrl="~/Images/Add_requirement.gif" onmouseover="this.src='../Images/Add_Requirement_roll_Sel.gif';" onmouseout="this.src='../Images/Add_requirement.gif';"/>
        <input type="image" value="Requirements List" src="../Images/Requirements_list.gif" onclick="document.getElementById('suggestionDialog').style.display='block';suggestionDialog.show();return false;"onmouseover="this.src='../Images/Requirements_list_rollover.gif';" onmouseout="this.src='../Images/Requirements_list.gif';"  style="margin-right: 10px; margin-left: 5px"/>
    </div>
    <div class="grid">
        <asp:GridView ID="gvRequirement" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CssClass="grid_table"
            DataKeyNames="sequence" DataSourceID="odsClient"
            OnRowDeleting="gvRequirement_RowDeleting"
            OnRowUpdating="gvRequirement_RowUpdating" PageSize="50" Width="805px">
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
                <asp:BoundField DataField="requirement_header" HeaderText="Requirement" SortExpression="requirement_header" />
            </Columns>
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <HeaderStyle CssClass="grid_header" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
        </asp:GridView>
    </div>
    <asp:HiddenField ID="hfDeptId" runat="server" />
    <asp:ObjectDataSource ID="odsClient" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllRequirements" TypeName="DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter"
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="sequence" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="requirement_header" Type="String" />
            <asp:Parameter Name="requirement_desc" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="sequence" Type="Int32" />
            <asp:Parameter Name="original_sequence" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfDeptId" DefaultValue="0" Name="dept_id" PropertyName="Value"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="order_seq" QueryStringField="deptOrderId"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="dept_id" Type="Int32" />
            <asp:Parameter Name="co_id" Type="Int32" />
            <asp:Parameter Name="order_seq" Type="Int32" />
            <asp:Parameter Name="requirement_header" Type="String" />
            <asp:Parameter Name="requirement_desc" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>