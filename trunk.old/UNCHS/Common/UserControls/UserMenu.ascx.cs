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
    protected void Page_Load(object sender, EventArgs e)
    {
        string currentPage = GetCurrentPage();
        foreach (TreeNode node in UserMenuTree.Nodes)
        {
            if (ParseNode(node,currentPage))
            {
                node.Expand();
            }
        }
    }
    private bool ParseNode(TreeNode node,string currentPage)
    {
        if (node.ChildNodes.Count == 0)
        {
            if (node.NavigateUrl.EndsWith(currentPage))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            foreach (TreeNode childNode in node.ChildNodes)
            {
                if (ParseNode(childNode, currentPage))
                {
                    childNode.Expand();
                    return true;
                }
            }
        }
        return false;
    }
    string GetCurrentPage() 
    { 
        Uri uri = Request.Url; 
        string[] segment = uri.Segments; 
        string page = string.Empty; 
        if (0 < segment.Length) 
        { 
            page = segment[segment.Length - 1]; 
        } 
        return page; 
    }
}
