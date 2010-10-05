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
using System.IO;

using LumenWorks.Framework.IO.Csv;
public partial class Register_UploadPeople : TempGenericPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploader.HasFile)
        {
            try
            {
                using (CsvReader csv = new CsvReader(new StreamReader(FileUploader.FileContent), true))
                {
                    int count = 1;
                    while (csv.ReadNextRecord())
                    {
                        DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter personTA = new DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter();
                        personTA.Insert((int)Session[WebConstants.Session.REG_DEPT_ID], (int)Session[WebConstants.Session.REG_CO_ID], count++, csv[0],
                            (int)Session[WebConstants.Session.REG_USER_ID], bool.Parse(csv[1]), bool.Parse(csv[2]), bool.Parse(csv[3]), bool.Parse(csv[4]));
                    }
                }
            }
            catch
            {
                SetErrorMessage("Error processing the file. Please check its contents. File should be CSV and in the format shown below");
            }
        }   
        else
        {
            SetErrorMessage("No file specified");
        }
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserHome.aspx");
    }
}
