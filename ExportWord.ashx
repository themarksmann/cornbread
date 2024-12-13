<%@ WebHandler Language="C#" Debug="true" Class="ExportWord" %>

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

public class ExportWord : IHttpHandler {
    protected string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["CharDoc3"].ConnectionString;
  
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/javascript";
        //context.Response.ContentType = "application/octet-stream";
        context.Response.ContentType = "application/msword";
        
        context.Response.Buffer = true;
        context.Response.BufferOutput = true;

        string stmt;
        stmt = String.Format("SELECT * FROM vw_chardoc_MainFull WHERE accession_number IN ({0})",
                                context.Request.Form["cboxSelect"].Replace("|","'"));          
        //context.Request.Form["txtDebug"].Trim();
        
        
        SqlDataAction dact = new SqlDataAction(cnStr);
        dact.OpenConnection();
        DataSet ds = dact.ExecuteDataSet(stmt);
        
        context.Response.Write("<html>\n<head>\n<title>Word Export</title>\n</head>\n\n");
        context.Response.Write("<body>\n");
        //context.Response.Write("<table border=\"1\" style=\"border-collapse:collapse;\">");
        // start loop
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            //context.Response.Write("<tr>\n");
            this.WriteFldAndVal(context,"Accesion #",dr["accession_number"].ToString());
            this.WriteFldAndVal(context,"Title",dr["title"].ToString());   
            this.WriteFldAndVal(context,"Authors",dr["author"].ToString());          
            this.WriteFldAndVal(context,"Document #",dr["document_number"].ToString());
            this.WriteFldAndVal(context, "Document Date", dr["document_date"].ToString());
            this.WriteFldAndVal(context,"Document Year",dr["document_year"].ToString());
            this.WriteFldAndVal(context, "Company Source", dr["company_source"].ToString());
            this.WriteFldAndVal(context, "Author Location", dr["location"].ToString());
        this.WriteFldAndVal(context,"Abstract", dr["abstract"].ToString()); 
            this.WriteFldAndVal(context,"Descriptors", dr["descriptors"].ToString());
      
            context.Response.Write("\n<br />\n<br />");
            //context.Response.Write("\n</tr>");
        }
        // end loop
        //context.Response.Write("</table>");
        context.Response.Write("\n</body>\n\n</html>");
        
    }
 
    protected void WriteFldAndVal(HttpContext context, string fld, string someStr)
    {
        context.Response.Write("<strong>" + context.Server.HtmlEncode(fld) + ":</strong>&nbsp;\n");
        context.Response.Write(context.Server.HtmlEncode(someStr) + "<br />\n");
               
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}