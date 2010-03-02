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
<body class="yui-skin-sam" style="background-image:url('Images/Background_design_light.jpg');">
    <form id="form1" runat="server">

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
    </div>	    <div id="login_center">
		    <div id="main">
			    <div id="login_content" >				
                    <div class="field"><span>User Name:</span><asp:TextBox ID="tbUserName" runat="server" Width="150px"></asp:TextBox></div>
                    <div class="field"><span>Password:</span><asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox></div>
                    <div class="button_bar"><asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /></div>                                        
                    <hr />
                    <asp:Label ID="lblError" runat="server" Text="Invalid User Name / Password" Visible="false" CssClass="error"></asp:Label>
                </div>               
            </div>
	     <!-- This template ist Open Source as long as the footer links to the authors are included ! -->
	    </div>
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
	<div id="footer">ULTRA NOVA CODING LTD.</div>
</body>
</html>
