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
using System.Data.SqlClient;

public partial class Orders_SearchOrder : DepartmentPage
{
    protected override void  Department_Page_Handling(object sender, EventArgs e)
    {
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    protected void DeleteDepartmentOrder(int deptOrderId)
    {

        DataTable department = getDepartmentOrder(deptOrderId);
        if (department == null)
        {
            SetErrorMessage(WebConstants.Messages.Error.INVALID_ID);
        }
        else
        {
            try
            {
                DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter tableAdapter = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
                tableAdapter.Delete(deptOrderId);
                SetInfoMessage(WebConstants.Messages.Information.RECORD_DELETED);
                GridView1.DataBind();
            }
            catch
            {
                SetErrorMessage(WebConstants.Messages.Error.CONNECTION_ERROR);
            }
        }
    }
    private DataTable getDepartmentOrder(int DepartmentOrderId)
    {
        DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter tableAdaptor = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
        DataTable dt = tableAdaptor.GetDepartmentOrderById(DepartmentOrderId);
        return dt;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Cancel = true;
        DeleteDepartmentOrder((int)e.Keys["sequence"]);
    }
    protected void ddlDepartments_DataBound(object sender, EventArgs e)
    {
        if (ddlDepartments.Items.Count <= 1)
        {
            ddlDepartments.Visible = false;
            lblDepartment.Visible = false;
        }
        else
        {
            ddlDepartments.Visible = true;
            lblDepartment.Visible = true;
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int orderId = int.Parse(e.CommandArgument.ToString());
        DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter ta = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
        if (e.CommandName.Equals("CancelOrder"))
        {
            ta.UpdateCancel(loggedInUserId,orderId,true,DateTime.Now);
            SetInfoMessage(WebConstants.Messages.Information.ORDER_CANCELLED);
        }
        else if (e.CommandName.Equals("UncancelOrder"))
        {
            ta.UpdateCancel(loggedInUserId,orderId,false,null);
            SetInfoMessage(WebConstants.Messages.Information.ORDER_UNCANCELLED);
        }
        else if (e.CommandName.Equals("EditOrder"))
        {
            Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + orderId);
        }
        GridView1.DataBind();
    }
}
