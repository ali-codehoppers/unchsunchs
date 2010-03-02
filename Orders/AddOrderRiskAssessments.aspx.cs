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

public partial class Orders_AddOrderRiskAssessments : OrderDetailPage
{
    Dictionary<string, List<KeyValuePair<int, string>>> categories = new Dictionary<string, List<KeyValuePair<int, string>>>();

    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        if (IsPostBack == false)
        {
            BindRepeater();
        }
    }
    private void BindRepeater()
    {
        DepartmentOrderDocTableAdapters.DocumentTableAdapter ta = new DepartmentOrderDocTableAdapters.DocumentTableAdapter();
        IEnumerator iEnum = ta.GetRemainingDocsByTypeName(loggedInUserCoId, departmentId, "Risk Assessments", int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID])).GetEnumerator();
        while (iEnum.MoveNext())
        {
            DepartmentOrderDoc.DocumentEntityRow dataRow = (DepartmentOrderDoc.DocumentEntityRow)iEnum.Current; 
            if (categories.ContainsKey(dataRow.category_name) == false)
            {
                categories.Add(dataRow.category_name, new List<KeyValuePair<int, string>>());
            }
            List<KeyValuePair<int, string>> docs = categories[dataRow.category_name];
            docs.Add(new KeyValuePair<int, string>(dataRow.doc_id, dataRow.doc_name));
        }
        rptDocs.DataSource = categories.Keys;
        rptDocs.DataBind();
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderDocuments.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderKeyAspects.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DepartmentOrderDocTableAdapters.DepartmentOrderDocTableAdapter tableAdapter = new DepartmentOrderDocTableAdapters.DepartmentOrderDocTableAdapter();
        foreach (RepeaterItem repeaterItem in rptDocs.Items)
        {
            CheckBoxList cbDocs = repeaterItem.FindControl("cbDocs") as CheckBoxList;
            foreach (ListItem listItem in cbDocs.Items)
            {
                if (listItem.Selected)
                {
                    tableAdapter.Insert(int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]),int.Parse(listItem.Value),departmentId, loggedInUserCoId, false);
                }
            }
        }
        gvDocs.DataBind();
        BindRepeater();
    }
    protected void gvDocs_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        BindRepeater();
    }

    protected void rptDocs_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        CheckBoxList cbDocs = e.Item.FindControl("cbDocs") as CheckBoxList;
        cbDocs.Items.Clear();
        HiddenField categoryName = e.Item.FindControl("hfCategoryName") as HiddenField;
        if (categories.ContainsKey(categoryName.Value))
        {
            foreach (KeyValuePair<int, string> kvPair in categories[categoryName.Value])
            {
                cbDocs.Items.Add(new ListItem(kvPair.Value, kvPair.Key.ToString()));
            }
        }
    }

}
