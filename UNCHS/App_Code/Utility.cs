using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Utility
/// </summary>
public class Utility
{
	public Utility()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string GetNameFromCategory(string fullName)
    {
        string[] seperator = new string[1];
        seperator[0] = " - ";
        string[] names = fullName.Split(seperator,StringSplitOptions.None);
        if (names.Length == 2)
        {
            return names[1];
        }
        return names[0];
    }


}
