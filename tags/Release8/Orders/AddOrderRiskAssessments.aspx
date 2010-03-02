<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="AddOrderRiskAssessments.aspx.cs" Inherits="Orders_AddOrderRiskAssessments" Title="Untitled Page" %>
<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Common/StyleSheets/Tab.css" />
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Includes/yui/build/container/assets/skins/sam/container.css" />
    <script type="text/javascript" src="<%=Request.ApplicationPath%>/Includes/yui/build/container/container-min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
Add/Edit H&amp;S Folder
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <script type="text/javascript">
        var dialog;
    </script>

    <uc1:TabControl ID="TabControl1" runat="server" Selected="Risks" />
    <div style="text-align: right">
        <div class="button_bar">
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" />
        </div>
    </div>
    <div id="dialog" style="display:none">
        <div class="hd">
            Select Risk Assessments to Add:</div>
        <div class="bd" style="overflow: auto;height:400px">
            <div class="field">
                <asp:Repeater ID="rptDocs" runat="server" OnItemDataBound="rptDocs_ItemDataBound">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfCategoryName" runat="server" Value='<%# Container.DataItem %>'/>
                        <fieldset>
                            <legend><b><%# Container.DataItem %></b></legend>
                            <asp:CheckBoxList ID="cbDocs" runat="server" RepeatColumns="3" Width="100%">
                            </asp:CheckBoxList>
                        </fieldset>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="ft">
            <asp:Button ID="btnAdd" runat="server" Text="Add Risk Assessment(s)" OnClick="btnAdd_Click" />
        </div>
    </div>
    <div class="button_bar">
        <input type="button" value="Risk Assessments List" onclick="document.getElementById('dialog').style.display='block';dialog.show();" />
    </div>
    <div class="grid">
    
    </div>
    <asp:GridView ID="gvDocs" runat="server" AutoGenerateColumns="False" CssClass="grid_table"
    DataKeyNames="dept_order_doc_id" DataSourceID="odsDeptDocs" OnRowDeleted="gvDocs_RowDeleted" PageSize="50">
        <Columns>
            <asp:TemplateField ShowHeader="True" HeaderText="Delete" >
                <HeaderStyle Width="5%" />
                <ItemTemplate>               
                    <center>
                    <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                            ImageUrl="~/Images/delete.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');"></asp:ImageButton>
                    </center>
                </ItemTemplate>              
            </asp:TemplateField>
            <asp:BoundField DataField="doc_name" HeaderText="Name" SortExpression="doc_name">
                <ItemStyle Width="75%" />
            </asp:BoundField>
            <asp:BoundField DataField="doc_code" HeaderText="Code" SortExpression="doc_code">
                <ItemStyle Width="20%" />
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
    <asp:ObjectDataSource ID="odsDeptDocs" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDocs" TypeName="DepartmentOrderDocTableAdapters.DepartmentOrderDocTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_dept_order_doc_id" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="order_id" QueryStringField="deptOrderId"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="order_id" Type="Int32" />
            <asp:Parameter Name="doc_id" Type="Int32" />
            <asp:Parameter Name="dept_id" Type="Int32" />
            <asp:Parameter Name="co_id" Type="Int32" />
            <asp:Parameter Name="flg_delete" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <script type="text/javascript">
        	// Instantiate the Dialog
		dialog = new YAHOO.widget.Dialog("dialog", 
							{ width : "980px",							
							  fixedcenter : true,
							  close : true,
			                  zindex:3,
			                  modal:true,							  
							  visible : false, 
							  constraintoviewport : false,
							  draggable:true
							});
		dialog.render();

    </script>



</asp:Content>

