<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderPPE.aspx.cs" Inherits="Orders_AddOrderPPE" Title="Untitled Page" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css" )%>"/>
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css" )%>"/>
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    Add/Edit H&amp;S Folder
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc2:TabControl ID="TabControl2" runat="server" Selected="PPE" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        var ppeDialog;
    </script>

    
    <div style="text-align: right">
        <div class="button_bar">
        <div class="button_left">
            <asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/Images/Back.gif" OnClick="btnBack_Click" 
                onmouseover="this.src='../Images/Back_rollover_selected.gif';"
                onmouseout="this.src='../Images/Back.gif';"/>
        </div>
        <div class="button_right">
            <asp:ImageButton ID="btnNext" runat="server" OnClick="btnNext_Click" ImageUrl="~/Images/Next.gif"
                onmouseover="this.src='../Images/Next_rollover_selected.gif';"
                onmouseout="this.src='../Images/Next.gif';"/>
        </div>
        </div>
    </div>
    <div class="button_bar">&nbsp;</div>
    <div class="warning_text">Data may go to continuation sheet if it exceeds the number of records.</div>
    <div id="ppeDialog" style="display:none;">
        <div class="hd">
            Select PPEs to Add:</div>
        <div class="bd" style="overflow: auto;height:400px;">
            <div class="field">
                <asp:Repeater ID="rptPPE" runat="server" OnItemDataBound="rptPPE_ItemDataBound">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfCategoryName" runat="server" Value='<%# Container.DataItem %>'/>
                        <fieldset>
                            <legend><b><%# Container.DataItem %></b></legend>
                            <asp:CheckBoxList ID="cbPPE" runat="server" RepeatColumns="3" Width="100%">
                            </asp:CheckBoxList>
                        </fieldset>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="ft">
            <div class="button_bar_dialog">
                <asp:Button ID="btnAddPPEs" runat="server" Text="Add PPE(s)" OnClick="btnAddPPEs_Click" />
            </div>
        </div>
    </div>
    <div class="field">
        <span class="heading">PPE:</span>
    </div>
    <div class="text_field">
        <asp:TextBox ID="tbPPE" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbPPE"
            ErrorMessage="*" ValidationGroup="PPE"></asp:RequiredFieldValidator>
    </div>
   <div class="button_bar">
   
	<asp:ImageButton ID="btnAddPPE" runat="server" OnClick="btnAddPPE_Click" ValidationGroup="PPE" ImageUrl="~/Images/Add_PPE.gif" onmouseover="this.src='../Images/Add_PPE_roll_selec.gif';" onmouseout="this.src='../Images/Add_PPE.gif';"/>
	<input type="image" src="../Images/PPE_List.gif" onclick="document.getElementById('ppeDialog').style.display='block';ppeDialog.show();return false;" ImageUrl="~/Images/Plants_Tools_List.gif" onmouseover="this.src='../Images/PPE_List_roll_selec.gif';" onmouseout="this.src='../Images/PPE_List.gif';" />


    </div>    
    <div class="grid">
        <asp:GridView ID="gvPPE" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CssClass="grid_table"
            DataKeyNames="sequence" DataSourceID="odsPPE"
             OnRowDeleting="gvPPE_RowDeleting" OnRowUpdating="gvPPE_RowUpdating" PageSize="50">
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
                <asp:BoundField DataField="ppe_desc" HeaderText="PPE" SortExpression="ppe_desc" />
            </Columns>
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
        </asp:GridView>
        &nbsp;
    </div>
    <asp:ObjectDataSource ID="odsPPE" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllPPE" TypeName="DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="order_seq" QueryStringField="deptOrderId"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="sequence" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ppe_desc" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="sequence" Type="Int32" />
            <asp:Parameter Name="original_sequence" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="dept_id" Type="Int32" />
            <asp:Parameter Name="co_id" Type="Int32" />
            <asp:Parameter Name="order_seq" Type="Int32" />
            <asp:Parameter Name="ppe_desc" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <script type="text/javascript">
        	// Instantiate the Dialog
		ppeDialog = new YAHOO.widget.Dialog("ppeDialog", 
							{ width : "980px",
							  fixedcenter : true,
							  close : true,
			                  zindex:3,
			                  modal:true,							  
							  visible : false, 
							  constraintoviewport : false,
							  draggable:true
							});
		ppeDialog.render();

    </script>

</asp:Content>
