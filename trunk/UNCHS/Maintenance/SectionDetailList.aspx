<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="SectionDetailList.aspx.cs" Inherits="Maintenance_SectionDetailList" Title="Simplicity4Business" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
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
    <div class="field">
        <span>Department:</span><asp:Label ID="lblDept" runat="server" Text="[Department]" Width="500px"></asp:Label>
    </div>    
    <div class="text_field">
        <span>Section:</span><asp:Label ID="lblSection" runat="server" Text="[Section]" Width="500px"></asp:Label>        
    </div>
    <div class="text_field">
        <span>Section Detail:</span><asp:TextBox ID="tbSecDetail" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ValidationGroup="Add" ControlToValidate="tbSecDetail"></asp:RequiredFieldValidator>        
    </div>

    <div class="text_field">
        <span>Detail Index:</span><ew:NumericBox ID="tbIndex" runat="server" ></ew:NumericBox>                        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ValidationGroup="Add" ControlToValidate="tbIndex"></asp:RequiredFieldValidator>
    </div>
    <div class="button_bar">
        <asp:Button ID="btnAdd" runat="server" Text="Add Section Detail" OnClick="btnAdd_Click" ValidationGroup="Add"/>
        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
    </div>
    <div class="grid">
        <asp:GridView ID="gvSecDetails" runat="server" AutoGenerateColumns="False" CssClass="grid_table"
            DataKeyNames="section_detail_id" DataSourceID="odsSecDetails" PageSize="50" AllowPaging="True" AllowSorting="True" OnRowUpdating="gvSecDetails_RowUpdating">
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
            <Columns>
                <asp:TemplateField HeaderText="Edit" >
                    <HeaderStyle Width="50px" />
                    <ItemTemplate>                                        
                        <asp:ImageButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Edit"
                            ImageUrl="~/Images/edit.png" AlternateText="Edit" ></asp:ImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Update"
                            ImageUrl="~/Images/edit.png" AlternateText="Update" ValidationGroup="Update"></asp:ImageButton>                    
                    </EditItemTemplate>              
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>            
                <asp:TemplateField HeaderText="Delete" >
                    <HeaderStyle Width="50px" />
                    <EditItemTemplate>
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            ImageUrl="~/Images/delete.png" AlternateText="Cancel" ></asp:ImageButton>                    
                    </EditItemTemplate>
                    <ItemTemplate>                                        
                        <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                            ImageUrl="~/Images/delete.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');"></asp:ImageButton>
                    </ItemTemplate>         
                    <ItemStyle HorizontalAlign="Center" />     
                </asp:TemplateField>                        
                <asp:TemplateField HeaderText="Section Detail Index" SortExpression="section_detail_index">
                    <HeaderStyle Width="150px" />
                    <EditItemTemplate>
                        <ew:NumericBox ID="TextBox1" runat="server" Text='<%# Bind("section_detail_index") %>'></ew:NumericBox> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ValidationGroup="Update" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>                               
                    </EditItemTemplate>
                    <ItemTemplate>
                        <center>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("section_detail_index") %>'></asp:Label>
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Section Detail" SortExpression="section_detail_desc">
                    <EditItemTemplate>
                        <div class="text_field">
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("section_detail_desc") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ValidationGroup="Update" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>        
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("section_detail_desc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
        <asp:ObjectDataSource ID="odsSecDetails" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetBySecId" TypeName="DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter"
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_section_detail_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="section_detail_index" Type="Int32" />
                <asp:Parameter Name="section_detail_desc" Type="String" />
                <asp:Parameter Name="Original_section_detail_id" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="dept_id" QueryStringField="depId"
                    Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="section_id" QueryStringField="secId"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="section_id" Type="Int32" />
                <asp:Parameter Name="co_id" Type="Int32" />
                <asp:Parameter Name="dept_id" Type="Int32" />
                <asp:Parameter Name="section_detail_index" Type="Int32" />
                <asp:Parameter Name="section_detail_desc" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

