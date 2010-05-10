using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for AuthenticatedPage
/// </summary>
public abstract class AuthenticatedPage : System.Web.UI.Page
{
    private Company.un_co_detailsRow company = null;
	public AuthenticatedPage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    protected abstract void Page_Load_Extended(object sender, EventArgs e);
    protected int loggedInUserId = 0;
    protected int loggedInUserCoId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {        
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        SetErrorMessage("");
        SetInfoMessage("");
        if (Session[WebConstants.Session.USER_ID] == null || Session[WebConstants.Session.USER_CO_ID] == null)
        {
            //Session[WebConstants.Session.USER_ID] = 1;
            //Session[WebConstants.Session.USER_CO_ID] = 1;
            //Page_Load_Extended(sender, e);
            Response.Redirect("~/Login.aspx?" + WebConstants.Request.SESSION_EXPIRED + "=true");
        }
        else
        {
            loggedInUserId = (int)Session[WebConstants.Session.USER_ID];
            loggedInUserCoId = (int)Session[WebConstants.Session.USER_CO_ID];
            Page_Load_Extended(sender, e);
        }
    }
    protected void SetErrorMessage(string error)
    {
        SetMessage(error, "lblError");
    }
    protected void SetInfoMessage(string info)
    {
        SetMessage(info, "lblInfo");
    }
    private void SetMessage(string msg,string control)
    {
        Label label = (Label)this.Page.Master.FindControl(control);
        label.Visible = true;
        label.Text = msg;
    }
    protected Company.un_co_detailsRow GetCompany()
    {
        if (loggedInUserCoId > 0 && company == null)
        {
            company = DatabaseUtility.GetCompany(loggedInUserCoId);
        }
        return company;
    }
}
