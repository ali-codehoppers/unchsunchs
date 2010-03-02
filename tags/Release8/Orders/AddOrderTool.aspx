<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderTool.aspx.cs" Inherits="Orders_AddOrderTool" Title="Untitled Page" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Common/StyleSheets/Tab.css" />
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Includes/yui/build/button/assets/skins/sam/button.css" />
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Includes/yui/build/container/assets/skins/sam/container.css" />

    <script type="text/javascript" src="<%=Request.ApplicationPath%>/Includes/yui/build/container/container-min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    Add/Edit H&amp;S Folder
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        var toolDialog;
    </script>

    <uc2:TabControl ID="TabControl2" runat="server" Selected="Tools" />
    <div style="text-align: right">
        <div class="button_bar">
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" />
        </div>
    </div>
    <div id="toolDialog" style="display:none;">
        <div class="hd">
            Select Tools to Add:
        </div>
        <div class="bd" style="overflow: auto;height:400px;">
            <div class="field" >
                <asp:Repeater ID="rptTools" runat="server" OnItemDataBound="rptTools_ItemDataBound">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfCategoryName" runat="server" Value='<%# Container.DataItem %>'/>
                        <fieldset>
                            <legend><b><%# Container.DataItem %></b></legend>
                            <asp:CheckBoxList ID="cbTools" runat="server" RepeatColumns="3" Width="100%">
                            </asp:CheckBoxList>
                        </fieldset>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="ft">
            <div class="button_bar_dialog">
                <asp:Button ID="btnAddTools" runat="server" Text="Add Tool(s)" OnClick="btnAddTools_Click" />
            </div>
        </div>
    </div>
    <div class="field">
        <span class="heading">Tool Name:</span>
    </div>
    <div class="text_field">
        <asp:TextBox ID="tbTool" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbTool"
            ErrorMessage="*" ValidationGroup="Tool"></asp:RequiredFieldValidator>
    </div>
   <div class="button_bar">
           <asp:Button ID="btnAddTool" runat="server" Text="Add Tool" OnClick="btnAddTool_Click"
             ValidationGroup="Tool" />
        <input type="button" value="Tools List" onclick="document.getElementById('toolDialog').style.display='block';toolDialog.show();" />
    </div>

    <div class="grid">
        <asp:GridView Width="75%" ID="gvTool" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" DataKeyNames="sequence" DataSourceID="odsTool"
            OnRowDeleting="gvTool_RowDeleting" OnRowUpdating="gvTool_RowUpdating" PageSize="50" CssClass="grid_table">
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
                <asp:BoundField DataField="tool_desc" HeaderText="Tool" SortExpression="tool_desc" />
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
    <asp:ObjectDataSource ID="odsTool" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllDepartmentTool" TypeName="DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
            <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="" Name="order_seq" QueryStringField="deptOrderId"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="sequence" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="tool_desc" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="sequence" Type="Int32" />
            <asp:Parameter Name="original_sequence" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="dept_id" Type="Int32" />
            <asp:Parameter Name="co_id" Type="Int32" />
            <asp:Parameter Name="order_seq" Type="Int32" />
            <asp:Parameter Name="tool_desc" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    &nbsp;

    <script type="text/javascript">
        	// Instantiate the Dialog
		toolDialog = new YAHOO.widget.Dialog("toolDialog", 
							{ width : "980px",
							  fixedcenter : true,
							  close : true,
			                  zindex:3,
			                  modal:true,							  
							  visible : false, 
							  constraintoviewport : false
							});
		toolDialog.render();

    </script>

</asp:Content>