<%@ WebHandler Language="C#" Debug="true" Class="UpdateAuthors" %>

using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.Odbc;

using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Typical.Data;

public class UpdateAuthors : IHttpHandler {
    protected string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["CharDoc3"].ConnectionString;
  
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/javascript";
        context.Response.ContentType = "application/octet-stream";
        
        context.Response.Buffer = true;
        context.Response.BufferOutput = true;

        context.Response.Write("  document.getElementById('sectionAuthorSelect').innerHTML = '';\n");
        context.Response.Write("  var build = ");
        context.Response.Write("  '<select id=\"selAuthors\" runat=\"server\" size=\"16\" style=\"width:180px\" ' + \n");
        context.Response.Write("  '        onchange=\"grabAuthor(this.value);\" onkeyup=\"grabAuthor(this.value);\"> ' + \n");   
        DataSet ds;
        if ((context.Request.QueryString["filter"] != null) && (context.Request.QueryString["filter"].Trim() != String.Empty))
        {
           ds = LoadAuthors(context.Request.QueryString["filter"].Trim());
        }
        else
        {
           ds = LoadAuthors(String.Empty);
        }
        
        
        //ds = LoadAuthors(context.Request.QueryString["f"].Trim());
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            string a = context.Server.HtmlEncode(dr["author_name"].ToString()).Replace("'","\\'");
            string b = context.Server.HtmlEncode(dr["author_display"].ToString()).Replace("'", "\\'");
            context.Response.Write("  ' <option value=\"" + a + "\">" + b + "</option> ' + \n");
        }
        context.Response.Write("  '</select>';\n");
        context.Response.Write("  document.getElementById('sectionAuthorSelect').innerHTML = build;\n");       
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

   
    protected DataSet LoadAuthors(string searchPrefix)
    {

        SqlDataAction dact = new SqlDataAction(cnStr);
        dact.OpenConnection();
        string stmt;
        if (searchPrefix == String.Empty)
        {
            stmt = "SELECT author_name, author_display FROM tbl_chardoc_Authors WHERE 0 = 1 ORDER BY author_name";
        }
        else
        {
            stmt = String.Format("SELECT author_name, author_display FROM tbl_chardoc_Authors WHERE author_name LIKE '{0}%' ORDER BY author_name", searchPrefix.Replace("'","''"));
        }
        DataSet dsAuthors = dact.ExecuteDataSet(stmt);
        dact.CloseConnection();
        dact = null;
        return dsAuthors;
    }

    protected DataSet LoadAuthors2(string searchPrefix)
    {

        OdbcConnection cn = new OdbcConnection(cnStr);


        DataSet dsAuthors = new DataSet();
        string stmt;
        //= "SELECT author_name, author_display FROM tbl_chardoc_Authors ORDER BY author_name";

        if (searchPrefix == String.Empty)
        {
            stmt = "SELECT author_name, author_display FROM tbl_chardoc_Authors WHERE 0 = 1 ORDER BY author_name";
        }
        else
        {
            stmt = String.Format("SELECT author_name, author_display FROM tbl_chardoc_Authors WHERE author_name LIKE '{0}%' ORDER BY author_name", searchPrefix);
        }
        OdbcCommand cmd = new OdbcCommand(stmt, cn);
        OdbcDataAdapter da = new OdbcDataAdapter(cmd);
        cn.Open();
        da.Fill(dsAuthors);
        cn.Close();
        cn = null;

        return dsAuthors;
        
    }

}