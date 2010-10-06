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
                    if (HttpContext.Current.Cache[loggedInUserId.ToString()] == null)
                    {
                        HandlePostLoginProcess(loggedInUserId, (string)dtUsers.Rows[0]["role"], (int)dtUsers.Rows[0]["co_id"]);
                    }
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

    public void HandlePostLoginProcess(int userId, string role, int coId)
    {
        TimeSpan SessTimeOut = new TimeSpan(0, 0, HttpContext.Current.Session.Timeout, 0, 0);
        HttpContext.Current.Cache.Insert(userId.ToString(), HttpContext.Current.Request.UserHostAddress, null, DateTime.MaxValue, SessTimeOut, System.Web.Caching.CacheItemPriority.NotRemovable, null);
        Company.un_co_detailsRow company = DatabaseUtility.GetCompany(coId);
        if (company != null && company.flg_show_wizard)
        {
            HttpContext.Current.Session[WebConstants.Session.REG_CO_ID] = company.co_id;
            HttpContext.Current.Session[WebConstants.Session.REG_USER_ID] = userId;
            DepartmentTableAdapters.DepartmentSelectCommandTableAdapter deptTA = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
            IEnumerator ie = deptTA.GetDepartmentsByCoId(coId).GetEnumerator();
            if (ie.MoveNext())
            {
                Department.DepartmentSelectCommandRow department = (Department.DepartmentSelectCommandRow)ie.Current;
                HttpContext.Current.Session[WebConstants.Session.REG_DEPT_ID] = department.dept_id;
            }
            if (company.Isflg_trialNull() == true || company.flg_trial == false)
            {
                company.trial_start_date = DateTime.Today;
                company.flg_trial = true;
                company.trial_num_of_days = 15;
                company.trial_end_date = Utility.GetTrialEndDate(DateTime.Today, 15);
                CompanyTableAdapters.un_co_detailsTableAdapter coTA = new CompanyTableAdapters.un_co_detailsTableAdapter();
                coTA.Update(company);
            }
            HttpContext.Current.Response.Redirect("~/Register/AddCompany.aspx");
        }
        else if (role.Equals(WebConstants.Roles.User))
        {
            HttpContext.Current.Response.Redirect("TermsConditions.aspx");
        }
        else
        {
            HttpContext.Current.Response.Redirect(role + "Home.aspx");
        }
    }
}
