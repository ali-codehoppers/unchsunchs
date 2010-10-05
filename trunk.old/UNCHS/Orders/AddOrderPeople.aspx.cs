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

public partial class Orders_AddOrderPeople : OrderDetailPage
{

    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        hfDeptId.Value = deptId.ToString();
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (Save())
        {
            Response.Redirect("~/Orders/AddOrderHazard.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
    }
    protected void btnSaveAll_Click(object sender, EventArgs e)
    {
        Save();
    }
    private bool Save()
    {
        int supervisorcount = 0;
        Company.un_co_detailsRow company = GetCompany();
        if (!(company != null && company.Isflg_multi_supervisorsNull() == false && company.flg_multi_supervisors == true))
        {
        foreach (GridViewRow row in gvPeople.Rows)
        {
            CheckBox flg_supervisor_chkbox1 = (CheckBox)(row.FindControl("chkboxSupervisor"));
            if (flg_supervisor_chkbox1.Checked == true)
            {
                supervisorcount++;
            }
            if (supervisorcount > 1)
            {
                SetErrorMessage(WebConstants.Messages.Error.SUPERVISOR_SELECTION_ERROR);
                return false;
            }
        }
        }
        DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter tableAdaptor = new DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter();
        tableAdaptor.DeleteExistingOrderPersonCommand(int.Parse(Request.QueryString["deptOrderId"].ToString()));

        foreach (GridViewRow row in gvPeople.Rows)
        {
            string name_desc = "";
            bool flg_supervisor = false;
            bool flg_fire_warden = false;
            bool flg_first_aider = false;

            name_desc = row.Cells[0].Text;
            CheckBox flg_supervisor_chkbox = (CheckBox)(row.FindControl("chkboxSupervisor"));
            flg_supervisor = flg_supervisor_chkbox.Checked;
            CheckBox flg_fire_warden_chkbox = (CheckBox)(row.FindControl("chkboxFireWarden"));
            flg_fire_warden = flg_fire_warden_chkbox.Checked;
            CheckBox flg_first_aider_chkbox = (CheckBox)(row.FindControl("chkboxFirstAider"));
            flg_first_aider = flg_first_aider_chkbox.Checked;

            tableAdaptor.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request.QueryString["deptOrderId"].ToString()), name_desc, loggedInUserId, flg_supervisor, flg_first_aider, flg_fire_warden, false);
            SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        }
        return true;
    }
    public bool GetChecked(string returned)
    {
        if (returned == "" || returned == "0")
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    public string GetClassName(bool enabled)
    {
        return (enabled) ? "disabled_checkbox" : "";
    }
    protected void gvPeople_DataBound(object sender, EventArgs e)
    {
        Company.un_co_detailsRow dataRow = GetCompany();
        if (dataRow != null)
        {
            if (dataRow.Issupervisor_labelNull() == false)
            {
                gvPeople.Columns[1].HeaderText = dataRow.supervisor_label + "?";
            }
            if (dataRow.Isfirst_aider_labelNull() == false)
            {
                gvPeople.Columns[2].HeaderText = dataRow.first_aider_label + "?";
            }
            if (dataRow.Isfire_warden_labelNull() == false)
            {
                gvPeople.Columns[3].HeaderText = dataRow.fire_warden_label + "?";
            }
        }
    }
}
