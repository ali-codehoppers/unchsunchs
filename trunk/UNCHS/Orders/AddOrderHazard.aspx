<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderHazard.aspx.cs" Inherits="Orders_AddOrderHazard" Title="Untitled Page" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />

    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    <div style="text-align: right">
        <div class="button_bar">
            <div class="button_left">
                Add/Edit H&amp;S Folder
            </div>
        </div>

        <div class="button_right">
            <asp:ImageButton ID="btnNext" runat="server" OnClick="btnNext_Click" ImageUrl="~/Images/Next.gif"
                onmouseover="this.src='../Images/Next_rollover_selected.gif';"
                onmouseout="this.src='../Images/Next.gif';"/>
        </div>
        <div class="button_right">
            <asp:ImageButton ID="btnBack" runat="server" OnClick="btnBack_Click" ImageUrl="~/Images/Back.gif"
                onmouseover="this.src='../Images/Back_rollover_selected.gif';"
                onmouseout="this.src='../Images/Back.gif';"/>
        </div>
    </div>
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc1:TabControl ID="TabControl1" runat="server" Selected="Key Hazards" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        var hazardDialog;
    </script>

    
    <div class="warning_text">Data may go to continuation sheet if it exceeds the number of records.</div>    
    <div id="hazardDialog" style="display:none">
        <div class="hd">
            Select Hazards to Add:</div>
        <div class="bd" style="overflow: auto;height:400px;">
            <div class="field">
                <asp:Repeater ID="rptHazards" runat="server" OnItemDataBound="rptHazards_ItemDataBound">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfCategoryName" runat="server" Value='<%# Container.DataItem %>'/>
                        <fieldset>
                            <legend><b><%# Container.DataItem %></b></legend>
                            <asp:CheckBoxList ID="cbHazards" runat="server" RepeatColumns="3" Width="100%">
                            </asp:CheckBoxList>
                        </fieldset>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="ft">
            <asp:ImageButton ID="btnAddHazards" runat="server" OnClick="btnAddHazards_Click" ImageUrl="~/Images/Add_Hazard.gif"
                onmouseover="this.src='../Images/Add_Hazard_roll_selec.gif';"
                onmouseout="this.src='../Images/Add_Hazard.gif';"/>
        </div>
    </div>
    <div class="field">
        <span class="heading">Key Hazard:</span>
    </div>
    <div class="text_field">        
        <asp:TextBox ID="tbHazard" runat="server" Rows="3" TextMode="MultiLine" width="610px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Hazard"
            ErrorMessage="*" ControlToValidate="tbHazard"></asp:RequiredFieldValidator>
    </div>
    <div>
        <div class="button_right">
            <asp:ImageButton ID="btnAddHazard" runat="server" OnClick="btnAddHazard_Click" ValidationGroup="Hazard" ImageUrl="~/Images/Add_Hazard.gif" onmouseover="this.src='../Images/Add_Hazard_roll_selec.gif';" onmouseout="this.src='../Images/Add_Hazard.gif';"/>
            </div>
        <div class="button_right">
		<input type="image" src="../Images/Key_Hazards_list.gif" onclick="document.getElementById('hazardDialog').style.display='block';hazardDialog.show();return false;" ImageUrl="~/Images/Add_Hazard.gif" onmouseover="this.src='../Images/Key_Hazards_list_roll_sel.gif';" onmouseout="this.src='../Images/Key_Hazards_list.gif';" />
		</div>
    </div>
    <!--<div class="grid_area">-->
    <div class="grid">
        <asp:GridView ID="gvHazard" runat="server" DataSourceID="odsOrderHazard" 
            OnRowDeleting="gvHazard_RowDeleting" OnRowUpdating="gvHazard_RowUpdating" DataKeyNames="sequence" AutoGenerateColumns="False" AllowSorting="True"
            AllowPaging="True" PageSize="50" CssClass="grid_table">
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
                <asp:BoundField DataField="hazard_desc" HeaderText="Hazard" SortExpression="hazard_desc">
                </asp:BoundField>
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
    <!--</div>-->
    <div class="float-none"></div>
    <asp:ObjectDataSource ID="odsOrderHazard" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllHazards" TypeName="DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
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
            <asp:Parameter Name="hazard_desc" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="sequence" Type="Int32" />
            <asp:Parameter Name="original_sequence" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="dept_id" Type="Int32" />
            <asp:Parameter Name="co_id" Type="Int32" />
            <asp:Parameter Name="order_seq" Type="Int32" />
            <asp:Parameter Name="hazard_desc" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />

    <script type="text/javascript">
        	// Instantiate the Dialog
		hazardDialog = new YAHOO.widget.Dialog("hazardDialog", 
							{ width : "980px",							  
							  fixedcenter : true,
							  close : true,
			                  zindex:3,
			                  modal:true,							  
							  visible : false, 
							  constraintoviewport : false,
							  draggable:true
							});
		hazardDialog.render();

    </script>

</asp:Content>
