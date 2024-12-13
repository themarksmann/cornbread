<%@ WebHandler Language="C#" Debug="true" Class="ExportExcel" %>

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

public class ExportExcel : IHttpHandler {
    protected string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["CharDoc3"].ConnectionString;
  
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/javascript";
        //context.Response.ContentType = "application/octet-stream";
        context.Response.ContentType = "application/vnd.ms-excel";
        
        context.Response.Buffer = true;
        context.Response.BufferOutput = true;

        string stmt;
        stmt = String.Format("SELECT * FROM tbl_chardoc_Main WHERE accession_number IN ({0})",
                                context.Request.Form["cboxSelect"].Replace("|","'"));          
        //context.Request.Form["txtDebug"].Trim();
        
        
        SqlDataAction dact = new SqlDataAction(cnStr);
        dact.OpenConnection();
        DataSet ds = dact.ExecuteDataSet(stmt);
        
        context.Response.Write("<html>\n<head>\n<title>Excel Export</title>\n</head>\n\n");
        context.Response.Write("<body>\n");
        context.Response.Write("<table border=\"1\" style=\"border-collapse:collapse;\">");
        // start loop
        context.Response.Write("<tr>\n");
        this.WriteCell(context,"Accession #");
        this.WriteCell(context,"Authors");
        this.WriteCell(context,"Title");
        this.WriteCell(context,"Document #");
        this.WriteCell(context,"Document Year");
        context.Response.Write("</tr>\n");
        
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            context.Response.Write("<tr>\n");
            this.WriteCell(context,dr["accession_number"].ToString());
            this.WriteCell(context,dr["author"].ToString());
            this.WriteCell(context,dr["title"].ToString());
            this.WriteCell(context,dr["document_number"].ToString());
            this.WriteCell(context,dr["document_year"].ToString());
            context.Response.Write("\n</tr>");
        }
        // end loop
        context.Response.Write("</table>");
        context.Response.Write("\n</body>\n\n</html>");
        
    }
 
    protected void WriteCell(HttpContext context, string someStr)
    {
        context.Response.Write("<td>" + context.Server.HtmlEncode(someStr) + "</td>");       
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}