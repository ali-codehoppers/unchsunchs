using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SimplicityCommLib;

/// <summary>
/// Summary description for LoginProcessing
/// </summary>
public class LoginProcessing
{
	public LoginProcessing()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public bool Process(ref int loggedInUserId, ref int loggedInUserCoId, ref string loggedInUserRole)
    {
        if (HttpContext.Current.Session[WebConstants.Session.USER_ID] == null)
        {
            //Session[WebConstants.Session.USER_ID] = 1;
            //Session[WebConstants.Session.USER_CO_ID] = 1;
            //Page_Load_Extended(sender, e);
            HttpContext.Current.Response.Redirect("~/Login.aspx?" + WebConstants.Request.SESSION_EXPIRED + "=true");
        }
        else
        {
            loggedInUserId = (int)HttpContext.Current.Session[WebConstants.Session.USER_ID];
            if (HttpContext.Current.Cache[loggedInUserId.ToString()] == null || HttpContext.Current.Cache[loggedInUserId.ToString()].Equals(HttpContext.Current.Request.UserHostAddress) == false)
            {
                HttpContext.Current.Response.Redirect("~/Login.aspx?" + WebConstants.Request.INVALID_CACHE + "=true");
            }
            else
            {
                if (HttpContext.Current.Session[WebConstants.Session.USER_CO_ID] != null)
                {
                    loggedInUserCoId = (int)HttpContext.Current.Session[WebConstants.Session.USER_CO_ID];
                }
                else
                {
                    //Admin roles dont need a co. 
                    loggedInUserCoId = 0;
                }

                if (HttpContext.Current.Session[WebConstants.Session.USER_ROLE] == null)
                {
                    loggedInUserRole = Constants.Roles.User;
                }
                else
                {
                    loggedInUserRole = (string)HttpContext.Current.Session[WebConstants.Session.USER_ROLE];
                }
                return true;
            }
        }
        return false;
    }
}
