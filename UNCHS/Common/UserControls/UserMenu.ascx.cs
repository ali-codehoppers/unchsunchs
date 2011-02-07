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

public partial class Common_UserControls_UserMenu : System.Web.UI.UserControl
{
    private String urlString;
    protected void Page_Load(object sender, EventArgs e)
    {
        urlString = Request.Url.ToString();
        HomeNode.CssClass = SelectClass("UserHome.aspx", HomeNodeImage);
        CreateNode.CssClass = SelectClass("AddOrder.aspx", CreateNodeImage);
        SearchNode.CssClass = SelectClass("SearchOrder.aspx", SearchNodeImage);
        UploadNode.CssClass = SelectClass("UploadOrder.aspx", UploadNodeImage);
        SignageNode.CssClass = SelectClass("GenerateSignage.aspx", SignageNodeImage);
        CreateDeptNode.CssClass = SelectClass("AddDepartment.aspx",CreateDeptNodeImage);
        CreateDeptListNode.CssClass = SelectClass("DepartmentList.aspx",CreateDeptListNodeImage);
        DefaultListNode.CssClass = SelectClass("DepartmentPersonList.aspx",DefaultListNodeImage);
        PPENode.CssClass=SelectClass("DepartmentPPECategoryList.aspx",PPENodeImage);
        PPEListNode.CssClass = SelectClass("DepartmentPPEList.aspx",PPEListNodeImage);
        KeyNode.CssClass = SelectClass("DepartmentHazardCategoryList.aspx",KeyNodeImage);
        KeyListNode.CssClass = SelectClass("DepartmentHazardList.aspx",KeyListNodeImage);
        PlantNode.CssClass = SelectClass("DepartmentToolCategoryList.aspx",PlantNodeImage);
        PlantListNode.CssClass = SelectClass("DepartmentToolList.aspx",PlantListNodeImage);
        WorkNode.CssClass = SelectClass("DepartmentWorkCategoryList.aspx",WorkNodeImage);
        WorkListNode.CssClass = SelectClass("DepartmentWorkList.aspx",WorkListNodeImage);
        EmergencyNode.CssClass = SelectClass("DepartmentEmergencyCategoryList.aspx",EmergencyNodeImage);
        EmergencyListNode.CssClass = SelectClass("DepartmentEmergencyList.aspx",EmergencyListNodeImage);
        RequirmentNode.CssClass = SelectClass("DepartmentRequirementCategoryList.aspx",RequirmentNodeImage);
        RequirmentListNode.CssClass = SelectClass("DepartmentRequirementList.aspx",RequirmentListNodeImage);
        AspectNode.CssClass = SelectClass("DepartmentAspectCategoryList.aspx",AspectNodeImage);
        AspectListNode.CssClass = SelectClass("DepartmentAspectList.aspx",AspectListNodeImage);
        DocumentNode.CssClass = SelectClass("DocumentCategoryList.aspx",DocumentNodeImage);
        SectionNode.CssClass = SelectClass("SectionList.aspx",SectionNodeImage);
        DocumentListNode.CssClass = SelectClass("DocumentList.aspx",DocumentListNodeImage);
        GuideNode.CssClass = SelectClass("help.pdf", GuideNodeImage);
    }
    public String SelectClass(String Page , Image Node)
    {
        if (urlString.Contains(Page))
        {
            Node.ImageUrl = "~/Images/arrow_select.jpg";
            Node.CssClass = "selectNodeSelected";
            return "txt_select";
        }
        else
        {
            Node.ImageUrl = "~/Images/arrow_left.jpg";
            Node.CssClass = "selectNodeNotSelected";
            return "txt_black";
        }
    }
 
}
