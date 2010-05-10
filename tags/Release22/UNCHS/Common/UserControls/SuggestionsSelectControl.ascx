<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SuggestionsSelectControl.ascx.cs" Inherits="Common_UserControls_SuggestionsSelectControl" %>
<script type="text/javascript">
    var suggestionDialog;
</script>
    <div id="suggestionDialog" style="display:none;">
        <div class="hd">
            Select <%=EntityName%> to Add:
        </div>
        <div class="bd" style="overflow: auto;height:400px;" >
            <div class="field">
                <asp:Repeater ID="rptSuggestions" runat="server" OnItemDataBound="rptSuggestions_ItemDataBound">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfCategoryName" runat="server" Value='<%# Container.DataItem %>'/>
                        <fieldset>
                            <legend><b><%# Container.DataItem %></b></legend>
                            <asp:CheckBoxList ID="cbSuggestions" runat="server" RepeatColumns="3" Width="100%">
                            </asp:CheckBoxList>
                        </fieldset>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="ft">
            <asp:ImageButton ID="btnAddSuggestions" runat="server" OnClick="btnAddSuggestions_Click" />                
        </div>
    </div>
    <script type="text/javascript">
        	// Instantiate the Dialog
		suggestionDialog = new YAHOO.widget.Dialog("suggestionDialog", 
							{ width : "980px",							  
							  fixedcenter : true,
							  close : true,
			                  zindex:3,
			                  modal:true,							  
							  visible : false, 
							  constraintoviewport : false,
							  draggable:true
							});
		suggestionDialog.render();

    </script>    

