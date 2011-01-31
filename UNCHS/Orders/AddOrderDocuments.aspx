<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderDocuments.aspx.cs" Inherits="Orders_AddOrderDocuments" Title="Simplicity4Business" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<%@ Register Assembly="jQueryDatePicker" Namespace="Westwind.Web.Controls" TagPrefix="ww" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>
    <style type="text/css">
        .field span
        {
            margin-left: 10px;
            width: 110px;
            display: inline-block;
        }
    </style>
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
                Add/Amend H&amp;S Folder
            </div>
            <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc1:TabControl ID="TabControl1" runat="server" Selected="Docs"></uc1:TabControl>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 200px;">
        <div id="loadingDiv">
        </div>
        <script type="text/javascript">
            function showLoading() {
                var loadingDialog = new YAHOO.widget.Panel("loadingDiv",
                                                        { width: "240px",
                                                            fixedcenter: true,
                                                            close: false,
                                                            draggable: false,
                                                            zindex: 4,
                                                            modal: true,
                                                            visible: false
                                                        }
                                                    );

                loadingDialog.setHeader("Generating folder, please wait...");
                loadingDialog.setBody("<img src='../Images/loading.gif' />");
                loadingDialog.render();
                loadingDialog.show();
            }
    
        </script>
        <div class="field">
            <asp:HyperLink ID="hlDoc" runat="server" Visible="false" Target="_blank">Link to the Document</asp:HyperLink>
        </div>
        <strong>
            <div class="field">
                <asp:Repeater ID="rptDocTypes" runat="server" DataSourceID="odsDocTypes">
                    <ItemTemplate>
                        <div class="field" style='<%#DataBinder.Eval(Container.DataItem, "style")%>'>
                            <asp:HiddenField ID="hfRequired" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "required")%>' />
                            <asp:HiddenField ID="hfCoId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "co_id")%>' />
                            <asp:HiddenField ID="hfDeptId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "dept_id")%>' />
                            <asp:HiddenField ID="hfId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "doc_data_type_id")%>' />
                            <asp:HiddenField ID="hfFieldType" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "field_type")%>' />
                            <asp:HiddenField ID="hfGeneratorClass" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "generator_class")%>' />
                            <asp:HiddenField ID="hfIsLandScape" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "flg_landscape")%>' />
                            <asp:CheckBox ID="cbDocType" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "doc_data_type_desc")%>'
                                Checked='<%#DataBinder.Eval(Container.DataItem, "flg_checked")%>'></asp:CheckBox>
                            <asp:Label runat="server" ID="Label123" Visible='<%# AreEqual(DataBinder.Eval(Container.DataItem,"field_type"),"int") %>'
                                Text="Number of Copies:" Width="120px"></asp:Label>
                            <ew:NumericBox Text="1" ID="nbNumOfPrints" runat="server" Visible='<%# AreEqual(DataBinder.Eval(Container.DataItem,"field_type"),"int") %>'
                                Width="20px" MaxLength="2"></ew:NumericBox>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </strong>
        <div class="field">
            &nbsp;</div>
        <div class="field">
            <strong>
                <asp:CheckBox ID="cbBlankPage" runat="server" Text='Include a blank paper after every copy'
                    Checked='true'></asp:CheckBox></strong></div>
        <hr />
        <div class="field">
            <strong>Date Sent to Client:</strong>
            <ww:jQueryDatePicker ID="dtClient" runat="server" DisplayMode="AutoPopup" CssClass="field_txt_small"></ww:jQueryDatePicker>
        </div>
        <div class="field">
            <strong>
                <asp:CheckBox ID="cbRegister" runat="server" Text="Client provided a copy of asbestos register" /></strong>
        </div>
        <div class="field">
            <strong>
                <asp:CheckBox ID="cbClosed" runat="server" Text="Health & Saftey Closed" /></strong>
        </div>
        <asp:ObjectDataSource ID="odsDocTypes" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDocTypeByDeptIdAndCategory" TypeName="DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:Parameter DefaultValue="Method Statement" Name="category" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="button_bar">
            <div class="button_right" style="padding-left: 340px;">
                <div style="float: left">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:LinkButton CssClass="txt_white" ID="btnCreate" runat="server" OnClick="btnCreate_Click"
                        OnClientClick="showLoading();" Style="margin-right: 10px; margin-left: 5px">Create Folder</asp:LinkButton>
                </div>
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
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
