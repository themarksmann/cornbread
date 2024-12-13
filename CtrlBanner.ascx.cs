using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
//using Typical.Data;

public partial class CtrlBanner : System.Web.UI.UserControl
{
    private string mScreenName;
    private int mSecurityLevel;

    protected string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["CharDoc3"].ConnectionString;
  
 

    public string ScreenName
    {
        get
        {
            return mScreenName;
        }
        set 
        { 
            mScreenName = value; 
        }
    }

    public int SecurityLevel
    {
        get
        {
            return mSecurityLevel;
        }
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        if (String.Compare(Request.Url.Host.ToLower(),"spshpp01.dtinet.net") != 0)
        {
            Response.Redirect("http://spshpp01.dtinet.net/TIC/Chardoc3/");
        }

        this.lblScreenName.Text = mScreenName;
        if (mScreenName == "Main Page") 
        {
            this.hlReturn.Visible = false;
        }        

        //security level
        SqlDataAction dact = new SqlDataAction(cnStr);
        dact.OpenConnection();
        string stmt = String.Format("SELECT sec_level FROM tbl_chardoc_Security WHERE ntlogon = '{0}'", this.Request.LogonUserIdentity.Name);
        //Response.Write(stmt);
        object oSecLevel = dact.ExecuteScalar(stmt);
        //Response.Write(dact.ExecuteDataSet(stmt).Tables[0].Rows[0][0].ToString());

        if (oSecLevel != null)
        {
            //Response.Write("was not equal to NULL:" + ((int)oSecLevel).ToString());
            //Response.Write("was not equal to NULL:" + );
            mSecurityLevel = (int)oSecLevel;
        }
        else
        {
            //Response.Write("was equal to NULL");
            mSecurityLevel = 0;
            Response.Redirect("Permissions.htm");

        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {






       
        

    }
}
