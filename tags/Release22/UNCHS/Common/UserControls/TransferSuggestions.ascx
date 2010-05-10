﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TransferSuggestions.ascx.cs" Inherits="Common_UserControls_TransferSuggestions" %>
    <div style="width:100%">
        <div class="transferArea">
            <fieldset>
                <legend><%=EntityName%> List</legend>
                <div class="ddl_field">
                    <span>Company:</span>
                    <asp:DropDownList ID="ddlCompany1" runat="server" DataSourceID="odsCompany" DataTextField="co_name_short" 
                        DataValueField="co_id" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <div class="ddl_field">
                    <span>Department:</span>
                    <asp:DropDownList ID="ddlDepartment1" runat="server" 
                        DataSourceID="odsDeparment1" DataTextField="co_name_short" 
                        DataValueField="dept_id" AutoPostBack="True"  >
                    </asp:DropDownList>
                </div>     
                <div style="text-align:right;width:100%;height:28px;">
                    <asp:Button Text="Transfer All >>" runat="server" 
                        style="margin-right:10px;margin-top:5px;" ID="btnTransferAll1" 
                        onclick="btnTransferAll1_Click" /> 
                </div>
                <div class="grid">
                    <asp:GridView ID="gv1" runat="server" CssClass="grid_table"
                    PageSize="50" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="sequence" 
                        onrowcommand="gv1_RowCommand" >
                        <PagerStyle CssClass="grid_pager" />
                        <Columns>
                            <asp:TemplateField HeaderText="Category" InsertVisible="False" 
                                SortExpression="sequence">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("category_name") %>'></asp:Label>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Plants & Tools" SortExpression="name_desc">
                                <ItemTemplate>
                                    <asp:Label ID="lbl1" runat="server" Text='<%# Bind("suggestion_text") %>'></asp:Label>
                                    <asp:HiddenField ID="hfId1" runat="server" Value='<%# Bind("suggestion_id") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transfer" >
                                <ItemTemplate>
                                    <asp:Button ID="btnTransfer1" runat="server" Text="Trasfer >>" CommandName="Transfer" CommandArgument='<%# Eval("suggestion_id") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>                           
                        </Columns>
                        <FooterStyle CssClass="grid_footer" />
                        <SelectedRowStyle CssClass="grid_selected_row" />
                        <HeaderStyle CssClass="grid_header" />
                        <AlternatingRowStyle CssClass="grid_alternating_row" />
                        <RowStyle CssClass="grid_row" />
                    </asp:GridView>    
                </div>
            </fieldset>
        </div>
        <div class="transferArea">            
            <fieldset>
                <legend><%=EntityName%> List</legend>
                <div class="ddl_field">
                    <span>Company:</span>
                    <asp:DropDownList ID="ddlCompany2" runat="server" DataSourceID="odsCompany" DataTextField="co_name_short" 
                        DataValueField="co_id" AutoPostBack="true">
                    </asp:DropDownList>
                </div>                
                <div class="ddl_field">
                    <span>Department:</span>
                    <asp:DropDownList ID="ddlDepartment2" runat="server" 
                        DataSourceID="odsDeparment2" DataTextField="co_name_short" 
                        DataValueField="dept_id" AutoPostBack="True"  >
                    </asp:DropDownList>
                </div>    
                <div style="text-align:left;width:100%;height:28px;">
                    <asp:Button ID="btnTransferAll2" Text="<< Transfer All" runat="server" 
                        style="margin-top:5px;" onclick="btnTransferAll2_Click"/> 
                </div>                       
                <div class="grid">
                    <asp:GridView ID="gv2" runat="server" CssClass="grid_table"
                    PageSize="50" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="sequence" onrowcommand="gv2_RowCommand" >
                        <PagerStyle CssClass="grid_pager" />
                        <Columns>
                            <asp:TemplateField HeaderText="Transfer" >
                                <ItemTemplate>
                                    <asp:Button ID="btnTransfer2" runat="server" Text="<< Trasfer" CommandName="Transfer" CommandArgument='<%# Eval("suggestion_id") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>                           

                            <asp:TemplateField HeaderText="Category" InsertVisible="False" 
                                SortExpression="sequence">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("category_name") %>'></asp:Label>
                                    <asp:HiddenField ID="hfId2" runat="server" Value='<%# Bind("suggestion_text") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Plants & Tools" SortExpression="name_desc">
                                <ItemTemplate>
                                    <asp:Label ID="lbl2" runat="server" Text='<%# Bind("suggestion_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>

                        <FooterStyle CssClass="grid_footer" />
                        <SelectedRowStyle CssClass="grid_selected_row" />
                        <HeaderStyle CssClass="grid_header" />
                        <AlternatingRowStyle CssClass="grid_alternating_row" />
                        <RowStyle CssClass="grid_row" />
                    </asp:GridView>    
                </div>                                     
            </fieldset>
        </div>
        <div style="clear:both"></div>
    </div>
    <asp:ObjectDataSource ID="odsCompany" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllCompanies" 
        TypeName="CompanyTableAdapters.un_co_detailsTableAdapter">
    </asp:ObjectDataSource>      
    <asp:ObjectDataSource ID="odsDeparment1" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDepartmentsByCoId" 
        TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCompany1" DefaultValue="0" Name="co_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDeparment2" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDepartmentsByCoId" 
        TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCompany2" DefaultValue="0" Name="co_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>



