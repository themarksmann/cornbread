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
using System.Text;
using System.Text.RegularExpressions;
using Typical.Data;


public partial class ViewSummary : System.Web.UI.Page
{
    protected string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["CharDoc3"].ConnectionString;
    protected string cnStrOld = System.Configuration.ConfigurationManager.ConnectionStrings["CharDoc2"].ConnectionString;
    protected string mAccNum;
    protected void Page_Load(object sender, EventArgs e)
    {

        if ((Request.QueryString["id"] == null) || (Request.QueryString["id"] == String.Empty))
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            mAccNum = Request.QueryString["id"].ToString();
            if (this.IsPostBack == false)
            {
                this.PopulateForm(cnStr);
            }
        }
        //sec level
        this.pnlAdmin.Visible = (this.CtrlBanner1.SecurityLevel > 1);

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditSummary.aspx?id=" + mAccNum.ToUpper().Trim());
        
    }
  
    protected void HighLight()
    {
        string words;
        if (Session["highlight_words"] == null)
        {
            words = String.Empty;
        }
        else
        {
            words = (string)Session["highlight_words"];
        }
        string pat;
        pat = @"("".*?""|[0-9a-zA-Z\-]+)";
        //pat = @""".+?""|[0-9a-zA-Z]+";
        RegexOptions options = RegexOptions.IgnoreCase;
        Regex regex = new Regex(pat, options);
        string[] results = regex.Split(words);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < results.Length; i++)
        {
            if ((results[i] != " ") && (results[i].Trim() != String.Empty)
                 && (results[i].Trim().ToUpper() != "OR") && (results[i].Trim().ToUpper() != "AND")
                && (results[i].Trim().ToUpper() != "NOT"))
            {
                sb.AppendLine("  highlight2('" + results[i].Trim().Replace("\"", "").Replace("-", "\\-").Replace("'","\\'") + "');");
                //.Replace("(","\\(").Replace(")","\\)") + "');");
                
            }

        }
        //Response.Write(sb.ToString());
        //lblSearchWords.Text = sb.ToString();
        lblSearchWords.Text = String.Empty;


        if ((this.Request.QueryString["h"] != null) && (this.Request.QueryString["h"].ToString() == "0"))
        {
            //do nothing
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "highlight", sb.ToString(), true);
        }

    }
    protected void btnViewOther_Click(object sender, EventArgs e)
    {
        //Response.Write("hello");
        //this.PopulateFormOld(cnStrOld);
        //this.btnViewOther.Enabled = false;
    }






    protected void PopulateForm(string connstr)
    {
        mAccNum = Request.QueryString["id"].ToString().Trim();
        string stmt = String.Format("SELECT * FROM vw_chardoc_MainFull WHERE accession_number = '{0}'", mAccNum);
        SqlConnection cn = new SqlConnection(connstr);
        DataSet ds = new DataSet();
        cn.Open();
        SqlCommand cmd = new SqlCommand(stmt, cn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        cn.Close();
        cn = null;

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            string lnk = dr["url"].ToString().Trim();
            if (String.Compare(lnk, String.Empty) != 0)
            {
                this.hlImageFile.Text = "Image";
                this.hlImageFile.NavigateUrl = (string)dr["url"];
                this.hlImageFile.ToolTip = (string)dr["url"];
            }
            else
            {
                this.hlImageFile.NavigateUrl = String.Empty;
                this.hlImageFile.Text = String.Empty;
                this.hlImageFile.ToolTip = String.Empty;
            }
            this.lblAccNum.Text = dr["accession_number"].ToString().ToUpper();
            this.lblAuthor.Text = (string)dr["author"];
            this.lblTitle.Text = (string)dr["title"];
            this.lblDocNum.Text = (string)dr["document_number"];
            this.lblDocDate.Text = (string)dr["document_date"];
            this.lblDocYear.Text = Convert.ToString(dr["document_year"]);
            this.lblDocType.Text = (string)dr["document_type"];
            this.lblLoc.Text = (string)dr["location"];
            this.lblCompSource.Text = (string)dr["company_source"];
            this.lblAbstract.Text = (string)dr["abstract"];
            this.lblDescriptors.Text = (string)dr["descriptors"];

        }

        ds = null;
        HighLight();
    }


    protected void PopulateFormOld(string connstr)
    {
        mAccNum = Request.QueryString["id"].ToString().Trim();
        string stmt = String.Format("SELECT * FROM vw_chardoc_MainFull WHERE accession_number = '{0}'", mAccNum);
        SqlConnection cn = new SqlConnection(connstr);
        DataSet ds = new DataSet();
        cn.Open();
        SqlCommand cmd = new SqlCommand(stmt, cn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        cn.Close();
        cn = null;

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];

                this.hlImageFile.NavigateUrl = String.Empty;
                this.hlImageFile.Text = String.Empty;
                this.hlImageFile.ToolTip = String.Empty;
            
            this.lblAccNum.Text = dr["accession_number"].ToString().ToUpper();
            this.lblAuthor.Text = (string)dr["author"];
            this.lblTitle.Text = (string)dr["title"];
            this.lblDocNum.Text = (string)dr["document_number"];
            this.lblDocDate.Text = (string)dr["document_date"];
            this.lblDocYear.Text = Convert.ToString(dr["document_year"]);
            this.lblDocType.Text = (string)dr["document_type"];
            this.lblLoc.Text = (string)dr["location"];
            this.lblCompSource.Text = (string)dr["company_source"];
            this.lblAbstract.Text = (string)dr["abstract"];
            this.lblDescriptors.Text = (string)dr["descriptors"];

        }

        ds = null;
        HighLight();
    }
}
