<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderSeqOfWoks.aspx.cs" Inherits="Orders_AddOrderSeqOfWoks" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc2" %>
<%@ Register Src="../Common/UserControls/SuggestionsSelectControl.ascx" TagName="SuggestionsSelectControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css" )%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css" )%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
         <div style="float:left; width:100%;">   
        <div style="float: left;">
            <img src="<%=this.ResolveClientUrl("~/images/big_pnl_left.jpg")%>" alt="" height="20" />
        </div>
        <div style="float: left; width: 96.1%;">
            <img src="<%=this.ResolveClientUrl("~/Images/big_pnl_mid.jpg")%>" alt="" style="width: 100%"
                height="20" />
        </div>
        <div>
            <img src="<%=this.ResolveClientUrl("~/images/big_pnl_right.jpg")%>" alt="" height="20" />
        </div>
    </div>

     <div style="float:left; width:99.99%">
        <div style="background-color: White; border-top: 1px solid white;">
            <div style="margin: auto; width: 97.6%; ">
                <div style="float: left">
                    <img src="<%=this.ResolveClientUrl("~/images/bc_left.jpg")%>" alt="" width="8" height="31" /></div>
                <div class="breadcrum_mid" style="height: 23px; padding-top: 8px; float: left; width: 96%">
                    Add/Amend H&amp;S Folder - Sequence of Work
                </div>
                <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
            </div>
        </div>
     </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc2:TabControl ID="TabControl2" runat="server" Selected="Work" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 180px;width:97.65%;float:left">
        <uc1:SuggestionsSelectControl ID="suggestionsSelectControl" runat="server" EntityName="Sequence of Work"
            SuggestionType="W" ImageName="Add_sequence_of_work" />
        <div class="warning_text" style="padding-top: 10px; padding-bottom: 10px;">
            <strong>Data may go to continuation sheet if it exceeds the number of recods.</strong></div>
        <div class="field">
            <span class="heading"><strong>Sequence of Work:</strong></span>
        </div>
        <div class="text_field">
            <asp:TextBox ID="tbWork" runat="server" Rows="5" TextMode="MultiLine" Width="98%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="tbWork"
                ErrorMessage="*" ValidationGroup="Work"></asp:RequiredFieldValidator>
        </div>
        <div class="button_bar">
            <div class="button_right" style="padding-left: 340px;">
                <div style="float: left">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:LinkButton ID="btnAddWork" runat="server" OnClick="btnAddWork_Click" ValidationGroup="Work" CssClass="txt_white">Add Sequence of Work</asp:LinkButton>
                </div>
                <div style="float: left">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
                </div>
                <div style="float: left; padding-left: 15px;">
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <a href="" onclick="document.getElementById('suggestionDialog').style.display='block';suggestionDialog.show();return false;"
                        style="margin-right: 10px; margin-left: 5px" class="txt_white">Sequence of Works List</a>
                </div>
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
        </div>
        <div class="grid">
            <asp:GridView Width="100%" ID="gvWork" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CssClass="table_header_result" DataKeyNames="sequence" DataSourceID="odsWork"
                OnRowDeleting="gvWork_RowDeleting" OnRowUpdating="gvWork_RowUpdating" PageSize="50">
                <Columns>
                    <asp:TemplateField HeaderText="Edit">
                        <EditItemTemplate>
                            <center>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update"
                                    ImageUrl="~/Images/icon_edit.png" AlternateText="Update"></asp:ImageButton>
                            </center>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    ImageUrl="~/Images/icon_edit.png" AlternateText="Edit"></asp:ImageButton>
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <EditItemTemplate>
                            <center>
                                <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    ImageUrl="~/Images/icon_cancel.png" AlternateText="Cancel"></asp:ImageButton>
                            </center>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                    ImageUrl="~/Images/icon_cancel.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                                </asp:ImageButton>
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="work_desc" HeaderText="Description" SortExpression="work_desc" />
                </Columns>
                <PagerStyle CssClass="grid_pager" />
                <FooterStyle CssClass="grid_footer" />
                <SelectedRowStyle CssClass="grid_selected_row" />
                <HeaderStyle CssClass="table_header" />
                <AlternatingRowStyle CssClass="grid_alternating_row" />
                <RowStyle CssClass="grid_row" />
            </asp:GridView>
            &nbsp;
        </div>
        <asp:HiddenField ID="hfDeptId" runat="server" />
        <asp:ObjectDataSource ID="odsWork" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllWorks" TypeName="DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter"
            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="sequence" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="work_desc" Type="String" />
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
                <asp:Parameter Name="work_desc" Type="String" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </InsertParameters>
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
