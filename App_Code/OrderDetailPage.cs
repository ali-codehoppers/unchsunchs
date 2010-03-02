using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for OrderDetailPage
/// </summary>
public abstract class OrderDetailPage : DepartmentPage
{
    protected int departmentId;
    protected int orderId;
	public OrderDetailPage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    protected override void  Department_Page_Handling(object sender, EventArgs e)
    {
        if (Request[WebConstants.Request.DEPT_ORDER_ID] != null)
        {
            try
            {
                DepartmentOrder.DepartmentOrderRowRow dataRow = DatabaseUtility.GetDepartmentOrder(int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]));
                if (dataRow != null)
                {
                    Session[WebConstants.Session.DEPT_ID] = dataRow.dept_id;
                    departmentId = dataRow.dept_id;
                    orderId = int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]);
                    Order_Detail_Handling(sender,e,dataRow.dept_id);
                }
                else
                {
                    Session[WebConstants.Session.DEPT_ID] = null; 
                    Response.Redirect("~/Orders/AddOrder.aspx");
                }
            }
            catch (Exception ex)
            {
                Session[WebConstants.Session.DEPT_ID] = null; 
                Response.Redirect("~/Orders/AddOrder.aspx");
            }
        }
        else
        {
            Session[WebConstants.Session.DEPT_ID] = null; 
            Response.Redirect("~/Orders/AddOrder.aspx");
        }
    }
    public abstract void Order_Detail_Handling(object sender, EventArgs e,int deptId);    
}
