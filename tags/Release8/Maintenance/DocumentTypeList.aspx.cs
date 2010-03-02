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

public partial class Maintenance_DocumentTypeList : DepartmentPage
{
    protected override void Department_Page_Handling(object sender, EventArgs e)
    {
        
    }
    
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvDocTypes.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter ta = new DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter();
        ta.Insert(tbDesc.Text, loggedInUserCoId, int.Parse(ddlDepartment.SelectedValue),int.Parse(tbSortOrder.Text),"custom","CustomGenerator",
            cbReqd.Checked, tbStyle.Text, false,fileContents.FileBytes);
        SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
    }
}
