using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for VerifyLoginPage
/// </summary>
public abstract class VerifyLoginPage : System.Web.UI.Page
{
    private Company.un_co_detailsRow company = null;
    protected int loggedInUserId = 0;
    protected int loggedInUserCoId = 0;
    protected string loggedInUserRole = null;

    protected abstract void AfterLoginVerifiedProcessing(object sender, EventArgs e);

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        SetErrorMessage("");
        SetInfoMessage("");
        if (Session[WebConstants.Session.USER_ID] == null)
        {
            //Session[WebConstants.Session.USER_ID] = 1;
            //Session[WebConstants.Session.USER_CO_ID] = 1;
            //Page_Load_Extended(sender, e);
            Response.Redirect("~/Login.aspx?" + WebConstants.Request.SESSION_EXPIRED + "=true");
        }
        else
        {
            loggedInUserId = (int)Session[WebConstants.Session.USER_ID];
            if (Cache[loggedInUserId.ToString()] == null || Cache[loggedInUserId.ToString()].Equals(Request.UserHostAddress) == false)
            {
                Response.Redirect("~/Login.aspx?" + WebConstants.Request.INVALID_CACHE + "=true");
            }
            else
            {
                if (Session[WebConstants.Session.USER_CO_ID] != null)
                {
                    loggedInUserCoId = (int)Session[WebConstants.Session.USER_CO_ID];
                }
                else
                {
                    //Admin roles dont need a co. 
                    loggedInUserCoId = 0;
                }

                if (Session[WebConstants.Session.USER_ROLE] == null)
                {
                    loggedInUserRole = WebConstants.Roles.User;
                }
                else
                {
                    loggedInUserRole = (string)Session[WebConstants.Session.USER_ROLE];
                }
                AfterLoginVerifiedProcessing(sender, e);
            }
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
    private void SetMessage(string msg, string control)
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
            Session[WebConstants.Session.COMPANY_NAME] = company.co_name_long;
        }
        return company;
    }

}
