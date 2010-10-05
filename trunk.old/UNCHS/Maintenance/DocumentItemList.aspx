<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="DocumentItemList.aspx.cs" Inherits="Maintenance_DocumentItemList" Title="Simplicity4Business" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <style type="text/css">
        .text_field span{width:150px;height:100%;display:inline-block;}    
        .field span{width:150px;display:inline-block;}    
        .ddl_field span{width:150px;display:inline-block;}    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div style="text-align:right;">
        <asp:HyperLink NavigateUrl="~/Maintenance/SectionList.aspx" Text="Define Sections" runat="server" ID="hl1"></asp:HyperLink>
    </div>
    <div class="field">
        <span >Department:</span><asp:Label ID="lblDepartment" runat="server" Text="[Department]" Width="500px"></asp:Label>
    </div>    
    <div class="field">
        <span >Document Name:</span><asp:Label ID="lblDocName" runat="server" Text="[Document Name]" Width="500px"></asp:Label>
    </div>
    <div class="button_bar">
        <asp:Button ID="btnSave" runat="server" Text="Save Details" OnClick="btnSave_Click" />
        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
    </div>    
    <div class="warning">
        <h3>IMPORTANT INFORMATION</h3>
        <div>    
	        This section should only be used by an Administrator, making changes can affect your Health & Safety documents, and can cause them to be invalid, adding Risk to employees. 
        </div>
    </div>
    <asp:Repeater ID="rptSections" runat="server" DataSourceID="odsSections" OnItemDataBound="rptSections_ItemDataBound">
        <ItemTemplate>            
            <div class="field">
                <%#DataBinder.Eval(Container.DataItem, "section_desc")%>
                <asp:HiddenField ID="hfSectionId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "section_id")%>'/>
            </div>
            <div class="field">
                <asp:CheckBoxList ID="cbItem" runat="server" RepeatColumns="4" Width="500px" 
                    Visible='<%#CompareType(DataBinder.Eval(Container.DataItem, "section_type"),WebConstants.SectionTypes.MULTIPLE_SELECT_LIST) %>'
                    DataSource='<%#DataSource(DataBinder.Eval(Container.DataItem, "section_id")) %>' DataTextField="section_detail_desc" DataValueField="section_detail_id" ></asp:CheckBoxList>    
            </div>
            <div class="text_field">
                <asp:TextBox ID="tbItem" runat="server" TextMode="MultiLine" Rows="10" Width="500px" Visible='<%#CompareType(DataBinder.Eval(Container.DataItem, "section_type"),WebConstants.SectionTypes.FREE_TEXT) %>' ></asp:TextBox>                
            </div>    
        </ItemTemplate>
    </asp:Repeater>
    <div class="button_bar">
        <asp:Button ID="btnSave1" runat="server" Text="Save Details" OnClick="btnSave_Click" />
        <asp:Button ID="btnBack1" runat="server" Text="Back" OnClick="btnBack_Click" />
    </div>    

    <asp:ObjectDataSource ID="odsSections" runat="server"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetByDocType" TypeName="DocumentTemplateTableAdapters.DocumentSectionTableAdapter">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="dept_id" QueryStringField="depId"
                Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="doc_type_id" QueryStringField="docTypeId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

