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

public partial class Main : System.Web.UI.MasterPage
{
    protected string helpHTML;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[WebConstants.Session.COMPANY_NAME] != null)
        {
            lblCompany.Text = Session[WebConstants.Session.COMPANY_NAME].ToString();            
        }
        if (Session[WebConstants.Session.USER_CO_ID] != null)
        {
            SetHelp((int)Session[WebConstants.Session.USER_CO_ID]);
        }       
    }
    private void SetHelp(int loggedInUserCoId)
    {
        char[] seperator = new char[1];
        seperator[0] = '/';
        string [] paths = Request.Path.Split(seperator);
        string path = paths[paths.Length - 1];
        ScreensTableAdapters.ScreenTableAdapter screenTA = new ScreensTableAdapters.ScreenTableAdapter();
        IEnumerator ieScreen = screenTA.GetScreenByURL(loggedInUserCoId,path).GetEnumerator();
        if (ieScreen.MoveNext())
        {
            Screens.ScreenEntityRow screenDR = (Screens.ScreenEntityRow)ieScreen.Current;
            //imgHelp.Visible = true;
            helpHTML = screenDR.help_html;
        }
        else
        {
            //imgHelp.Visible = false;
        }
    }

    protected void btnLogout_Click(object sender, ImageClickEventArgs e)
    {
        if (Session[WebConstants.Session.USER_ID] != null)
        {
            Cache.Remove(Session[WebConstants.Session.USER_ID].ToString());
        }
        Session.Clear();
        
        HttpCookie cookie = Request.Cookies["UserLoginSession"];
        if (cookie != null)
        {
            cookie.Expires = DateTime.Now;
        }

        Response.Redirect("~/Login.aspx");

    }
}