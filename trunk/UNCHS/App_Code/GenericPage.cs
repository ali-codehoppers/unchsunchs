using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Specialized;
using System.Linq;

/// <summary>
/// Summary description for GenericPage
/// </summary>
public abstract class GenericPage : System.Web.UI.Page
{
    public static NameValueCollection AppSettings = System.Configuration.ConfigurationManager.AppSettings;
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

    protected override void OnLoad(EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        SetErrorMessage("");
        SetInfoMessage("");

        Simplicity.Data.SimplicityEntities DatabaseContext = new Simplicity.Data.SimplicityEntities();
        if (User.Identity.IsAuthenticated)
        {
            Simplicity.Data.Session session = (from s in DatabaseContext.Sessions where s.SessionUID == User.Identity.Name select s).FirstOrDefault();
            if (session != null && session.User != null)
            {
                session.LastActivityTime = DateTime.Now;
                session.EndTime = DateTime.Now.AddMinutes(30);
                session.IP = Request.UserHostAddress;
                session.ProductID = int.Parse(AppSettings["HSProductIDInSimplicity"]);
                DatabaseContext.SaveChanges();
            }
        }

        base.OnLoad(e);
    }
}
