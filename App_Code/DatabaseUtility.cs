using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

/// <summary>
/// Summary description for DatabaseUtility
/// </summary>
public static class DatabaseUtility
{
    public static Company.un_co_detailsRow GetCompany(int coId)
    {
        Company.un_co_detailsRow dataRow = null;
        CompanyTableAdapters.un_co_detailsTableAdapter tableAdapter = new CompanyTableAdapters.un_co_detailsTableAdapter();
        IEnumerator iEnumerator = tableAdapter.GetCompanyById(coId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (Company.un_co_detailsRow)iEnumerator.Current;
        }
        return dataRow;
    }

    public static DepartmentOrder.DepartmentOrderRowRow GetDepartmentOrder(int deptOrderId)
    {
        DepartmentOrder.DepartmentOrderRowRow dataRow = null;
        DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter da = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
        IEnumerator iEnumerator = da.GetDepartmentOrderById(deptOrderId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (DepartmentOrder.DepartmentOrderRowRow)iEnumerator.Current;
        }
        return dataRow;
    }

    public static Department.DepartmentSelectCommandRow GetDepartment(int deptId)
    {
        Department.DepartmentSelectCommandRow dataRow = null;
        DepartmentTableAdapters.DepartmentSelectCommandTableAdapter da = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
        IEnumerator iEnumerator = da.GetDepartmentByDeptId(deptId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (Department.DepartmentSelectCommandRow)iEnumerator.Current;
        }
        return dataRow;
    }
    
    public static DepartmentOrderDoc.DocumentEntityRow GetDocument(int docId)
    {
        DepartmentOrderDoc.DocumentEntityRow dataRow = null;
        DepartmentOrderDocTableAdapters.DocumentTableAdapter da = new DepartmentOrderDocTableAdapters.DocumentTableAdapter();
        IEnumerator iEnumerator = da.GetDocById(docId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (DepartmentOrderDoc.DocumentEntityRow)iEnumerator.Current;
        }
        return dataRow;
    }
}
