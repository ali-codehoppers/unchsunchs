<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="~/Common/StyleSheets/layout.css" />
</head>
<body>
    <form id="form1" runat="server">
	    <div id="login_center">
		    <div id="main">
			    <div id="login_content">				
                    <div class="field"><span>User Name:</span><asp:TextBox ID="tbUserName" runat="server" Width="150px"></asp:TextBox></div>
                    <div class="field"><span>Password:</span><asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox></div>
                    <div class="button_bar"><asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /></div>                                        
                    <hr />
                    <asp:Label ID="lblError" runat="server" Text="Invalid User Name / Password" Visible="false" CssClass="error"></asp:Label>
                </div>               
            </div>
	     <!-- This template ist Open Source as long as the footer links to the authors are included ! -->
	    </div>
	</form>
	<div id="footer">ULTRA NOVA CODING LTD.</a></div>
</body>
</html>
