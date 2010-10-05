using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SimplicityCommLib;

public partial class Register_AddUser : TempGenericPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[WebConstants.Session.WIZARD_STEP] == null ||
            (int)Session[WebConstants.Session.WIZARD_STEP] < 3)
        {
            Response.Redirect("~/Register/AddDeparment.aspx");
        }
        if (IsPostBack == false)
        {
            if (Session[WebConstants.Session.REG_CO_ID] != null
                && Session[WebConstants.Session.REG_DEPT_ID] != null
                && Session[WebConstants.Session.REG_USER_ID] != null)
            {
                int userId = (int)Session[WebConstants.Session.REG_USER_ID];
                UserTableAdapters.un_co_user_detailsTableAdapter userTA = new UserTableAdapters.un_co_user_detailsTableAdapter();

                IEnumerator iEnum = userTA.GetUserById(userId).GetEnumerator();
                if (iEnum.MoveNext())
                {
                    User.un_co_user_detailsRow user = (User.un_co_user_detailsRow)iEnum.Current;
                    tbUserName.Text = user.user_name;
                    tbUserLogon.Text = user.user_logon;
                    tbUserEnable.Text = user.user_enable;
                    tbConfirmUserEnable.Text = user.user_enable;
                    tbUserEnableReminder.Text = user.user_enable_reminder;
                    if (user.Isuser_telephoneNull() == false) tbTelephone.Text = user.user_telephone;
                    if (user.Isuser_tel_extNull() == false) tbTelExt.Text = user.user_tel_ext;
                    if (user.Isuser_tel_mobileNull() == false) tbMobile.Text = user.user_tel_mobile;
                    if (user.Isuser_emailNull() == false) tbEmail.Text = user.user_email;
                    if (user.Isuser_departmentNull() == false) tbDepartment.Text = user.user_department;
                    if (user.Isuser_locationNull() == false) tbLocation.Text = user.user_location;
                    btnSave.Visible = false;
                    btnUpdate.Visible = true;
                }
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (tbUserEnable.Text != tbConfirmUserEnable.Text)
        {
            SetErrorMessage("Passwords do not match");
            return;
        }
        UserTableAdapters.un_co_user_detailsTableAdapter userTA = new UserTableAdapters.un_co_user_detailsTableAdapter();
        if (userTA.GetUserByLogonName(tbUserLogon.Text, null).GetEnumerator().MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        else
        {
            IEnumerator ie = userTA.InsertAndReturn(false, (int)Session[WebConstants.Session.REG_CO_ID],1, tbUserName.Text, tbUserLogon.Text,
                Utility.GetMd5Sum(tbUserEnable.Text), tbUserEnableReminder.Text, tbTelephone.Text, tbTelExt.Text, tbMobile.Text, tbEmail.Text, tbDepartment.Text,
                tbLocation.Text, null, DateTime.Now, null, DateTime.Now,Constants.Roles.User).GetEnumerator();
            if(ie.MoveNext())
            {
                User.un_co_user_detailsRow user = (User.un_co_user_detailsRow)ie.Current;
                Session[WebConstants.Session.REG_USER_ID] = user.user_id;
                SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
                TransferTableAdapters.TransferTableAdapter tranTA = new TransferTableAdapters.TransferTableAdapter();
                tranTA.TransferAll(int.Parse(ConfigurationSettings.AppSettings["SourceCompanyId"]),
                    int.Parse(ConfigurationSettings.AppSettings["SourceDepartmentId"]), (int)Session[WebConstants.Session.REG_CO_ID],
                    (int)Session[WebConstants.Session.REG_DEPT_ID], user.user_id);
                Session[WebConstants.Session.WIZARD_STEP] = 4;
                Response.Redirect("~/Register/UploadOrders.aspx");

            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (tbUserEnable.Text != tbConfirmUserEnable.Text)
        {
            SetErrorMessage("Passwords do not match");
            return;
        }
        UserTableAdapters.un_co_user_detailsTableAdapter userTA = new UserTableAdapters.un_co_user_detailsTableAdapter();
        if (userTA.GetUserByLogonName(tbUserLogon.Text, (int)Session[WebConstants.Session.REG_USER_ID]).GetEnumerator().MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        else
        {
            userTA.Update(1, tbUserName.Text, tbUserLogon.Text,Utility.GetMd5Sum(tbUserEnable.Text), tbUserEnableReminder.Text, tbTelephone.Text,
                tbTelExt.Text, tbMobile.Text, tbEmail.Text, tbDepartment.Text, tbLocation.Text, null, DateTime.Now, (int)Session[WebConstants.Session.REG_USER_ID]);
            TransferTableAdapters.TransferTableAdapter tranTA = new TransferTableAdapters.TransferTableAdapter();
            tranTA.TransferAll(int.Parse(ConfigurationSettings.AppSettings["SourceCompanyId"]),
                int.Parse(ConfigurationSettings.AppSettings["SourceDepartmentId"]), (int)Session[WebConstants.Session.REG_CO_ID],
                (int)Session[WebConstants.Session.REG_DEPT_ID],(int)Session[WebConstants.Session.REG_USER_ID]);
            Session[WebConstants.Session.WIZARD_STEP] = 4;
            Response.Redirect("~/Register/UploadOrders.aspx");
        }
    }

}
