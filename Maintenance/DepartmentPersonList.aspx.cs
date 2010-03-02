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

public partial class Maintenance_DepartmentPersonList : DepartmentPage
{
    DataTable peopleList;
    protected override void Department_Page_Handling(object sender, EventArgs e)
    {
        btnAdd.Visible = true;
        btnUpate.Visible = false;
    }

    private void LoadPeopleList(string personName)
    {
        DepartmentPersonTableAdapters.DepartmentPeopleTableAdapter ta = new DepartmentPersonTableAdapters.DepartmentPeopleTableAdapter();
        peopleList = ta.GetDeptPeopleByName(loggedInUserCoId, int.Parse(ddlDepartment.SelectedValue), personName);
        if (peopleList != null && peopleList.Rows.Count > 0)
        {
            tbName.Text = personName;
            btnAdd.Visible = false;
            btnUpate.Visible = true;
        }
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SavePeople(false);
    }

    private bool IsValid(bool isUpdate,DepartmentPersonTableAdapters.DepartmentPeopleTableAdapter ta,int deptId)
    {
        int checkCount = 0;
        foreach (RepeaterItem item in rptPeopleType.Items)
        {
            CheckBox cb = (CheckBox)item.FindControl("cbPeopleType");
            if (cb.Checked)
            {
                checkCount++;
            }
        }
        if (checkCount == 0)
        {
            SetErrorMessage(WebConstants.Messages.Error.SELECT_ATLEAST_ONE_PERSON_TYPE);
            return false;
        }
        if(isUpdate)
        {
            if(tbName.Text.Equals(hfPersonName.Value) == false)
            {
                if(ta.GetDeptPeopleByName(loggedInUserCoId,deptId,tbName.Text).Rows.Count > 0)
                {
                    SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
                    return false;
                }
            }
        }
        else
        {
            if(ta.GetDeptPeopleByName(loggedInUserCoId,deptId,tbName.Text).Rows.Count > 0)
            {
                SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
                return false;
            }
        }
        return true;
    }

    private void SavePeople(bool isUpdate)
    {
        DepartmentPersonTableAdapters.DepartmentPeopleTableAdapter ta = new DepartmentPersonTableAdapters.DepartmentPeopleTableAdapter();
        int deptId = int.Parse(ddlDepartment.SelectedValue);
        if(IsValid(isUpdate,ta,deptId))
        {
            if(isUpdate)
            {
                ta.DeleteByName(loggedInUserCoId, deptId, hfPersonName.Value);
            }
            foreach (RepeaterItem item in rptPeopleType.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("cbPeopleType");
                if (cb.Checked)
                {
                    int peopleTypeId = int.Parse(((HiddenField)item.FindControl("hfPeopleTypeId")).Value);
                    ta.Insert(false, deptId, loggedInUserCoId, 1, peopleTypeId, tbName.Text);
                    cb.Checked = false;
                }
            }
            tbName.Text = "";
            gvPeople.DataBind();
            SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Maintenance/DepartmentPersonList.aspx");        
    }
    protected void btnUpate_Click(object sender, EventArgs e)
    {
        SavePeople(true);
    }
    protected void rptPeopleType_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (peopleList != null)
        {
            foreach (DataRow row in peopleList.Rows)
            {                
                CheckBox cb = (CheckBox)e.Item.FindControl("cbPeopleType");
                int peopleTypeId = int.Parse(((HiddenField)e.Item.FindControl("hfPeopleTypeId")).Value);
                if (peopleTypeId == (int)row["people_type_id"])
                {
                    cb.Checked = true;
                }
            }
        }
    }
    protected void ddlDepartment_DataBound(object sender, EventArgs e)
    {

    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        rptPeopleType.DataBind();
    }
    protected void gvPeople_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "DeletePerson":
                sdsDepartmentPerson.DeleteParameters["people_name"].DefaultValue = (string)e.CommandArgument;
                sdsDepartmentPerson.Delete();
                break;            
            case "EditPerson":
                hfPersonName.Value = (string)e.CommandArgument;
                LoadPeopleList((string)e.CommandArgument);
                rptPeopleType.DataBind();
                break;
        }
    }
}
