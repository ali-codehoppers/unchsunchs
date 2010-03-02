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

public partial class Maintenance_DocumentList : DepartmentPage
{
    protected override void Department_Page_Handling(object sender, EventArgs e)
    {
        
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {

    }
    protected void btnUpate_Click(object sender, EventArgs e)
    {

    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvDocs.DataBind();
    }
    protected string GetPeopleType(object peopleTypeId)
    {
        if (peopleTypeId.Equals(DBNull.Value))
        {
            return null;
        }
        return peopleTypeId.ToString();
    }
}
