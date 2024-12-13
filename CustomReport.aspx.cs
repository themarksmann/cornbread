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

public partial class CustomReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.SqlDataSource1.SelectCommand = "SELECT TOP 200 LOWER(word_text) as word, count(8) as ct " +
            "FROM tbl_chardoc_Words " +
            "GROUP BY word_text ORDER BY ct DESC";

    }
}
