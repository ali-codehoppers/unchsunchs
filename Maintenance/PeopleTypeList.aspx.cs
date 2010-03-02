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

public partial class Maintenance_PeopleTypeList : AuthenticatedPage
{
    protected override void Page_Load_Extended(object sender, EventArgs e)
    {
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        PeopleTypeTableAdapters.PeopleTypeTableAdapter ta = new PeopleTypeTableAdapters.PeopleTypeTableAdapter();
        if (isValid(tbPeopleType.Text, 0))
        {
            ta.Insert(loggedInUserCoId, tbPeopleType.Text, cbMultiple.Checked, false);
            gvPeopleTypes.DataBind();
        }
    }
    private bool isValid(string peopleType,int peopleTypeId)
    {
        PeopleTypeTableAdapters.PeopleTypeTableAdapter ta = new PeopleTypeTableAdapters.PeopleTypeTableAdapter();
        if(ta.GetPeopleTypeByName(loggedInUserCoId, peopleType, peopleTypeId).GetEnumerator().MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
            return false;
        }
        return true;
    }
    protected void gvPeopleTypes_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if(isValid((string)e.NewValues["people_type"],(int)e.Keys["people_type_id"]) == false)
        {        
            e.Cancel = true;
        }      
    }
}
