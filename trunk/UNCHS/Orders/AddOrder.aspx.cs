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
using System.Text;
using System.Data.SqlClient;

public partial class Orders_AddOrder : DepartmentPage
{

    
    
    protected override void  Department_Page_Handling(object sender, EventArgs e)
    {

          
        if (Request[WebConstants.Request.DEPT_ORDER_ID] != null)
        {
            if (IsPostBack == false)
            {
                DepartmentOrder.DepartmentOrderRowRow dataRow = DatabaseUtility.GetDepartmentOrder(int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]));
                if (dataRow != null)
                {
                    //ddlDepartment.DataBind();
                    ddlDepartment.SelectedValue = dataRow.dept_id.ToString();
                    if (dataRow.order_ref != WebConstants.Default.NOT_SET)
                        tbOrderRef.Text = dataRow.order_ref;
                    if (dataRow.order_client_ref != WebConstants.Default.NOT_SET)
                        tbOrderClientRef.Text = dataRow.order_client_ref;
                    if (dataRow.order_sms != WebConstants.Default.NOT_SET)
                        tbOrderSMS.Text = dataRow.order_sms;
                    dtCreated.Text = dataRow.date_order_created.ToShortDateString();
                    tbEstWork.Text = dataRow.order_est_of_works.ToString();
                    if (dataRow.Isest_num_of_operativesNull() == false)
                        tbEstNumOperatives.Text = dataRow.est_num_of_operatives.ToString();
                    
                    if (dataRow.Isdate_order_reviewNull())
                    {
                        
                        cbReview.Checked = false;
                        tbReviewDate.Enabled = false;
                    }
                    else
                    {
                        cbReview.Checked = true;
                        tbReviewDate.Enabled = true;
                        tbReviewDate.Text = dataRow.date_order_review.ToShortDateString();
                    }
                    if (dataRow.Isflg_order_doc_to_clientNull() == false)
                    {
                        cbDocClient.Checked = dataRow.flg_order_doc_to_client;
                    }
                    tbAddressNo.Text = dataRow.address_no;
                    tbAddress1.Text = dataRow.address_line1;
                    tbAddress2.Text = dataRow.address_line2;
                    tbAddress3.Text = dataRow.address_line3;
                    tbAddress4.Text = dataRow.address_line4;
                    tbAddress5.Text = dataRow.address_line5;
                    tbPostalCode.Text = dataRow.address_post_code;
                    tbDesc.Text = dataRow.order_desc;
                    cbMultiEmerExits.Checked = dataRow.flg_multi_emer_exits;
                    cbAssemPts.Checked = dataRow.flg_multi_assem_points;
                    if(dataRow.Isdesc_of_workNull() == false)
                        tbDescOfWork.Text = dataRow.desc_of_work;
                    if (dataRow.Isrisk_takingNull() == false)
                        ddlRiskTaking.SelectedValue = dataRow.risk_taking;
                    btnSave.Visible = false;
                    btnUpdate.Visible = true;                    
                    handleDisplayLogic(dataRow.flg_cancelled);

                }
            }

        }
        else
        {
          ClientScript.RegisterStartupScript(this.GetType(), "showCopyDialog", "YAHOO.util.Event.onDOMReady(showCopyDialog);", true);
         
            // if (IsPostBack == false)
            //   preSaveDepartmentOrder();
        }
    }

    
   

    private void preSaveDepartmentOrder()
    {
        
        setDefaultValues();
        DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter da = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
        IEnumerator iEnumerator = da.InsertAndReturn(false,firstDepartmentId, loggedInUserCoId, tbOrderRef.Text, tbOrderClientRef.Text, tbOrderSMS.Text,
            DateTime.Now, getEstWork(), DateTime.Now.AddYears(1), cbDocClient.Checked,
            tbPopupFlat.Text, tbPopupAddress1.Text, tbPopupAddress2.Text, tbPopupAddress3.Text, tbPopupAddress4.Text, tbPopupAddress5.Text, tbPopupPostCode.Text, getPopupFullAddress(),
            tbDesc.Text, cbMultiEmerExits.Checked, cbAssemPts.Checked, false, null,tbDescOfWork.Text,getEstNumOfOperatives(),ddlRiskTaking.SelectedValue,
            loggedInUserId, DateTime.Now, loggedInUserId, DateTime.Now).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            DepartmentOrder.DepartmentOrderRowRow dataRow = (DepartmentOrder.DepartmentOrderRowRow)iEnumerator.Current;
            Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + dataRow.sequence);
        }
    }

    
    
    private string getOrderSMS(string order_sms)
    {
        string smsOrder = order_sms.ToString();
        while (smsOrder.Length < 6)
        {
            smsOrder = smsOrder.Insert(0, "0");
        }
        return smsOrder;
    }

    private void handleDisplayLogic(bool isCancelled)
    {
        enableFields(!isCancelled);
        btnCancel.Visible = !isCancelled;
        btnUpdate.Visible = !isCancelled;
        btnUncancel.Visible = isCancelled;
    }

    private void enableFields(bool enable)
    {
        ddlDepartment.Enabled = enable;
        tbOrderRef.Enabled = enable;
        tbOrderClientRef.Enabled = enable;
        tbOrderSMS.Enabled = enable;
        dtCreated.Enabled = enable;
        tbEstWork.Enabled = enable;
        cbReview.Enabled = enable;
        tbReviewDate.Enabled = enable;
        cbDocClient.Enabled = enable;
        tbAddressNo.Enabled = enable;
        tbAddress1.Enabled = enable;
        tbAddress2.Enabled = enable;
        tbAddress3.Enabled = enable;
        tbAddress4.Enabled = enable;
        tbAddress5.Enabled = enable;
        tbPostalCode.Enabled = enable;
        tbDesc.Enabled = enable;
        tbDescOfWork.Enabled = enable;
        tbEstNumOperatives.Enabled = enable;
    }
    protected void ddlDepartment_DataBound(object sender, EventArgs e)
    {
        if (ddlDepartment.Items.Count <= 1)
        {
            ddlDepartment.Visible = false;
            lblDepartment.Visible = false;
        }
    }
    protected void cbReview_CheckedChanged(object sender, EventArgs e)
    {
        tbReviewDate.Enabled = cbReview.Checked;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        setDefaultValues();
        DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter da = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
        IEnumerator iEnumerator = da.InsertAndReturn(false, int.Parse(ddlDepartment.SelectedValue), loggedInUserCoId, tbOrderRef.Text, tbOrderClientRef.Text, tbOrderSMS.Text,
            getCreatedDate(), getEstWork(), getReviewDate(), cbDocClient.Checked,
            tbAddressNo.Text, tbAddress1.Text, tbAddress2.Text, tbAddress3.Text, tbAddress4.Text, tbAddress5.Text, tbPostalCode.Text, getFullAddress(),
            tbDesc.Text, cbMultiEmerExits.Checked, cbAssemPts.Checked, false, null,tbDescOfWork.Text,getEstNumOfOperatives(),ddlRiskTaking.SelectedValue, loggedInUserId, DateTime.Now, loggedInUserId, DateTime.Now).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            DepartmentOrder.DepartmentOrderRowRow dataRow = (DepartmentOrder.DepartmentOrderRowRow)iEnumerator.Current;
            Response.Redirect("~/Orders/AddOrderPeople.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + dataRow.sequence);
        }
    }
    private int getEstWork()
    {
        int estimatedWork = 0;
        try
        {
            estimatedWork = int.Parse(tbEstWork.Text);
        }
        catch (Exception ex)
        {
            estimatedWork = 0;
        }
        return estimatedWork;
    }

    private void setDefaultValues()
    {
        if (tbOrderRef.Text.Trim().Length == 0)
        {
            tbOrderRef.Text = WebConstants.Default.NOT_SET;
        }
        if (tbOrderClientRef.Text.Trim().Length == 0)
        {
            tbOrderClientRef.Text = WebConstants.Default.NOT_SET;
        }
        //if (tbOrderSMS.Text.Trim().Length == 0)
        //{
        //    tbOrderSMS.Text = WebConstants.Default.NOT_SET;
        //}
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Update(false, null);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Update(true, DateTime.Now);
        handleDisplayLogic(true);
    }
    private void Update(bool cancel, Nullable<DateTime> cancelDateTime)
    {
        setDefaultValues();
        DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter da = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
        da.Update(false, int.Parse(ddlDepartment.SelectedValue), loggedInUserCoId, tbOrderRef.Text, tbOrderClientRef.Text, getCreatedDate(), getEstWork(),getEstNumOfOperatives(), getReviewDate(), cbDocClient.Checked,
            tbAddressNo.Text, tbAddress1.Text, tbAddress2.Text, tbAddress3.Text, tbAddress4.Text, tbAddress5.Text, tbPostalCode.Text, getFullAddress(),
            tbDesc.Text,tbDescOfWork.Text, cbMultiEmerExits.Checked, cbAssemPts.Checked, cancel, cancelDateTime, loggedInUserId, DateTime.Now,ddlRiskTaking.SelectedValue, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]));
        Response.Redirect("~/Orders/AddOrderPeople.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }

    private Nullable<int> getEstNumOfOperatives()
    {
        if (tbEstNumOperatives.Text.Length > 0)
        {
            return int.Parse(tbEstNumOperatives.Text);
        }
        return null;
    }


    private Nullable<DateTime> getReviewDate()
    {
        Nullable<DateTime> reviewDate = null;
        if (cbReview.Checked)
        {
            try
            {
                reviewDate = DateTime.Parse(tbReviewDate.Text);
                //IFormatProvider provider = new System.Globalization.CultureInfo("en-CA", true);
                //String datetime = dtReview.SelectedDate.ToString();
                //reviewDate = DateTime.Parse(datetime, provider, System.Globalization.DateTimeStyles.NoCurrentDateDefault);

            }
            catch (Exception ex)
            {
                reviewDate = null;
            }
        }
        return reviewDate;
    }

    private Nullable<DateTime> getCreatedDate()
    {
        Nullable<DateTime> createdDate = DateTime.Now;
        try
        {
            createdDate = DateTime.Parse(tbReviewDate.Text);
            //IFormatProvider provider = new System.Globalization.CultureInfo("en-CA", true);
            //String datetime = dtCreated.SelectedDate.ToString();
            //createdDate = DateTime.Parse(datetime, provider, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
        }
        catch (Exception ex)
        {
            createdDate = DateTime.Now;
        }
        return createdDate;
    }

    private string getFullAddress()
    {
        StringBuilder addressFull = new StringBuilder();
        addressFull.Append(tbAddressNo.Text).Append(" ");
        addressFull.Append(tbAddress1.Text).Append(" ");
        addressFull.Append(tbAddress2.Text).Append(" ");
        addressFull.Append(tbAddress3.Text).Append(" ");
        addressFull.Append(tbAddress4.Text).Append(" ");
        addressFull.Append(tbAddress5.Text).Append(" ");
        addressFull.Append(tbPostalCode.Text);
        return addressFull.ToString();
    }

    private string getPopupFullAddress()
    {
        StringBuilder addressFull = new StringBuilder();
        addressFull.Append(tbPopupFlat.Text).Append(" ");
        addressFull.Append(tbPopupAddress1.Text).Append(" ");
        addressFull.Append(tbPopupAddress2.Text).Append(" ");
        addressFull.Append(tbPopupAddress3.Text).Append(" ");
        addressFull.Append(tbPopupAddress4.Text).Append(" ");
        addressFull.Append(tbPopupAddress5.Text).Append(" ");
        addressFull.Append(tbPopupPostCode.Text);
        return addressFull.ToString();
    }

    protected void btnUncancel_Click(object sender, EventArgs e)
    {
        Update(false, null);
        handleDisplayLogic(false);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        Company.un_co_detailsRow dr = GetCompany();
        if (dr != null && dr.Isflg_autosaveNull() == false && dr.flg_autosave)
        {
                Update(false, null);

                Response.Redirect("~/Orders/AddOrderPeople.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
        else
            SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_COMPANYAUTOSAVE);
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        preSaveDepartmentOrder();
    }
}
