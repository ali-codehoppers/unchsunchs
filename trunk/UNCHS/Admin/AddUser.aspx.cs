using System;
using System.Collections.Generic;
//using System.Web;
//using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Admin_AddUser : AdminPage
{
    protected override void AdminPageHandling(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            if (Request[WebConstants.Request.USER_ID] != null)
            {
                int userId = int.Parse(Request[WebConstants.Request.USER_ID]);
                SimplicityCommLib.DataSets.Common.UsersTableAdapters.UsersTableAdapter userTA = new SimplicityCommLib.DataSets.Common.UsersTableAdapters.UsersTableAdapter();                

                IEnumerator iEnum = userTA.GetUserById(userId).GetEnumerator();
                if (iEnum.MoveNext())
                {                    
                    SimplicityCommLib.DataSets.Common.Users.UsersRow user = (SimplicityCommLib.DataSets.Common.Users.UsersRow)iEnum.Current;
                    //ddlCompany.SelectedValue = user..ToString();
                    //tbUserLevel.Text = user.user_level.ToString();
                    tbUserName.Text = user.Email;
                    tbUserLogon.Text = user.Password;
                    //tbUserEnable.Text = user.FlgEnabled;
                    //tbUserEnableReminder.Text = user.user_enable_reminder;
                    //if(user.Isuser_telephoneNull() == false)  tbTelephone.Text = user.user_telephone;
                    //if (user.Isuser_tel_extNull() == false) tbTelExt.Text = user.user_tel_ext;
                    //if (user.Isuser_tel_mobileNull() == false) tbMobile.Text = user.user_tel_mobile;
                    //if (user.Isuser_emailNull() == false) tbEmail.Text = user.user_email;
                    //if (user.Isuser_departmentNull() == false) tbDepartment.Text = user.user_department;
                    //if (user.Isuser_locationNull() == false) tbLocation.Text = user.user_location;
                    ddlRole.SelectedValue = user.Role;
                    btnSave.Visible = false;
                    btnUpdate.Visible = true;
                    ddlCompany.Enabled = false;
                }
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SimplicityCommLib.DataSets.Common.UsersTableAdapters.UsersTableAdapter userTA = new SimplicityCommLib.DataSets.Common.UsersTableAdapters.UsersTableAdapter();
        if (userTA.GetUserByEmail(tbUserLogon.Text).GetEnumerator().MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        else
        {
            //userTA.Insert(false, int.Parse(ddlCompany.SelectedValue), int.Parse(tbUserLevel.Text), tbUserName.Text, tbUserLogon.Text,
            //    tbUserEnable.Text, tbUserEnableReminder.Text, tbTelephone.Text, tbTelExt.Text, tbMobile.Text, tbEmail.Text, tbDepartment.Text,
            //    tbLocation.Text, loggedInUserId, DateTime.Now, loggedInUserId, DateTime.Now,ddlRole.SelectedValue);
            SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //UserTableAdapters.un_co_user_detailsTableAdapter userTA = new UserTableAdapters.un_co_user_detailsTableAdapter();
        //if (userTA.GetUserByLogonName(tbUserLogon.Text, int.Parse(Request[WebConstants.Request.USER_ID])).GetEnumerator().MoveNext())
        //{
        //    SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        //}
        //else
        //{
        //    userTA.Update(int.Parse(tbUserLevel.Text), tbUserName.Text, tbUserLogon.Text, tbUserEnable.Text, tbUserEnableReminder.Text, tbTelephone.Text,
        //        tbTelExt.Text, tbMobile.Text, tbEmail.Text, tbDepartment.Text, tbLocation.Text, loggedInUserId, DateTime.Now, int.Parse(Request[WebConstants.Request.USER_ID]));
        //    SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        //}
    }
}
