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

public partial class Maintenance_DepartmentHazardList : DepartmentPage
{
    protected override void  Department_Page_Handling(object sender, EventArgs e)
    { 	
    }

    private bool isValid(int id)
    {
        //DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter
        DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter tableAdapter = new DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter();
        IEnumerator iEnumerator = tableAdapter.GetDepartmentHazardByName(int.Parse(ddlDepartment.SelectedValue), loggedInUserCoId, tbName.Text,id).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
            return false;
        }
        return true;
    }

    private DepartmentHazard.DepartmentHazardSelectCommandRow getDepartmentPerson(int departmentPersonId)
    {
        DepartmentHazard.DepartmentHazardSelectCommandRow dataRow = null;
        DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter tableAdapter = new DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter();
        IEnumerator iEnumerator = tableAdapter.GetDepartmentHazardById(departmentPersonId, loggedInUserCoId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (DepartmentHazard.DepartmentHazardSelectCommandRow)iEnumerator.Current;
        }
        return dataRow;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (isValid(0))
        {
            DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter tableAdapter = new DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter();
            tableAdapter.Insert(int.Parse(ddlDepartment.SelectedValue), loggedInUserCoId, tbName.Text, loggedInUserId, int.Parse(ddlCategory.SelectedValue),cbDefault.Checked);
            repeater.DataBind();
            SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        }
        //lbl
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string[] idList = Request["idOrdering"].Split(',');
        if (idList != null)
        {
            //-i because we have an extra comma at the end
            for (int i = 0; i < idList.Length - 1; i++)
            {
                DepartmentHazard.DepartmentHazardSelectCommandRow dataRow = getDepartmentPerson(int.Parse(idList[i]));
                if (dataRow != null)
                {
                    DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter tableAdapter = new DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter();
                    tableAdapter.Update(dataRow.dept_id, dataRow.name_desc, i + 1, loggedInUserId, dataRow.sequence, dataRow.category_id,dataRow.flg_default);
                }
            }
        }
        SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        repeater.DataBind();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Home.aspx");
    }
    protected void btnUpate_Click(object sender, EventArgs e)
    {
        int id = int.Parse(hfDeptPersonId.Value);
        if (isValid(id))
        {
            DepartmentHazard.DepartmentHazardSelectCommandRow dataRow = getDepartmentPerson(id);
            if (dataRow != null)
            {
                DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter tableAdapter = new DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter();
                tableAdapter.Update(int.Parse(ddlDepartment.SelectedValue), tbName.Text, dataRow.index_seq, loggedInUserId, dataRow.sequence, int.Parse(ddlCategory.SelectedValue),cbDefault.Checked);
                repeater.DataBind();
                SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
            }
            btnAdd.Visible = true;
            btnUpate.Visible = false;
            tbName.Text = "";
        }
    }
    protected void repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("Edit"))
        {
            DepartmentHazard.DepartmentHazardSelectCommandRow dataRow = getDepartmentPerson(int.Parse(e.CommandArgument.ToString()));
            if (dataRow != null)
            {
                tbName.Text = dataRow.name_desc;
                ddlDepartment.SelectedValue = dataRow.dept_id.ToString();
                ddlCategory.SelectedValue = dataRow.category_id.ToString();
                cbDefault.Checked = dataRow.flg_default;
                btnAdd.Visible = false;
                btnUpate.Visible = true;
                hfDeptPersonId.Value = e.CommandArgument.ToString();
            }
        }
        else if (e.CommandName.Equals("Delete"))
        {
            DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter tableAdapter = new DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter();
            tableAdapter.Delete(int.Parse(e.CommandArgument.ToString()), loggedInUserId);
            repeater.DataBind();
            SetInfoMessage(WebConstants.Messages.Information.RECORD_DELETED);
        }
    }
}
