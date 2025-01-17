<%@ Page Language="C#" AutoEventWireup="true" Debug="true" ValidateRequest="false" CodeFile="ViewSummary.aspx.cs" Inherits="ViewSummary" %>

<%@ Register Src="CtrlBanner.ascx" TagName="CtrlBanner" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chardoc [v3]- View Summary</title>
    <link href="styles/chardoc3.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/prototype.js"></script> 
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
function highlight2(str) { 
  var arrLblNames = [ 'lblAccNum','lblTitle',
                      'lblAuthor',
                      'lblDocDate',
                      'lblDocNum',
                      'lblDocYear',
                      'lblDocType',
                      'lblCompSource',
                      'lblLoc',
                      'lblAbstract',
                      'lblDescriptors' ];
  var arrLblVals = [ ];                    
  var pf = '<span class="hit">';
  var sf = '</span>';   
  
  //WAS str = str.replace('*','[0-9a-zA-Z\-]*'); 
  //CAUSED AN ISSUE WITH THE NEXT LINE str = str.replace('-','[\- ]?');
  //str = str.replace("''","\\'");
  //alert(str);
  if (str.indexOf('-') != -1) {
    str = str.replace('-','[\\- ]?');
  } else {
    str = str.replace('*','[0-9a-zA-Z\\-]*');
  }
  //str = str.replace(/([^0-9a-zA-Z])/g,"\\$1");
  //alert(str);
  var re = new RegExp("(\\b" + str + "\\b)","gi");
  
  //alert(str);
  for (i=0;i<arrLblNames.length;i++) {
        arrLblVals[i] = document.getElementById(arrLblNames[i]).innerHTML.replace(re,pf + "$1" + sf);
        document.getElementById(arrLblNames[i]).innerHTML = arrLblVals[i];
        //alert('val:' + arrLblVals[i]);
  }    
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
            <td align="right" nowrap="nowrap" valign="top" width="140">
            &nbsp;</td>
            <td align="right" valign="top" width="630"><asp:HyperLink ID="hlImageFile" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" width="140" valign="top">
                <strong>
                Accession Number:</strong></td>
            <td width="630">
                <asp:Label ID="lblAccNum" runat="server" Text='<%# Eval("ACCESSION_NUMBER") %>' /></td>
        </tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Title:</strong>
        </td>
		<td width="630">
                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("title") %>' Width="490px" /></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Author:</strong></td>
		<td width="630">
                <asp:Label ID="lblAuthor" runat="server" Text='<%# Eval("author") %>' Width="490px" /></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">&nbsp;<strong>Document Number:</strong></td>
		<td width="630">
                <asp:Label ID="lblDocNum" runat="server" Text='<%# Eval("document_number") %>' Width="490px" /></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Document Date:</strong></td>
		<td width="630">
                <asp:Label ID="lblDocDate" runat="server" Text='<%# Eval("document_date") %>' Width="490px" /></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Document Year:</strong></td>
		<td width="630">
                <asp:Label ID="lblDocYear" runat="server" Text='<%# Eval("document_year") %>' Width="490px" /></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Company Source:</strong></td>
		<td width="630">
                <asp:Label ID="lblCompSource" runat="server" Text='<%# Eval("company_source") %>' Width="490px" /></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Location:</strong></td>
		<td width="630">
                <asp:Label ID="lblLoc" runat="server" Text='<%# Eval("location") %>' Width="490px" /></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">&nbsp;<strong>Document Type:</strong></td>
		<td width="630">
                <asp:Label ID="lblDocType" runat="server" Text='<%# Eval("document_type") %>' Width="490px" /></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">
            <strong>
            Abstract:</strong></td>
		<td width="630">
                <asp:Label ID="lblAbstract" runat="server" Text='<%# Eval("abstract") %>' Width="490px" /></td>
	</tr>
	<tr>
		<td width="140" align="right" nowrap="noWrap" valign="top">&nbsp;<strong>Descriptors:</strong></td>
		<td width="630">
                <asp:Label ID="lblDescriptors" runat="server" Text='<%# Eval("descriptors") %>' Width="490px" /></td>
	</tr>

	</table>
	<asp:Panel ID="pnlAdmin" runat="server" BackColor="#CCCCCC">
    <table border="1" width="770" cellpadding="2" bordercolor="#999999" 
    style="border-collapse: collapse;">
	
	<tr>
		<td width="140" align="left" valign="top">
            </td>
		<td width="630" valign="top" align="right">&nbsp;<asp:Button ID="btnEdit" runat="server" CausesValidation="True" CommandName="Edit"
                CssClass="sbutton" OnClick="btnEdit_Click" Text="Edit" />
        </td>
	</tr>
</table>	</asp:Panel>	</div>
        <asp:Label ID="lblSearchWords" runat="server" Text="lblSearchWords"></asp:Label>

 
    </form>
</body>
</html>
