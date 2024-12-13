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
using Typical.Data;


public partial class DeleteAbstracts : System.Web.UI.Page
{
    protected string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["CharDoc3"].ConnectionString;
  
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] dels;
        if (Request.Form["cboxSelect"] != null)
        {
            dels = Request.Form["cboxSelect"].Replace("|", "'").Split(new char[] { ',' });
        } 
        else
        {
            dels = new string[] { "'" + Request.Form["hidAccNum"].ToString() + "'" };
        }
 
        SqlDataAction dact = new SqlDataAction(cnStr);
        dact.OpenConnection();
        for (int i = 0; i < dels.Length; i++)
        {
            string stmt = String.Format("EXEC sp_chardoc_DeleteAbstractSoft {0}", dels[i]);
            dact.ExecuteNonQuery(stmt);
            //Response.Write(stmt + "<br />");
            //Response.Write(dels[0]);

        }
        dact.CloseConnection();
        dact = null;

        this.lblConfirmMsg.Text = "The abstracts have been deleted"; 


    }
}
