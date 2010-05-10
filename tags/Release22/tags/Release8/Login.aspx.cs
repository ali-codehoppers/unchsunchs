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
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        UserTableAdapters.un_co_user_detailsTableAdapter tableAdapter = new UserTableAdapters.un_co_user_detailsTableAdapter();
        IEnumerator iEnumerator = tableAdapter.UserLogin(tbUserName.Text, tbPassword.Text).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            User.un_co_user_detailsRow dataRow = (User.un_co_user_detailsRow)iEnumerator.Current;
            Session[WebConstants.Session.USER_ID] = dataRow.user_id;
            Session[WebConstants.Session.USER_CO_ID] = dataRow.co_id;
            Response.Redirect("Home.aspx");
        }
        else
        {
            lblError.Visible = true;            
        }
    }
}
