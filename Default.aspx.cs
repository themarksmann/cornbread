using System;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using Typical.Data;

    
public partial class _Default : System.Web.UI.Page 
{
    protected string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["TIC/CharDoc3"].ConnectionString;
    protected DataSet dsAuthors;
    protected DataSet dsResults;

    protected void Page_Init(object sender, EventArgs e)
    {
        //this.CtrlBanner1.ScreenName = "Main Page";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Response.Buffer = true;
        this.Response.BufferOutput = true;


        this.gvResults.Sorting += new GridViewSortEventHandler(gvResults_Sorting);
        this.gvResults.DataBound += new EventHandler(gvResults_DataBound);
        if (this.IsPostBack == false)
        {
            //LoadAuthors(String.Empty);
            this.btnExportExcel.Visible = false;
            this.btnExportWord.Visible = false;
            this.btnCheckAll.Visible = false;
            this.btnUncheckAll.Visible = false;
        }
        else
        {
            //this.txtFilterNames.Value = "";
        }

        //sec level
        this.pnlAdmin.Visible = (this.CtrlBanner1.SecurityLevel > 1);
        //Response.Write(this.CtrlBanner1.SecurityLevel.ToString());


    }

    void gvResults_DataBound(object sender, EventArgs e)
    {
        this.btnExportExcel.Visible = (gvResults.Rows.Count > 0);
        this.btnExportWord.Visible = (gvResults.Rows.Count > 0);
        this.btnCheckAll.Visible = (gvResults.Rows.Count > 0);
        this.btnUncheckAll.Visible = (gvResults.Rows.Count > 0);

        //if (gvResults.Rows.Count > 0)
        //{
        //    this.btnExportExcel.Visible = true;

        //}
        //else
        //{
        //    this.btnExportExcel.Visible = false;
        //}
        //throw new Exception("The method or operation is not implemented.");
    }

    void gvResults_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataSet ds = (DataSet) this.Session["msr"];
        DataView dv = ds.Tables[0].DefaultView;
        dv.Sort = e.SortExpression + " ASC";
        //Response.Write(e.SortExpression + " ASC");
        gvResults.DataSource = dv;
        gvResults.DataBind();
        //throw new Exception("The method or operation is not implemented.");
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlDataAction dact = new SqlDataAction(cnStr);

        string sqlUsage = "INSERT INTO dbo.tbl_chardoc_Usage (use_type, ntlogon, created_dt) \n" +
                             "VALUES ('search', '" + this.Request.LogonUserIdentity.Name +
                             "', GETDATE())";

        SqlBuilderChardoc sbc = new SqlBuilderChardoc();
        dact.OpenConnection();
        dact.ExecuteNonQuery(sqlUsage);
        
        string stmtct = sbc.GetAdvancedStmtCount(txtAccNumber.Text, txtTitle.Text, txtAuthor.Text,
            txtDocNumber.Text, txtDocYearStart.Text, txtDocYearEnd.Text,
            txtCompanySource.Text, txtAuthorLoc.Text, txtFreeText.Text);
        //System.IO.File.WriteAllText(MapPath(".") + "\\log\\stmtct.txt",stmtct);

        int reclimit = 2000;
        int ct = 0;
        try
        {
            ct = (int)dact.ExecuteScalar(stmtct);
        }
        catch (Exception ex)
        {
            dact.CloseConnection();
            Response.Redirect("SyntaxError.aspx");

        }
        finally
        {

        }
        
        string stmt;
        if ((ct >= reclimit) && (this.cboxLimit.Checked))
        {
            stmt = sbc.GetAdvancedStmt(false,txtAccNumber.Text, txtTitle.Text, txtAuthor.Text,
            txtDocNumber.Text, txtDocYearStart.Text, txtDocYearEnd.Text,
            txtCompanySource.Text, txtAuthorLoc.Text, txtFreeText.Text);
            lblRecordCount.Text = ct.ToString() + " records found. 2000 displayed.";
            //this.ClientScript.RegisterClientScriptInclude("lmit", "scripts/limit.js");
            this.litLimit.Mode = LiteralMode.PassThrough;
            this.litLimit.Text = String.Empty; //"<script type=\"text/javascript\" src=\"scripts/limit.js\"></script>";

        } 
        else
        {
            stmt = sbc.GetAdvancedStmt(true,txtAccNumber.Text, txtTitle.Text, txtAuthor.Text,
            txtDocNumber.Text, txtDocYearStart.Text, txtDocYearEnd.Text,
            txtCompanySource.Text, txtAuthorLoc.Text, txtFreeText.Text);
            lblRecordCount.Text = String.Format("{0} records found. {0} displayed.",ct);
            this.litLimit.Text = String.Empty;
        }

        
        txtDebug.Text = stmt;

        //string stmt = String.Format("SELECT * FROM vw_CharDoc WHERE [Author] LIKE '%{0}%' ORDER BY Author", txtSearch.Text);
        dsResults = dact.ExecuteDataSet(stmt);
        this.Session["msr"] = dsResults;

        dact.CloseConnection();
        dact = null;


        if (dsResults.Tables[0].Rows.Count > ct)
        {
            
            string cs = " var c = confirm('This query returned " + dsResults.Tables[0].Rows.Count.ToString() +
                    " records. Do you want to display them?');\n" +
                    " if (c == false) window.history.go(-1);\n";
            //this.ClientScript.RegisterStartupScript(this.GetType(), "RecordCount", cs, true);
        }

        //DataView dv = dsResults.Tables[0].DefaultView;

        gvResults.DataSource = dsResults.Tables[0];
        gvResults.DataBind();
        //Response.Write(stmt);
        //Response.Write(stmt);
        //lblRecordCount.Text = dsResults.Tables[0].Rows.Count.ToString() + " Records Found";

        //Search Words
        string prehw = txtAccNumber.Text + " " + txtTitle.Text + " " + txtAuthor.Text + " " +
            txtDocNumber.Text + " " + txtDocYearStart.Text + " " + txtDocYearEnd.Text + " " +
            txtCompanySource.Text + " " + txtAuthorLoc.Text + " " + txtFreeText.Text;
        Session["highlight_words"] = prehw.Replace("(", String.Empty).Replace(")", String.Empty);
        //Session["highlight_words"] = prehw;
    
    }



    protected void btnHiddenAuthorRefresh_Click(object sender, EventArgs e)
    {
        //LoadAuthors(txtFilterNames.Value);
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        this.txtAccNumber.Text = "";
        this.txtAuthor.Text = "";
        this.txtTitle.Text = "";
        this.txtAuthorLoc.Text = "";
        this.txtCompanySource.Text = "";
        this.txtDocNumber.Text = "";
        this.txtDocYearStart.Text = "";
        this.txtDocYearEnd.Text = "";
        this.txtFreeText.Text = "";

        this.cboxLimit.Checked = true;

        //this.txtFilterNames.Value = "";

        this.lblRecordCount.Text = "";
        this.gvResults.DataSource = null;
        this.gvResults.DataBind();

    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {

    }
}
