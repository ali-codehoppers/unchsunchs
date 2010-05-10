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
        menuItems.Add("Main", "AddOrder.aspx");
        menuItems.Add("People", "AddOrderPeople.aspx");
        menuItems.Add("Key Hazards", "AddOrderHazard.aspx");
        menuItems.Add("Work", "AddOrderSeqOfWoks.aspx");
        menuItems.Add("Plants & Tools", "AddOrderTool.aspx");
        menuItems.Add("PPE", "AddOrderPPE.aspx");
        menuItems.Add("Emergency", "AddOrderEmergencyExits.aspx");
        menuItems.Add("Requirements", "AddOrderRequirements.aspx");
        menuItems.Add("Aspects", "AddOrderKeyAspects.aspx");
        menuItems.Add("Risks", "AddOrderRiskAssessments.aspx");
        //menuItems.Add("COSHH", "AddOrderCOSHH.aspx");
        //menuItems.Add("Sig Hazards", "AddOrderSigHazard.aspx");
        //menuItems.Add("Assem Pts", "AddOrderAssemPts.aspx");        
        //menuItems.Add("Measures", "AddOrderCtrlMeasures.aspx");
        menuItems.Add("Docs", "AddOrderDocuments.aspx");
        menuItems.Add("Log", "OrderLog.aspx");

        StringBuilder lis = new StringBuilder();
        foreach (KeyValuePair<string, string> kvPair in menuItems)
        {
            lis.Append("<li ");
            if(kvPair.Key.Equals(Selected))
            {
                lis.Append("class='selected'");
            }
            lis.Append("><a href='").Append(kvPair.Value);
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
