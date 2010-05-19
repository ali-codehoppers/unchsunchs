using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using SimplicityCommLib;

/// <summary>
/// Summary description for AdminPage
/// </summary>
public abstract class AdminPage : TempAuthenticatedPage
{
	public AdminPage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    protected override void Page_Load_Extended(object sender, EventArgs e)
    {
        if (loggedInUserRole != null && loggedInUserRole.Equals(Constants.Roles.Admin))
        {
            AdminPageHandling(sender,e);
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    abstract protected void AdminPageHandling(object sender, EventArgs e);
}
