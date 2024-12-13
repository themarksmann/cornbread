<%@ Page Language="C#" AutoEventWireup="true" Debug="true" ValidateRequest="false" CodeFile="AddSummary.aspx.cs" Inherits="AddSummary" %>

<%@ Register Src="CtrlBanner.ascx" TagName="CtrlBanner" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Chardoc [v3]- Add Summary</title>
    <link href="styles/chardoc3.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/prototype.js"></script> 
     <script type="text/javascript" src="scripts/detailscreens.js"></script> 
    <script type="text/javascript">
function highlight(strHigh) { 
  var r;
  var i;
  if(strHigh) {
    r=document.body.createTextRange();
    for(i=0;r.findText(strHigh);i++) {
      r.execCommand('BackColor','','silver');
      r.collapse(false);
    }
  }
}

function test()
{
/*
    try
    {
    $('txtAccNum').value = 'F00002';
    $('txtTitle').value = 'This is a fake title';
    $('txtAuthor').value = 'LEFEVRE M J';
   $('txtDocDate').value = '1/1/2007';
   $('txtDocNum').value = 'F00-231';
   $('txtDocYear').value = '2007';
   $('txtDocType').value = 'Fake';
   $('txtCompSource').value = 'INVISTA';
   $('txtLoc').value = 'Charlotte';
   $('txtAbstract').value = 'Polyester is a category of polymers, ' +
        'or, more specifically condensation polymers, ' + 
        'which contain the ester functional group in their main chain. Usually, polyester refers ' +
        'to cloth woven from polyester fiber. Polyester clothing is generally considered ' +
        'to have a "less natural" feeling to it compared to natural fibers. Polyester ' +
        'fibers are often spun together with fibers of cotton, producing a cloth with some' +
        'of the better properties of each.';
    $('txtDescriptors').value = 'Polyester ; INVISTA';
     }
     catch(e)
     {
     
     }
     */
   
    //alert('done');
    //$('FormView1$txtAcc').value = 'F00001';
}
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="sectionMain">
        <uc1:CtrlBanner ID="CtrlBanner1" runat="server" ScreenName="View Summary" />

        <br />
    <table border="1" width="770" cellpadding="2" bordercolor="#999999"   
    style="border-collapse: collapse; background-color: #EEE">
        <tr>
            <td align="right" nowrap="nowrap" width="140" valign="top">
                <strong>Accession Number:</strong></td>
            <td width="630">
                <asp:TextBox ID="txtAccNum" runat="server" Text='<%# Eval("ACCESSION_NUMBER") %>'>
                </asp:TextBox></td>
        </tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Title:</strong>
        </td>
		<td width="630">
                <asp:TextBox ID="txtTitle" runat="server" Text='<%# Eval("title") %>' Width="490px" Rows="3" TextMode="MultiLine"></asp:TextBox></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Author:</strong></td>
		<td width="630">
                <asp:TextBox ID="txtAuthor" runat="server" Text='<%# Eval("author") %>' Width="490px" Rows="1" TextMode="MultiLine"></asp:TextBox></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">&nbsp;<strong>Document Number:</strong></td>
		<td width="630">
                <asp:TextBox ID="txtDocNum" runat="server" Text='<%# Eval("document_number") %>' Width="490px" Rows="1" TextMode="MultiLine"></asp:TextBox></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Document Date:</strong></td>
		<td width="630">
                <asp:TextBox ID="txtDocDate" runat="server" Text='<%# Eval("document_date") %>' Width="490px" Rows="1" TextMode="MultiLine"></asp:TextBox></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Document Year:</strong></td>
		<td width="630">
                <asp:TextBox ID="txtDocYear" runat="server" Text='<%# Eval("document_year") %>' Width="490px" Rows="1" TextMode="MultiLine"></asp:TextBox></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Company Source:</strong></td>
		<td width="630">
                <asp:TextBox ID="txtCompSource" runat="server" Text='<%# Eval("company_source") %>' Width="490px" Rows="1" TextMode="MultiLine"></asp:TextBox></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Location:</strong></td>
		<td width="630">
                <asp:TextBox ID="txtLoc" runat="server" Text='<%# Eval("location") %>' Width="490px" Rows="1" TextMode="MultiLine"></asp:TextBox></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">&nbsp;<strong>Document Type:</strong></td>
		<td width="630">
                <asp:TextBox ID="txtDocType" runat="server" Text='<%# Eval("document_type") %>' Width="490px" Rows="1" TextMode="MultiLine"></asp:TextBox></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Abstract:</strong></td>
		<td width="630">
                <asp:TextBox ID="txtAbstract" runat="server" Text='<%# Eval("abstract") %>' Rows="7" TextMode="MultiLine" Width="490px"></asp:TextBox></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">&nbsp;<strong>Descriptors:</strong></td>
		<td width="630">
                <asp:TextBox ID="txtDescriptors" runat="server" Text='<%# Eval("descriptors") %>' Rows="7" TextMode="MultiLine" Width="490px"></asp:TextBox></td>
	</tr>
	<tr>
        <td align="right" colspan="2" valign="top">
            &nbsp;<asp:Button ID="btnSave" runat="server" 
		CausesValidation="True" CommandName="Save"
                    Text="Save" CssClass="sbutton" OnClick="btnSave_Click" />
                    &nbsp;<asp:Button ID="btnClear" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Clear" CssClass="sbutton" OnClick="btnClear_Click" />
                &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" CssClass="sbutton" OnClick="btnCancel_Click" />
            &nbsp;
        </td>
	</tr>
	<tr>
		<td width="140" align="right" valign="top">&nbsp;</td>
		<td width="630">&nbsp;&nbsp;
        </td>
	</tr>
</table>

    </div>

 
    </form>
</body>
</html>
