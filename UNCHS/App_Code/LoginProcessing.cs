using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections;
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

    public bool Process(Page page,ref int loggedInUserId, ref int loggedInUserCoId, ref string loggedInUserRole)
    {
        bool authenticated = false;
        if (bool.Parse(ConfigurationSettings.AppSettings["UseFormsAuthentication"]) == false)
        {
            if (HttpContext.Current.Session[WebConstants.Session.USER_ID] == null)
            {
                HttpContext.Current.Response.Redirect("~/Login.aspx?" + WebConstants.Request.SESSION_EXPIRED + "=true");
            }
            else
            {
                loggedInUserId = (int)HttpContext.Current.Session[WebConstants.Session.USER_ID];
                authenticated = true;
            }
        }
        else 
        {
            if (page.User.Identity.IsAuthenticated)
            {
                UserTableAdapters.un_co_user_detailsTableAdapter ta = new UserTableAdapters.un_co_user_detailsTableAdapter();
                DataTable dtUsers = ta.GetUserByLogonName(page.User.Identity.Name,null);
                if(dtUsers.Rows.Count != 1)
                {
                    //if there are no users with the user id ... or there are more then one user
                    HttpContext.Current.Response.Redirect("~/Login.aspx?" + WebConstants.Request.SESSION_EXPIRED + "=true");
                }
                else
                {
                    //there is only one row
                    loggedInUserId = (int)dtUsers.Rows[0]["user_id"];
                    authenticated = true;
                }
            }
            else
            {
                HttpContext.Current.Response.Redirect("~/Login.aspx?" + WebConstants.Request.SESSION_EXPIRED + "=true");
            }
        }
        if(authenticated)
        {
            
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
                    loggedInUserRole = WebConstants.Roles.User;
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
