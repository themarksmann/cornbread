using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Typical.Data;

    
public partial class CopyDefault : System.Web.UI.Page 
{
    protected string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["CharDoc3"].ConnectionString;
    protected DataSet dsAuthors;
    protected DataSet dsResults;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (this.IsPostBack == false)
        {
            LoadAuthors(String.Empty);
        }

    }




  
    protected void LoadAuthors(string searchPrefix)
    {

        SqlDataAction dact = new SqlDataAction(cnStr);
        dact.OpenConnection();
        string stmt;
        if (searchPrefix == String.Empty)
        {
            stmt = "SELECT * FROM tblAuthor ORDER BY varAuthor";
        }
        else
        {
            stmt = String.Format("SELECT * FROM tblAuthor WHERE varAuthor LIKE '{0}%' ORDER BY varAuthor",searchPrefix);
        }
        dsAuthors = dact.ExecuteDataSet(stmt);
        dact.CloseConnection();
        selAuthors.DataTextField = "varAuthor";
        selAuthors.DataValueField = "varAuthor";
        selAuthors.DataSource = dsAuthors.Tables[0];
        selAuthors.DataBind();

    }
    //protected void txtFilterNames_TextChanged(object sender, EventArgs e)
    //{
    //    LoadAuthors(txtFilterNames.Value);
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        LoadAuthors(txtFilterNames.Value);
    }
}
