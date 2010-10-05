<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="SearchOrder.aspx.cs" Inherits="Orders_SearchOrder" Title="Simplicity4Business"
    EnableEventValidation="true" %>

<%@ Register Assembly="jQueryDatePicker" Namespace="Westwind.Web.Controls" TagPrefix="ww" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">

    <style type="text/css">
        .text_field span{width:125px;height:100%;display:inline-block;}    
                
        .ddl_margin
        {
            margin-right:5px;
            width: 105px;
        }
    </style>    
    <script type="text/javascript">
        var copyDialog;
        function showCopyDialog(sourceOrderId) {
            document.getElementById('<%=hfSourceOrderId.ClientID%>').value = sourceOrderId;
            document.getElementById('copyDialog').style.display = 'block'; 
            copyDialog.show();
        }
        function renderDialog() {
            copyDialog = new YAHOO.widget.Dialog("copyDialog",
							    { width: "650px",
							        fixedcenter: true,
							        close: true,
							        zindex: 3,
							        modal: true,
							        visible: false,
							        constraintoviewport: false,
							        draggable: true
							    });
            copyDialog.render();

        }
        YAHOO.util.Event.onDOMReady(renderDialog);
    </script>
    <script type="text/javascript" src="../Includes/jquery-1.4.2.min.js"></script>
    <script type="text/javascript">
        function showCompleteAddress(id){
            $('div#addressDetail'+id).show();
        }
        function hideCompleteAddress(id){
            $('div#addressDetail'+id).hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    Search H&amp;S Folder
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div id="copyDialog" style="display:none">
        <div class="hd">
            Enter the Address for new folder:</div>
        <div class="bd">
            <div class="text_field">
                <asp:HiddenField ID="hfSourceOrderId" runat="server" />
                <span>House/Flat No:</span><asp:TextBox ID="tbAddressNo" runat="server"></asp:TextBox>
            </div>
            <div class="text_field">
                <span >Address:</span><asp:TextBox ID="tbAddress1" runat="server"></asp:TextBox>
            </div>
            <div class="text_field">
                <span ></span><asp:TextBox ID="tbAddress2" runat="server"></asp:TextBox>
            </div>
            <div class="text_field">
                <span ></span><asp:TextBox ID="tbAddress3" runat="server"></asp:TextBox>
            </div>
            <div class="text_field">
                <span ></span><asp:TextBox ID="tbAddress4" runat="server"></asp:TextBox></div>
            <div class="text_field">
                <span ></span><asp:TextBox ID="tbAddress5" runat="server"></asp:TextBox>
            </div>        
            <div class="text_field">
                <span>Postal Code:</span><asp:TextBox ID="tbPostalCode" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="ft" style="text-align:center">
            <asp:Button ID="btnCopy" runat="server" Text="Copy" OnClick="btnCopy_Click" Width="200px"/>            
        </div>
    </div>


    <div class="info_message">You can use % as a wildcard next to other characters to improve your search results. For example, %ad% or ad% returns all records with a word in one of the searched fields that begins with "ad".</div>
    <div class="field">
        <div style="float:left">
        <asp:Label ID="lblDepartment" CssClass="label" runat="server" Text="Department:" style="width:110px;"></asp:Label><asp:DropDownList
            ID="ddlDepartments" runat="server" AppendDataBoundItems="True" DataSourceID="odsDepartments"
            DataTextField="co_name_short" DataValueField="dept_id" OnDataBound="ddlDepartments_DataBound" CssClass="ddl_margin" Width="155px" >
        </asp:DropDownList>
        </div>
        <div style="float:left">
        <span class="label" style="width:110px;">Reference:</span><asp:TextBox ID="tbOrderRef" runat="server" Width="200px"></asp:TextBox>
        </div>
        <div style="clear:both"></div>
    </div>
    <div class="field">
        <div style="float:left"><span class="label" style="width:110px;">Post Code:</span><asp:TextBox ID="tbPostCode" runat="server"></asp:TextBox></div>
        <div style="float:left"><span class="label" style="width:110px;">Site Address:</span><asp:TextBox ID="tbSiteAddress" runat="server" Width="200px"></asp:TextBox></div>	
        <div style="clear:both"></div>
    </div>
    <div class="field">
        <span class="label" style="width:100px;">Order Date:</span><span class="label" style="width:40px;">From:</span><ww:jQueryDatePicker ID="tbDateFrom" runat="server"
            DisplayMode="AutoPopup" ></ww:jQueryDatePicker>
        <span class="label" style="margin-left:5px;width:25px;">To:</span><ww:jQueryDatePicker ID="tbToDate" runat="server"
            DisplayMode="AutoPopup" ></ww:jQueryDatePicker>
    </div>
    <div class="field" style="display:none;">
        <span class="label">Client Reference:</span><asp:TextBox ID="tbClientRef" runat="server"></asp:TextBox></div>
    <div class="button_bar">
            <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Images/Search.gif" OnClick="btnSearch_Click" 
                onmouseover="this.src='../Images/Search_rollover_selected.gif';" onmouseout="this.src='../Images/Search.gif';"/>


        <asp:ObjectDataSource ID="odsDepartments" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsDeptOrder" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetSearchResults"
            TypeName="DepartmentOrderTableAdapters.DepartmentOrderSearchCommandTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDepartments" DefaultValue="0" Name="dept_id"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="tbSiteAddress" DefaultValue="" Name="site_add" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="tbOrderRef" Name="ord_ref" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="tbClientRef" Name="client_ref" PropertyName="Text"
                    Type="String" DefaultValue="" />
                <asp:ControlParameter ControlID="tbDateFrom" DefaultValue="" Name="from_date" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="tbToDate" Name="to_date" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="tbPostCode" Name="postal_code" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <div class="grid">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" CssClass="grid_table"
        AutoGenerateColumns="False" DataKeyNames="sequence" OnRowDeleting="GridView1_RowDeleting" DataSourceID="odsDeptOrder"
        PageSize="50" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <center>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" ImageUrl="~/Images/edit.png" 
                        CommandName="EditOrder" CommandArgument='<%# Eval("sequence") %>' AlternateText="Edit" />
                    </center>
                </ItemTemplate>
                <HeaderStyle Width="45px" />
            </asp:TemplateField>
            
            
            <asp:TemplateField HeaderText="Cancel">
                <ItemTemplate>
                    <center>
                    <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" ImageUrl="~/Images/cancel_order.png" Visible='<%#!Convert.ToBoolean(Eval("flg_cancelled"))%>'
                        CommandName="CancelOrder" CommandArgument='<%# Eval("sequence") %>' AlternateText="Cancel" OnClientClick="return confirm('Are you sure you want to Cancel this order?');" />                    
                    <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" ImageUrl="~/Images/un_cancel_order.png" Visible='<%#Convert.ToBoolean(Eval("flg_cancelled"))%>'
                        CommandName="UncancelOrder" CommandArgument='<%# Eval("sequence") %>' AlternateText="Uncancel" OnClientClick="return confirm('Are you sure you want to Uncancel this order?');" />
                    </center>
                </ItemTemplate>
                <HeaderStyle Width="45px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Clone">
                <ItemTemplate>
                    <center>
                        <img alt="Clone" src="../Images/copy.png" onclick='showCopyDialog(<%# Eval("sequence") %>)' />
                    </center>
                </ItemTemplate>
                <HeaderStyle Width="45px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Print">
                <ItemTemplate>
                    <center>
                        <asp:HyperLink NavigateUrl='<%#"~/Orders/OrderLog.aspx?deptOrderId=" +  Eval("sequence") %>' runat="server">
                        <img alt="Print" src="../Images/print_icon.png" />
                        </asp:HyperLink>
                    </center>
                </ItemTemplate>
                <HeaderStyle Width="45px" />
            </asp:TemplateField>
            
                     <asp:BoundField DataField="order_sms" HeaderText="SMS Reference" SortExpression="order_sms">
                
            </asp:BoundField>
            <asp:TemplateField HeaderText="Address" SortExpression="address_post_code">
                <ItemTemplate>
                    <div id="addressText<%# Eval("sequence") %>" onmouseover='showCompleteAddress(<%# Eval("sequence") %>);' onmouseout='hideCompleteAddress(<%# Eval("sequence") %>);'>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("address_no") %> '></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("address_line1") %> '></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("address_post_code") %>'></asp:Label>
                    </div>
                    <div id="addressDetail<%# Eval("sequence") %>" class="addressArea" style="position:absolute;display:none;background-color:White;border: solid 1px #000;color:Black;width:400px">
                        <div style="text-align:center;margin-top:5px;margin-bottom:5px;">
                            <b>Brief Description of Works</b>
                        </div>                     
                        <div>
                            <%# Eval("desc_of_work")%>
                        </div>
                        <hr />
                        <div style="text-align:center;margin-top:5px;margin-bottom:5px;">
                            <b>Address</b>
                        </div>
                        <div>
                            <span>House/Flat No:</span><%# Eval("address_no") %>
                        </div>
                        <div >
                            <span >Address: </span><%# Eval("address_line1")%>
                        </div>
                        <div >
                            <span></span><%# Eval("address_line2")%>
                        </div>
                        <div >
                            <span ></span><%# Eval("address_line3")%>
                        </div>
                        <div >
                            <span ></span><%# Eval("address_line4")%>
                        </div >
                        <div >
                            <span ></span><%# Eval("address_line5")%>
                        </div >
                        <div >
                            <span>Postal Code:</span><%# Eval("address_post_code")%>
                        </div>   
                        
                    </div>
       
                </ItemTemplate>
                
            </asp:TemplateField>            
            <asp:BoundField DataField="date_order_created" HeaderText="Date Created" SortExpression="date_order_created"
                DataFormatString="{0:dd/MM/yyyy}">
                
            </asp:BoundField>
            <asp:BoundField DataField="date_order_review" HeaderText="Review Date" SortExpression="date_order_review"
                DataFormatString="{0:dd/MM/yyyy}">
                
            </asp:BoundField>
            <asp:TemplateField HeaderText="Risk Assessments" SortExpression="num_of_risk_assessments">
                <ItemTemplate>
                    <center>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("num_of_risk_assessments") %>'></asp:Label>
                    </center>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
        <PagerStyle CssClass="grid_pager" />
        <FooterStyle CssClass="grid_footer" />
        <SelectedRowStyle CssClass="grid_selected_row" />
        <HeaderStyle CssClass="grid_header" />
        <AlternatingRowStyle CssClass="grid_alternating_row" />
        <RowStyle CssClass="grid_row" />
	<PagerSettings PageButtonCount="100" />
    </asp:GridView>
    </div>
</asp:Content>
