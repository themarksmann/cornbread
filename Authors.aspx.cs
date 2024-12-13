using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.Odbc;

using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Typical.Data;

public partial class Authors : System.Web.UI.Page
{
    protected string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["CharDoc3"].ConnectionString;
    protected DataSet dsAuthors;
    protected DataSet dsResults;


    protected void Page_Load(object sender, EventArgs e)
    {
        LoadAuthors(String.Empty);
        this.ClientScript.RegisterStartupScript(this.GetType(),
                    "CaptureFirstList", "captureFirstList();", true);
    }


    protected void LoadAuthors(string searchPrefix)
    {

        SqlDataAction dact = new SqlDataAction(cnStr);
        dact.OpenConnection();

        DataCache dc = new DataCache();
        SqlConnection cn = new SqlConnection(cnStr);

        cn.Open();
        DataSet ds = new DataSet();
        string stmt = "SELECT author_name, author_display FROM tbl_chardoc_Authors ORDER BY author_name";
        string fp = MapPath("./cache");
        dc.AddTable(ref cn, ref ds, stmt, "Authors", 5, fp, "Authors.xml", "Authors.xsd");
        //dc.OutputTableToCache(
        if (searchPrefix == String.Empty)
        {
            stmt = "SELECT author_name, author_display FROM tbl_chardoc_Authors ORDER BY author_name";
        }
        else
        {
            stmt = "SELECT author_name, author_display FROM tbl_chardoc_Authors ORDER BY author_name";
            //stmt = String.Format("SELECT * FROM tblAuthor WHERE varAuthor LIKE '{0}%' ORDER BY varAuthor",searchPrefix);
        }
        dsAuthors = dact.ExecuteDataSet(stmt);
        dact.CloseConnection();
        dact = null;

        selAuthors.DataTextField = "author_display";
        selAuthors.DataValueField = "author_name";
        selAuthors.DataSource = dsAuthors.Tables[0];
        selAuthors.DataBind();
        dsAuthors = null;
    }


    protected void LoadAuthors2(string searchPrefix)
    {

        OdbcConnection cn = new OdbcConnection(cnStr);


        DataSet dsAuthors = new DataSet();
        string stmt;
        //= "SELECT author_name, author_display FROM tbl_chardoc_Authors ORDER BY author_name";

        if (searchPrefix == String.Empty)
        {
            stmt = "SELECT author_name, author_display FROM tbl_chardoc_Authors ORDER BY author_name";
        }
        else
        {
            stmt = "SELECT author_name, author_display FROM tbl_chardoc_Authors ORDER BY author_name";
            //stmt = String.Format("SELECT * FROM tblAuthor WHERE varAuthor LIKE '{0}%' ORDER BY varAuthor",searchPrefix);
        }
        OdbcCommand cmd = new OdbcCommand(stmt, cn);
        OdbcDataAdapter da = new OdbcDataAdapter(cmd);
        cn.Open();
        da.Fill(dsAuthors);
        cn.Close();
        cn = null;
        selAuthors.DataTextField = "author_display";
        selAuthors.DataValueField = "author_name";
        selAuthors.DataSource = dsAuthors.Tables[0];
        selAuthors.DataBind();
        dsAuthors = null;
    }
}
