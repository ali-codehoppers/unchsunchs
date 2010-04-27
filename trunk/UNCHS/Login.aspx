<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="~/Common/StyleSheets/layout.css" />

	<link rel="stylesheet" type="text/css" href="Includes/yui/build/fonts/fonts-min.css" />
    <link rel="stylesheet" type="text/css" href="Includes/yui/build/container/assets/skins/sam/container.css" />
    
	<script type="text/javascript" src="Includes/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
	<script type="text/javascript" src="Includes/yui/build/container/container_core.js"></script>
    <script type="text/javascript" src="Includes/yui/build/yahoo/yahoo-min.js" ></script>
    <script type="text/javascript" src="Includes/yui/build/event/event-min.js" ></script>
    <script type="text/javascript" src="Includes/yui/build/container/container-min.js"></script>
    <script type="text/javascript">
        var confirmationDialog;
        function showConfirmationDialog() {
            document.getElementById("confirmationDialog").style.display = 'block';
            confirmationDialog.show();           
        }
    </script>
    
</head>
<body class="yui-skin-sam">
    <form id="form1" runat="server" defaultbutton="btnLogin">

    <div id="confirmationDialog" style="display:none">
        <div class="hd">
            Already Logged In</div>
        <div class="bd" >
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/error.png"/>
                    </td>
                    <td class="error_thin">
                        You are already logged in from IP <asp:Label ID="lblIP" runat="server" Text=""></asp:Label>.<br />
                        Press <b>Continue</b> to continue login. This will invalidate your other session. <br />
                        Press <b>Cancel</b> to abort the login process from this machine. 
                    </td>
                </tr>
            </table>
       </div>
        <div class="ft" style="text-align:right">
            
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                <asp:Button ID="btnContinue" runat="server" Text="Continue" OnClick="btnContinue_Click" />
            
        </div>
    </div>	    
        <table border="0" width="100%" style="height:100%">
        <tr>
        <td valign="bottom" align="center">
        <div class="loginBox">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/small_logo.png"/>
                        <div class="field" style="margin-top:20px"><span>User Name:</span><asp:TextBox ID="tbUserName" runat="server" Width="250px"></asp:TextBox></div>
                        <div class="field" style="margin-top:20px">
                            <div style="float:left"><span>Password:</span><asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Width="250px"></asp:TextBox></div>
                            <div style="float:left;margin-left:20px;"><asp:ImageButton ID="btnLogin" runat="server" OnClick="btnLogin_Click" ImageUrl="~/Images/Login.gif" onmouseover="this.src='Images/Login_rollover.gif'" onmouseout="this.src='Images/Login.gif'"/></div>
                            <div style="clear:both"></div>
                        </div>                   
            
                        <asp:Label ID="lblError" runat="server" Text="Invalid User Name / Password" Visible="false" CssClass="error"></asp:Label>
                        <asp:Panel ID="pnlTrialError" runat="server" Visible="false">
                            <asp:Label ID="Label1" runat="server" Text="Your trial period has expired." CssClass="error"></asp:Label><br /> 
                            <asp:Label ID="Label2" runat="server" Text="Please click " CssClass="error"></asp:Label>       
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://simplicity4business-shop.co.uk">here</asp:HyperLink>
                            <asp:Label ID="Label3" runat="server" Text="to purchase your license." CssClass="error"></asp:Label>       
                        </asp:Panel>
                        
                        <div style="margin-top:20px">Forgot your password?</div>
                        <div style="margin-top:20px">Don't have an account? <a href="Register/AddCompany.aspx" >Sign up for Free Trial</a></div>
        </div>
        </td>
        </tr>
        <tr><td>	<div id="footer">ULTRA NOVA CODING LTD.</div>
</td></tr>
        </table>
        <script type="text/javascript">
            // Instantiate the Dialog
            confirmationDialog = new YAHOO.widget.Dialog("confirmationDialog",
						        { width: "600px",
						            fixedcenter: true,
						            close: false,
						            zindex: 3,
						            modal: true,
						            visible: false,
						            constraintoviewport: false,
						            draggable: true
						        });
			confirmationDialog.render();

        </script>
	    
	</form>
	
</body>
</html>
