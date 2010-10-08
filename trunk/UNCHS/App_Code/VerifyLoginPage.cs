using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using Simplicity.Data;
using System.Linq;
using System.Collections;

/// <summary>
/// Summary description for VerifyLoginPage
/// </summary>
public abstract class VerifyLoginPage : GenericPage
{
    private Company.un_co_detailsRow company = null;
    protected int loggedInUserId = 0;
    protected int loggedInUserCoId = 0;
    protected string loggedInUserRole = null;

    protected abstract void AfterLoginVerifiedProcessing(object sender, EventArgs e);    

    protected void Page_Load(object sender, EventArgs e)
    {
        Process(); 
        AfterLoginVerifiedProcessing(sender, e);
    }

    private void Process()
    {
        if (User.Identity.IsAuthenticated)
        {
            SimplicityEntities databaseContext = new SimplicityEntities();
            Simplicity.Data.Session session = (from ses in databaseContext.Sessions where ses.SessionUID == User.Identity.Name select ses).FirstOrDefault();
            Session[WebConstants.Session.USER_ID] = session.User.UserID;
            Session[WebConstants.Session.USER_ROLE] = WebConstants.Roles.User;
            loggedInUserRole = WebConstants.Roles.User;
            loggedInUserId = session.User.UserID;
            if (session.User.Company != null)
            {
                Session[WebConstants.Session.SIMPLICITY_COMPANY_ID] = session.User.Company.CompanyID;
                CompanyTableAdapters.un_co_detailsTableAdapter ta = new CompanyTableAdapters.un_co_detailsTableAdapter();
                IEnumerator<Company.un_co_detailsRow> ie = ta.GetBySimplicityID(session.User.Company.CompanyID).GetEnumerator();
                if (ie.MoveNext())
                {
                    Session[WebConstants.Session.USER_CO_ID] = ie.Current.co_id;
                    Session[WebConstants.Session.COMPANY_NAME] = ie.Current.co_name_long;
                    loggedInUserCoId = ie.Current.co_id;
                }
                else
                {
                    Response.Redirect(AppSettings["SimplicityErrorURL"] + "?" + "message" + "=You have no company assigned. Please contact administrator");
                }
            }
            else
            {
                Response.Redirect(AppSettings["SimplicityErrorURL"] + "?" + "message" + "=You have no company assigned. Please contact administrator");
            }
        }
        else
        {
            Response.Redirect(AppSettings["LoginURL"] + "?" +WebConstants.Request.SESSION_EXPIRED + "=true");
        }
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
