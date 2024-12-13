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
using Typical.Data;


public partial class SimpleSearch : System.Web.UI.Page
{
    protected string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["CharDoc3"].ConnectionString;
    protected DataSet dsResults;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlDataAction dact = new SqlDataAction(cnStr);
        dact.OpenConnection();
        string stmt;
        stmt = String.Format("SELECT     *, CASE URL WHEN '' THEN '' ELSE '<a href=\"' + URL + '\">Image (TIF)</a>' END AS URL2 " +
                                    " FROM         dbo.tblChardoc" +
                                    " WHERE CONTAINS([SEARCHTEXT],'{0}')", txtSearch.Text);
        stmt = String.Format("SELECT     *, CASE URL WHEN '' THEN '' ELSE '<a href=\"' + URL + '\">Image (TIF)</a>' END AS URL2 " +
                            " FROM         dbo.tblChardoc" +
                            " WHERE FREETEXT([SEARCHTEXT],'{0}')", txtSearch.Text);
        //string stmt = String.Format("SELECT * FROM vw_CharDoc WHERE [Author] LIKE '%{0}%' ORDER BY Author", txtSearch.Text);
        dsResults = dact.ExecuteDataSet(stmt);
        dact.CloseConnection();
        gvResults.DataSource = dsResults.Tables[0];
        gvResults.DataBind();
        //Response.Write(stmt);
    }

}
