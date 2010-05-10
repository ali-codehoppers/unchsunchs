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
using System.Text;

public partial class Common_TabControl : System.Web.UI.UserControl
{
    public string Selected = "Main";
    private Dictionary<string, string> menuItems = new Dictionary<string, string>();
    
    protected string LiList = "";
    protected void InitializeComponent()
    {
        
        menuItems.Add("Main", "/Orders/AddOrder.aspx");
        menuItems.Add("People", "/Orders/AddOrderPeople.aspx");
        menuItems.Add("Key Hazards", "/Orders/AddOrderHazard.aspx");
        menuItems.Add("Work", "/Orders/AddOrderSeqOfWoks.aspx");
        menuItems.Add("Tools", "/Orders/AddOrderTool.aspx");
        menuItems.Add("PPE", "/Orders/AddOrderPPE.aspx");
        menuItems.Add("Emergency", "/Orders/AddOrderEmergencyExits.aspx");
        menuItems.Add("Requirements", "/Orders/AddOrderRequirements.aspx");
        menuItems.Add("Aspects", "/Orders/AddOrderKeyAspects.aspx");
        menuItems.Add("Risks", "/Orders/AddOrderRiskAssessments.aspx");
        //menuItems.Add("Sig Hazards", "/Orders/AddOrderSigHazard.aspx");
        //menuItems.Add("Assem Pts", "/Orders/AddOrderAssemPts.aspx");        
        //menuItems.Add("Measures", "/Orders/AddOrderCtrlMeasures.aspx");
        menuItems.Add("Docs", "/Orders/AddOrderDocuments.aspx");
        menuItems.Add("Log", "/Orders/OrderLog.aspx");

        StringBuilder lis = new StringBuilder();
        foreach (KeyValuePair<string, string> kvPair in menuItems)
        {
            lis.Append("<li ");
            if(kvPair.Key.Equals(Selected))
            {
                lis.Append("class='selected'");
            }
            lis.Append("><a href='").Append(Request.ApplicationPath).Append(kvPair.Value);
            if(Request[WebConstants.Request.DEPT_ORDER_ID] != null)
            {
                lis.Append("?").Append(WebConstants.Request.DEPT_ORDER_ID).Append("=").Append(Request[WebConstants.Request.DEPT_ORDER_ID]);
            }
            lis.Append("'>").Append(kvPair.Key).Append("</a></li>");            
        }
        LiList = lis.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    override protected void OnInit(EventArgs e)
    {
        InitializeComponent();
        base.OnInit(e); // be care of this
    }
    
}
