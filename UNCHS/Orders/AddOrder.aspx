<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrder.aspx.cs" Inherits="Orders_AddOrder" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="jQueryDatePicker" Namespace="Westwind.Web.Controls" TagPrefix="ww" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
    <style type="text/css">
        .text_field span
        {
            width: 340px;
            height: 100%;
            display: inline-block;
            padding-bottom: 8px;
            font-weight: bold;
            font-size: 12px;
        }
        .field span
        {
            width: 340px;
            display: inline-block;
            padding-bottom: 10px;
            font-weight: bold;
        }
        .ddl_field span
        {
            width: 340px;
            display: inline-block;
            padding-bottom: 10px;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        var copyDialog;
        function showCopyDialog() {

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
    <uc1:TabControl ID="TabControl1" runat="server" Selected="Main"></uc1:TabControl>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div id="copyDialog" style="display: none">
        <div class="hd">
            Enter the Address for new folder:</div>
        <div class="bd">
            <div class="text_field">
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <span>House/Flat No:</span><asp:TextBox ID="tbPopupFlat" runat="server"></asp:TextBox>
            </div>
            <div class="text_field">
                <span>Address:</span><asp:TextBox ID="tbPopupAddress1" runat="server"></asp:TextBox>
            </div>
            <div class="text_field" style="padding-left: 340px; padding-bottom: 5px;">
                <asp:TextBox ID="tbPopupAddress2" runat="server"></asp:TextBox>
            </div>
            <div class="text_field" style="padding-left: 340px; padding-bottom: 5px;">
                <asp:TextBox ID="tbPopupAddress3" runat="server"></asp:TextBox>
            </div>
            <div class="text_field" style="padding-left: 340px; padding-bottom: 5px;">
                <asp:TextBox ID="tbPopupAddress4" runat="server"></asp:TextBox></div>
            <div class="text_field" style="padding-left: 340px; padding-bottom: 5px;">
                <asp:TextBox ID="tbPopupAddress5" runat="server"></asp:TextBox>
            </div>
            <div class="text_field">
                <span>Postal Code:</span><asp:TextBox ID="tbPopupPostCode" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="ft" style="text-align: center">
            <div style="float: left">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnCreate" runat="server" OnClick="btnCreate_Click" CssClass="txt_white"
                    Width="150px">Continue</asp:LinkButton>
            </div>
            <div style="float: left">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
            <div style="float: left; padding-left:10px;">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton PostBackUrl="~/UserHome.aspx" ID="cancel" runat="server" CssClass="txt_white"
                    Width="150px">Cancel</asp:LinkButton>
            </div>
            <div style="float: left">
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
            <div style="clear:both"></div>
        </div>
    </div>
    <div style="background-color: White; padding: 15px 10px 25px 10px">
        <div class="text_field">
            <asp:HiddenField ID="hfSourceOrderId" runat="server" />
            <asp:Label ID="lblDepartment" runat="server" Text="Department:"></asp:Label><asp:DropDownList
                CssClass="dropdown_txt" ID="ddlDepartment" runat="server" DataSourceID="odsDepartment"
                DataTextField="co_name_short" DataValueField="dept_id" OnDataBound="ddlDepartment_DataBound">
            </asp:DropDownList>
        </div>
        <div class="text_field">
            <span>Reference:</span><asp:TextBox ID="tbOrderRef" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="display: none;">
            <span>Order Cleint Reference:</span><asp:TextBox ID="tbOrderClientRef" CssClass="field_txt"
                runat="server"></asp:TextBox></div>
        <div class="text_field">
            <span>SMS Ref:</span><asp:TextBox ID="tbOrderSMS" runat="server" CssClass="field_txt"
                Enabled="false"></asp:TextBox></div>
        <div class="field">
            <span>Date Created:</span><ww:jQueryDatePicker ID="dtCreated" runat="server" CssClass="field_txt_small"
                DisplayMode="AutoPopup" DateFormat="dd/MM/yyyy"></ww:jQueryDatePicker>
        </div>
        <div class="text_field">
            <span>Estimated Duration of Work (days):</span><ew:NumericBox ID="tbEstWork" runat="server"
                CssClass="field_txt"></ew:NumericBox></div>
        <div class="ddl_field">
            <span>Risk Rating:</span><asp:DropDownList ID="ddlRiskTaking" runat="server" CssClass="dropdown_txt">
                <asp:ListItem Value="Low" Text="Low"></asp:ListItem>
                <asp:ListItem Value="Medium" Text="Medium"></asp:ListItem>
                <asp:ListItem Value="High" Text="High"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="text_field">
            <span>Estimated number of Operatives on Site(at any one time):</span><ew:NumericBox
                ID="tbEstNumOperatives" CssClass="field_txt" runat="server"></ew:NumericBox></div>
        <div class="field">
            <span>Review Date:</span><asp:CheckBox ID="cbReview" runat="server" AutoPostBack="true"
                OnCheckedChanged="cbReview_CheckedChanged" /><ww:jQueryDatePicker CssClass="field_txt_small"
                    ID="dtReview" runat="server" DisplayMode="AutoPopup" Enabled="false" DateFormat="dd/MM/yyyy"></ww:jQueryDatePicker></div>
        <div class="field" style="display: none;">
            <span>Document to Client:</span><asp:CheckBox ID="cbDocClient" runat="server" /></div>
        <div class="text_field" style="padding-bottom: 5px">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="vertical-align: middle;">
                        <span>Brief Description of Work:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="tbDescOfWork" runat="server" Rows="5" TextMode="MultiLine" CssClass="text_area"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="text_field">
            <span>House/Flat No:</span><asp:TextBox ID="tbAddressNo" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field">
            <span>Address:</span><asp:TextBox ID="tbAddress1" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom: 5px; padding-left: 340px;">
            <asp:TextBox ID="tbAddress2" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom: 5px; padding-left: 340px;">
            <asp:TextBox ID="tbAddress3" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom: 5px; padding-left: 340px;">
            <asp:TextBox ID="tbAddress4" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom: 5px; padding-left: 340px;">
            <asp:TextBox ID="tbAddress5" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field">
            <span>Post Code:</span><asp:TextBox ID="tbPostalCode" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="vertical-align: middle;">
                        <span>Additional Notes regarding Adress/Job:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="tbDesc" runat="server" Rows="5" TextMode="MultiLine" CssClass="text_area"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="field" style="display: none;">
            <span>Multiple Emergency Exits:</span><asp:CheckBox ID="cbMultiEmerExits" runat="server"
                Enabled="False" /></div>
        <div class="field" style="display: none;">
            <span>Multiple Assembly Pts:</span><asp:CheckBox ID="cbAssemPts" runat="server" Enabled="False" /></div>
        <div class="button_bar" style="display: none;">
            <asp:Button ID="btnSave" runat="server" Text="Save & Details" OnClick="btnSave_Click" /><asp:Button
                ID="btnUpdate" runat="server" Text="Update & Continue" OnClick="btnUpdate_Click"
                Visible="False" />
            <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel Order"
                Visible="False" />
            <asp:Button ID="btnUncancel" runat="server" OnClick="btnUncancel_Click" Text="Uncancel Order"
                Visible="False" />
            <asp:ObjectDataSource ID="odsDepartment" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                <SelectParameters>
                    <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" DefaultValue="0" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Original_dept_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="co_name_short" Type="String" />
                    <asp:Parameter Name="co_name_long" Type="String" />
                    <asp:Parameter Name="contact_title" Type="String" />
                    <asp:Parameter Name="contact_initails" Type="String" />
                    <asp:Parameter Name="contact_forename" Type="String" />
                    <asp:Parameter Name="contact_surname" Type="String" />
                    <asp:Parameter Name="address_no" Type="String" />
                    <asp:Parameter Name="address_line1" Type="String" />
                    <asp:Parameter Name="address_line2" Type="String" />
                    <asp:Parameter Name="address_line3" Type="String" />
                    <asp:Parameter Name="address_line4" Type="String" />
                    <asp:Parameter Name="address_line5" Type="String" />
                    <asp:Parameter Name="address_post_code" Type="String" />
                    <asp:Parameter Name="address_full" Type="String" />
                    <asp:Parameter Name="tel_1" Type="String" />
                    <asp:Parameter Name="tel_2" Type="String" />
                    <asp:Parameter Name="tel_fax" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="co_notes" Type="String" />
                    <asp:Parameter Name="last_amended_by" Type="Int32" />
                    <asp:Parameter Name="date_last_amended" Type="DateTime" />
                    <asp:Parameter Name="dept_id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="co_id" Type="Int32" />
                    <asp:Parameter Name="flg_deleted" Type="Boolean" />
                    <asp:Parameter Name="co_name_short" Type="String" />
                    <asp:Parameter Name="co_name_long" Type="String" />
                    <asp:Parameter Name="contact_title" Type="String" />
                    <asp:Parameter Name="contact_initails" Type="String" />
                    <asp:Parameter Name="contact_forename" Type="String" />
                    <asp:Parameter Name="contact_surname" Type="String" />
                    <asp:Parameter Name="address_no" Type="String" />
                    <asp:Parameter Name="address_line1" Type="String" />
                    <asp:Parameter Name="address_line2" Type="String" />
                    <asp:Parameter Name="address_line3" Type="String" />
                    <asp:Parameter Name="address_line4" Type="String" />
                    <asp:Parameter Name="address_line5" Type="String" />
                    <asp:Parameter Name="address_post_code" Type="String" />
                    <asp:Parameter Name="address_full" Type="String" />
                    <asp:Parameter Name="tel_1" Type="String" />
                    <asp:Parameter Name="tel_2" Type="String" />
                    <asp:Parameter Name="tel_fax" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="co_notes" Type="String" />
                    <asp:Parameter Name="created_by" Type="Int32" />
                    <asp:Parameter Name="date_created" Type="DateTime" />
                    <asp:Parameter Name="last_amended_by" Type="Int32" />
                    <asp:Parameter Name="date_last_amended" Type="DateTime" />
                </InsertParameters>
            </asp:ObjectDataSource>
            &nbsp;
        </div>
        <div class="button_right" style="padding-left: 340px; padding-top: 20px">
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
    <script>
        document.getElementById("ctl00_ContentPlaceHolder_tbOrderSMS").disabled = true;
    </script>

</asp:Content>
