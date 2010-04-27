using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request[WebConstants.Request.SESSION_EXPIRED] != null)
        {
            lblError.Visible = true;
            lblError.Text = WebConstants.Messages.Error.SESSION_EXPIRED;
        }
        else if (Request[WebConstants.Request.INVALID_CACHE] != null)
        {
            lblError.Visible = true;
            lblError.Text = WebConstants.Messages.Error.INVALID_CACHE;
        }
    }
    private bool TrialExpired(int coId)
    {
        Company.un_co_detailsRow company = DatabaseUtility.GetCompany(coId);
        if (company != null)
        {
            if (company.Istrial_end_dateNull())
            {
                return false;
            }
            else if (DateTime.Today < company.trial_end_date)
            {
                return false;
            }
        }
        return true;
    }    
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        
        UserTableAdapters.un_co_user_detailsTableAdapter tableAdapter = new UserTableAdapters.un_co_user_detailsTableAdapter();
        IEnumerator iEnumerator = tableAdapter.UserLogin(tbUserName.Text,Utility.GetMd5Sum(tbPassword.Text)).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            User.un_co_user_detailsRow dataRow = (User.un_co_user_detailsRow)iEnumerator.Current;
            if (TrialExpired(dataRow.co_id))
            {
                pnlTrialError.Visible = true;
            }
            else
            {

                Session[WebConstants.Session.USER_ID] = dataRow.user_id;
                Session[WebConstants.Session.USER_ROLE] = dataRow.role;
                if (dataRow.Isco_idNull() == false)
                {
                    Session[WebConstants.Session.USER_CO_ID] = dataRow.co_id;
                }

                if (Cache[dataRow.user_id.ToString()] != null && Cache[dataRow.user_id.ToString()].Equals(Request.UserHostAddress) == false)
                {
                    lblIP.Text = Request.UserHostAddress;
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "ConfirmationDialog", "<script>YAHOO.util.Event.onDOMReady(showConfirmationDialog);</script>");
                }
                else
                {
                    handleSuccessfulLogin(dataRow.user_id, dataRow.role);
                }
            }
        }
        else
        {
            lblError.Visible = true;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Clear();
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        handleSuccessfulLogin((int)Session[WebConstants.Session.USER_ID], (string)Session[WebConstants.Session.USER_ROLE]);
    }
    private void handleSuccessfulLogin(int userId,string role)
    {
        TimeSpan SessTimeOut = new TimeSpan(0, 0, HttpContext.Current.Session.Timeout, 0, 0);
        Cache.Insert(userId.ToString(), Request.UserHostAddress, null, DateTime.MaxValue, SessTimeOut, System.Web.Caching.CacheItemPriority.NotRemovable, null);        
        if (role.Equals(WebConstants.Roles.User))
        {
            Response.Redirect("TermsConditions.aspx");
        }
        else
        {
            Response.Redirect(role + "Home.aspx");
        }
    }
}
