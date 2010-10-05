using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for VerifyLoginPage
/// </summary>
public abstract class VerifyLoginPage : TempGenericPage
{
    private Company.un_co_detailsRow company = null;
    protected int loggedInUserId = 0;
    protected int loggedInUserCoId = 0;
    protected string loggedInUserRole = null;

    protected abstract void AfterLoginVerifiedProcessing(object sender, EventArgs e);

    protected void Page_Load(object sender, EventArgs e)
    {
        LoginProcessing processing = new LoginProcessing();
        if (processing.Process(ref loggedInUserId, ref loggedInUserCoId, ref loggedInUserRole))
        {
            AfterLoginVerifiedProcessing(sender, e);
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
