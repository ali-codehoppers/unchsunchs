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
using System.Collections.Generic;

public partial class Orders_AddOrderPeople : OrderDetailPage
{
    private Dictionary<string, List<string>> orderPeople = new Dictionary<string, List<string>>();
    string[] headerTexts = null;

    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        DepartmentOrderPersonTableAdapters.DepartmentOrderPeopleTableAdapter ta = new DepartmentOrderPersonTableAdapters.DepartmentOrderPeopleTableAdapter();
        IEnumerator iEnum = ta.GetAllDepartmentPeople(loggedInUserCoId, departmentId, orderId).GetEnumerator();
        while (iEnum.MoveNext())
        {
            DepartmentOrderPerson.DepartmentOrderPeopleEntityRow person = (DepartmentOrderPerson.DepartmentOrderPeopleEntityRow)iEnum.Current;
            if(orderPeople.ContainsKey(person.people_name) == false)
            {
                orderPeople.Add(person.people_name, new List<string>());
            }
            List<string> peopleTypes = orderPeople[person.people_name];
            peopleTypes.Add(person.people_type);
        }
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

    private string[] GetHeaderTexts()
    {
        if (headerTexts == null)
        {
            headerTexts = new string[gvPeople.HeaderRow.Cells.Count];
            int index = 0;
            foreach (DataControlFieldHeaderCell cell in gvPeople.HeaderRow.Cells)
            {
                foreach (Control control in cell.Controls)
                {
                    if (control is LinkButton)
                    {
                        LinkButton lb = (LinkButton)control;
                        headerTexts[index++] = lb.Text;
                    }
                }
            }
        }
        return headerTexts;
    }
    private bool Save()
    {
        //i = 1 as the first column People Name
        string[] headerTexts = GetHeaderTexts();
        int[] peopleTypeCount = new int[headerTexts.Length];
        foreach (GridViewRow gr in gvPeople.Rows)
        {
            for (int i = 1; i < gr.Cells.Count; i++)
            {
                foreach (Control control in gr.Cells[i].Controls)
                {
                    if (control is CheckBox)
                    {
                        CheckBox cb = (CheckBox)control;
                        if (cb.Checked)
                        {
                            peopleTypeCount[i]++;
                        }
                    }
                }
            }
        }
        for (int i = 1; i < headerTexts.Length; i++)
        {
            PeopleTypeTableAdapters.PeopleTypeTableAdapter pplTA = new PeopleTypeTableAdapters.PeopleTypeTableAdapter();
            IEnumerator iEnum = pplTA.GetPeopleTypeByName(loggedInUserCoId, headerTexts[i], 0).GetEnumerator();
            if(iEnum.MoveNext())
            {
                PeopleType.PeopleTypeEntityRow peopleType = (PeopleType.PeopleTypeEntityRow)iEnum.Current;
                if (peopleType.flg_multiple == false && peopleTypeCount[i] > 1)
                {
                    SetErrorMessage("Cannot have more than one " + headerTexts[i] + " on one Folder");
                    return false;
                }
            }
        }

        DepartmentOrderPersonTableAdapters.DepartmentOrderPeopleTableAdapter ta = new DepartmentOrderPersonTableAdapters.DepartmentOrderPeopleTableAdapter();
        ta.Delete(orderId);
        //since grid can not be databound always, we need to get header text here from the grid again and not the variable
        
        foreach (GridViewRow gr in gvPeople.Rows)
        {
            for (int i = 1; i < gr.Cells.Count; i++)
            {
                foreach (Control control in gr.Cells[i].Controls)
                {
                    if (control is CheckBox)
                    {
                        CheckBox cb = (CheckBox)control;
                        if (cb.Checked)
                        {
                            ta.Insert(false, departmentId, loggedInUserCoId, orderId, gr.Cells[0].Text, headerTexts[i]);
                        }
                    }
                }
            }
        }
        /*int supervisorcount = 0;
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
        }*/
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
    protected void gvPeople_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            headerTexts = new string[e.Row.Cells.Count];
            int index = 0;
            foreach (DataControlFieldHeaderCell cell in e.Row.Cells)
            {
                foreach (Control control in cell.Controls)
                {
                    if (control is LinkButton)
                    {
                        LinkButton lb = (LinkButton)control;
                        headerTexts[index++] = lb.Text;
                    }
                }
            }
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //iterating over controls, each control is basically a TD. 
            for (int i = 1; i < e.Row.Cells.Count; i++)
            {
                foreach (Control control in e.Row.Cells[i].Controls)
                {
                    if (control is CheckBox)
                    {
                        CheckBox cb = (CheckBox)control;
                        if (!cb.Checked)
                        {
                            cb.Visible = false;
                        }
                        else
                        {
                            string personName = e.Row.Cells[0].Text;
                            string personType = headerTexts[i];
                            cb.Enabled = true;
                            cb.Checked = false;
                            if (orderPeople.ContainsKey(personName))
                            {
                                if (orderPeople[personName].Contains(personType))
                                {
                                    cb.Checked = true;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
