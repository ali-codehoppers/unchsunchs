<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="AddOrderDocuments.aspx.cs" Inherits="Orders_AddOrderDocuments" Title="Untitled Page" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<%@ Register Assembly="jQueryDatePicker" Namespace="Westwind.Web.Controls" TagPrefix="ww" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Common/StyleSheets/Tab.css" />

    <link rel="stylesheet" type="text/css" href="<%=Request.ApplicationPath%>/Includes/yui/build/container/assets/skins/sam/container.css" />

    <script type="text/javascript" src="<%=Request.ApplicationPath%>/Includes/yui/build/container/container-min.js"></script>
    <style type="text/css">
        .field span{margin-left:10px;width:110px;display:inline-block;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
Add/Edit H&amp;S Folder
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">        
    <uc1:tabcontrol id="TabControl1" runat="server" Selected="Docs"></uc1:tabcontrol>
    <div id="loadingDiv"></div>
    <script type="text/javascript">
        function showLoading()
        {
            var loadingDialog = new YAHOO.widget.Panel("loadingDiv",  
                                                        { width: "240px", 
                                                          fixedcenter: true, 
                                                          close: false, 
                                                          draggable: false, 
                                                          zindex:4,
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
    <div class="field">
        <asp:Repeater ID="rptDocTypes" runat="server" DataSourceID="odsDocTypes">
            <ItemTemplate>
                <div class="field" style='<%#DataBinder.Eval(Container.DataItem, "style")%>'>
                    <asp:HiddenField ID="hfRequired" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "required")%>' />  
                    <asp:HiddenField ID="hfCoId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "co_id")%>' />  
                    <asp:HiddenField ID="hfDeptId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "dept_id")%>' />  
                    <asp:HiddenField ID="hfId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "doc_data_type_id")%>' />  
                    <asp:HiddenField ID="hfFieldType" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "field_type")%>'/>
                    <asp:HiddenField ID="hfGeneratorClass" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "generator_class")%>'/>
                    <asp:HiddenField ID="hfIsLandScape" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "flg_landscape")%>'/>
                    <asp:CheckBox ID="cbDocType" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "doc_data_type_desc")%>' checked='true'></asp:CheckBox>
                    <asp:Label runat="server" ID="Label123" Visible='<%# AreEqual(DataBinder.Eval(Container.DataItem,"field_type"),"int") %>' Text="Number of Copies:"></asp:Label>
                    <ew:NumericBox Text="1" ID="nbNumOfPrints" runat="server" Visible='<%# AreEqual(DataBinder.Eval(Container.DataItem,"field_type"),"int") %>' Width="20px" MaxLength="2"></ew:NumericBox>                
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>      
    <div class="field">&nbsp;</div>
    <div class="field"><asp:CheckBox ID="cbBlankPage" runat="server" Text='Include a blank paper after every copy' checked='true'></asp:CheckBox></div>
        <hr />
    
    <div class="field">
        Date Sent to Client:
        <ww:jQueryDatePicker ID="dtClient" runat="server" DisplayMode="AutoPopup" ></ww:jQueryDatePicker>
    </div> 
    <div class="field">
        <asp:CheckBox ID="cbRegister" runat="server" Text="Client provided a copy of asbestos register"/>        
    </div>
    <div class="field">
        <asp:CheckBox ID="cbClosed" runat="server" Text="Health & Saftey Closed"/>
    </div>
    <div class="button_bar">
        <asp:Button ID="btnCreate" runat="server" Text="Create Folder" OnClick="btnCreate_Click" OnClientClick="showLoading();" />
    </div>
    
            <asp:ObjectDataSource ID="odsDocTypes" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDocTypeByDeptId" TypeName="DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

</asp:Content>

