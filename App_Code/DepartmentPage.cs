using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

/// <summary>
/// Summary description for DepartmentPage
/// </summary>
public abstract class DepartmentPage : AuthenticatedPage
{
	public DepartmentPage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    protected abstract void Department_Page_Handling(object sender, EventArgs e);
    protected int firstDepartmentId;
    protected override void Page_Load_Extended(object sender, EventArgs e)
    {
        DepartmentTableAdapters.DepartmentSelectCommandTableAdapter tableAdapter = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
        IEnumerator iEnum = tableAdapter.GetDepartmentsByCoId(loggedInUserCoId).GetEnumerator();
        if (iEnum.MoveNext())
        {
            Department.DepartmentSelectCommandRow dataRow = (Department.DepartmentSelectCommandRow)iEnum.Current;
            firstDepartmentId = dataRow.dept_id;
            Department_Page_Handling(sender, e);
        }
        else
        {
            Response.Redirect("~/Maintenance/AddDepartment.aspx?" + WebConstants.Request.NO_DEPT + "=true");
        }
    }
}
