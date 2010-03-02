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

public partial class Maintenance_DocumentTypePeopleTypeList : DepartmentPage
{
    protected override void Department_Page_Handling(object sender, EventArgs e)
    {
        if (Request[WebConstants.Request.DOC_TYPE_ID] == null || Request[WebConstants.Request.DEPT_ID] == null || Request[WebConstants.Request.DOC_TYPE_NAME] == null)
        {
            Response.Redirect("~/Maintenance/DocumentTypeList.aspx");
        }
        else
        {
            if (IsPostBack == false)
            {
                lblDocType.Text = Request[WebConstants.Request.DOC_TYPE_NAME];
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int deptId = int.Parse(Request[WebConstants.Request.DEPT_ID]);
        int docTypeId = int.Parse(Request[WebConstants.Request.DOC_TYPE_ID]);
        int peopleTypeId = int.Parse(ddlPeopleType.SelectedValue);
        DepartmentOrderDocTableAdapters.DocTypePeopleTypeTableAdapter ta = new DepartmentOrderDocTableAdapters.DocTypePeopleTypeTableAdapter();
        IEnumerator ie = ta.GetByDocTypeId(loggedInUserCoId,deptId,docTypeId).GetEnumerator();
        while(ie.MoveNext())
        {
            DepartmentOrderDoc.DocTypePeopleTypeEntityRow data = (DepartmentOrderDoc.DocTypePeopleTypeEntityRow)ie.Current;
            if(data.people_type_id == peopleTypeId)
            {
                SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
                return;
            }
        }
        ta.Insert(loggedInUserCoId, deptId, docTypeId, peopleTypeId, false);
        gvPeople.DataBind();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Maintenance/DocumentTypeList.aspx");
    }
}
