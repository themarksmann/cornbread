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


public partial class AddSummary : System.Web.UI.Page
{
    protected string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["CharDoc3"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        //string accnum;
        this.CtrlBanner1.ScreenName = "Add Summary";

        if (this.IsPostBack == false)
        {
            //accnum = Request.QueryString["id"].ToString().Trim();
            //string stmt = String.Format("SELECT * FROM vw_chardoc_MainFull WHERE accession_number = '{0}'", accnum);
            //SqlConnection cn = new SqlConnection(cnStr);
            //DataSet ds = new DataSet();
            //cn.Open();
            //SqlCommand cmd = new SqlCommand(stmt, cn);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //da.Fill(ds);
            //cn.Close();

            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    DataRow dr = ds.Tables[0].Rows[0];
            //    this.txtAccNum.Text = dr["accession_number"].ToString().ToUpper();
            //    this.txtAuthor.Text = (string)dr["author"];
            //    this.txtTitle.Text = (string)dr["title"];
            //    this.txtDocNum.Text = (string)dr["document_number"];
            //    this.txtDocDate.Text = (string)dr["document_date"];
            //    this.txtDocYear.Text = Convert.ToString(dr["document_year"]);
            //    this.txtDocType.Text = (string)dr["document_type"];
            //    this.txtLoc.Text = (string)dr["location"];
            //    this.txtCompSource.Text = (string)dr["company_source"];
            //    this.txtAbstract.Text = (string)dr["abstract"];
            //    this.txtDescriptors.Text = (string)dr["descriptors"];

            //}
        }

        
        

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string stmt = "sp_chardoc_InsertArticle";
        //SELECT * FROM vw_chardoc_MainFull WHERE accession_number = '{0}'", accnum);
        SqlConnection cn = new SqlConnection(cnStr);  
        SqlCommand cmd = new SqlCommand(stmt, cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@accession_number",this.txtAccNum.Text.ToUpper());
        cmd.Parameters.AddWithValue("@title", this.txtTitle.Text);
        cmd.Parameters.AddWithValue("@author",this.txtAuthor.Text);
        cmd.Parameters.AddWithValue("@document_number",this.txtDocNum.Text);
        cmd.Parameters.AddWithValue("@document_date",this.txtDocDate.Text);
        cmd.Parameters.AddWithValue("@document_year",this.txtDocYear.Text);
        cmd.Parameters.AddWithValue("@company_source",this.txtCompSource.Text);
        cmd.Parameters.AddWithValue("@location",this.txtLoc.Text);
        cmd.Parameters.AddWithValue("@document_type",this.txtDocType.Text);
        cmd.Parameters.AddWithValue("@descriptors",this.txtDescriptors.Text);
        cmd.Parameters.AddWithValue("@abstract",this.txtAbstract.Text);


        DataSet ds = new DataSet();
        cn.Open();

        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (System.Data.SqlClient.SqlException sqlex)
        {
            //Response.Write(sqlex.Number);
            switch (sqlex.Number)
            {
                case 8152:
                    this.ClientScript.RegisterClientScriptBlock(this.GetType(), "toomuch", "sendAlert(1);", true);
                    break;
                case 2601:
                    this.ClientScript.RegisterClientScriptBlock(this.GetType(), "dupe", "sendAlert(2);", true);
                    break;
                case 8114:
                    this.ClientScript.RegisterClientScriptBlock(this.GetType(), "dy", "sendAlert(3);", true);
                    break;
                default:
                    string alrt = "alert('There was an uncaught SQL error: " + sqlex.Number.ToString() + "');";
                    this.ClientScript.RegisterClientScriptBlock(this.GetType(), "toomuch",alrt, true);
                    break;
            }
           
            return;
        }
        cn.Close();
        cn = null;
        
        Response.Redirect("ViewSummary.aspx?id=" + Server.UrlEncode(this.txtAccNum.Text));
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(Config.BaseUrl);

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        this.txtAccNum.Text = "";
        this.txtAuthor.Text = "";
        this.txtTitle.Text = "";
        this.txtDocNum.Text = "";
        this.txtDocDate.Text = "";
        this.txtDocYear.Text = "";
        this.txtDocType.Text = "";
        this.txtLoc.Text = "";
        this.txtCompSource.Text = "";
        this.txtAbstract.Text = "";
        this.txtDescriptors.Text = "";
    }
}
