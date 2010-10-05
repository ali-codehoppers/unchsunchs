<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SuggestionsControl.ascx.cs" Inherits="Common_UserControls_SuggestionsControl" %>
    <div class="ddl_field">
        <asp:Label ID="lblDepartment" runat="server" Text="Department:" Width="100px"></asp:Label><asp:DropDownList 
            ID="ddlDepartment" runat="server" 
            AutoPostBack="true" ondatabound="ddlDepartment_DataBound" 
            onselectedindexchanged="ddlDepartment_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:HiddenField ID="hfSuggestionId" runat="server" />
    </div>
    <div class="ddl_field">
        <span style="width:100px;">Category:</span><asp:DropDownList ID="ddlCategory" runat="server"
            >
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                runat="server" ErrorMessage="*" CssClass="error" ControlToValidate="ddlCategory" ValidationGroup="Top"></asp:RequiredFieldValidator>
        
    </div>    
        
    <div class="text_field">
        <span style="width:100px;"><%=EntityName%></span><asp:TextBox ID="tbName" runat="server" ></asp:TextBox><asp:RequiredFieldValidator
            ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" CssClass="error"
            ControlToValidate="tbName" ValidationGroup="Top"></asp:RequiredFieldValidator>
    </div>
    <div class="field">
        <span style="width:100px;">Default:</span><asp:CheckBox ID="cbDefault" runat="server" />
    </div>     
    
        <div class="button_bar">
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" ValidationGroup="Top" />
            <asp:Button ID="btnUpate" runat="server" OnClick="btnUpate_Click" Text="Update"
                Visible="False" ValidationGroup="Top" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
        </div>
        <hr />
        <input type="hidden" name="idOrdering" id="idOrdering" />
        <div class="button_bar">
            <asp:Button ID="btnSave" runat="server" Text="Save Ordering" OnClick="btnSave_Click"
                OnClientClick="return saveReorderedList();" />
        </div>
        <div class="workArea">
            
                <asp:Repeater ID="repeater" runat="server"
                    OnItemCommand="repeater_ItemCommand">
                    <HeaderTemplate>
                        <div class="draglistHeader">
                            <asp:Label ID="Label1" runat="server" style="margin-left:50px;">Category Name</asp:Label>
                            <asp:Label ID="Label3" runat="server" style="margin-left:50px;">Default</asp:Label>
                            <asp:Label ID="Label2" runat="server" style="margin-left:40px;">Hazard</asp:Label>
                            
                        </div>
            <ul id="dragDropUL" class="draglist">
                    </HeaderTemplate>                   
                    <ItemTemplate>
                        <li class="ddLi" id="li_<%#DataBinder.Eval(Container.DataItem, "suggestion_id")%>">
                            <!--<div class="liData">-->
                            <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Images/edit.png" AlternateText="Edit"
                                CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "suggestion_id")%>' />
                            <!--</div>-->
                            <!--<div class="liData">-->
                            <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/delete.png" AlternateText="Delete"
                                CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "suggestion_id")%>'
                                OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                            <!--</div>-->
                            <!--<div class="liData">-->
                            <span style="display:inline-block;width:160px"><%#DataBinder.Eval(Container.DataItem, "category_name")%></span>
                            <asp:CheckBox ID="cbDefault" runat="server" style="margin-right:50px;" Checked='<%#DataBinder.Eval(Container.DataItem, "flg_default")%>' Enabled="false"/>                            
                            <%#DataBinder.Eval(Container.DataItem, "suggestion_text")%>
                            <!--</div>-->
                        </li>
                    </ItemTemplate>
                    <FooterTemplate></ul>
                    </FooterTemplate>
                </asp:Repeater>
            </ul>
        </div>

