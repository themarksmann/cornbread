<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Authors.aspx.cs" Inherits="Authors" %>
<%@ OutputCache Duration="10" VaryByParam="none" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chardoc [v3]- Author List</title>
    <link href="styles/chardoc3.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/prototype.js"></script>
    <script type="text/javascript">
function grabAuthor(val)
{
  var doc = window.opener.document;
  //alert(doc.title);
  if (doc.getElementById('txtAuthor').value == "") {
      doc.getElementById('txtAuthor').value = '"' + val + '"';
      //$('spnAuthorCond').value = '"' + val + '"';
  } else {
    doc.getElementById('txtAuthor').value = doc.getElementById('txtAuthor').value + ' OR "' + val + '"';
    //$('spnAuthorCond').value = $('spnAuthorCond').value + ' OR "' + val + '"';
  }
  $('spnAuthorCond').innerHTML = doc.getElementById('txtAuthor').value;
}    
function clearAuthors()
{
  var doc = window.opener.document;
  doc.getElementById('txtAuthor').value = '';
  $('spnAuthorCond').innerHTML = '';
}    
	function updateAuthors(sfilter)
	{
	    //alert('go');
        if (sfilter == '') 
        {
            document.getElementById('sectionAuthorSelect').innerHTML = firstList; 
        } else {
            var url = 'UpdateAuthors.ashx';
		    var pars = 'filter=' + sfilter;
		    var myAjax = new Ajax.Request(
			    url, 
			    {
				    method: 'get', 
				    parameters: pars, 
				    onComplete: doResponse
			    });
        } 
	
	}

	function doResponse(originalRequest)
	{
		//put returned XML in the textarea
		//alert('do response');
		var cmd = originalRequest.responseText;
		//$('txtDebug').value = cmd;
		eval(cmd);
	}

    var firstList;
	
	function captureFirstList() 
	{
	    firstList = document.getElementById('sectionAuthorSelect').innerHTML;         
	}
	</script>
</head>
<body onload="$('spnAuthorCond').innerHTML=window.opener.document.getElementById('txtAuthor').value;">
    <form id="form1" runat="server">
        <div>
            <div id="sectionAuthorControls">
            <table border="0" width="360" cellpadding="2" style="border-collapse: collapse">
                <tr>
                    <td align="right" colspan="2" valign="top">
                    <div style="float:left"><a href="javascript:void(0);" onclick="clearAuthors();" 
                    title="clear author search conditions">clear search conditions</a></div>
                    <a href="javascript:void(0);" onclick="window.close();">close window</a>
                    </td>
                </tr>
	<tr>
		<td colspan="2"><h2>Author List</h2></td>
	</tr>
                <tr>
                    <td align="left" colspan="2" valign="top">
                        As you select authors they will appear in the author search conditions.&nbsp; Click
                        close window link to go back to the main search form.</td>
                </tr>
	<tr>
		<td style="width: 130px" align="right" valign="top">
            <em>author filter:</em>&nbsp;</td>
		<td width="220" align="left" valign="top"><input id="txtFilterNames" type="text" runat="server" style="width: 170px"
                    value="" onkeyup="updateAuthors(this.value);" /></td>
	</tr>
	<tr>
		<td style="width: 130px" align="right" valign="top">
            <em>author list:</em>&nbsp;</td>
		<td width="220" align="left" valign="top">                <div id="sectionAuthorSelect">
                    <select id="selAuthors" runat="server" size="16" style="width: 180px" 
                    onchange="grabAuthor(this.value);">
                        <option></option>
                    </select>          </div></td>
	</tr>
	<tr>
		<td align="left" colspan="2" valign="top">
            <em>author search conditions:</em></td>
	</tr>
		<tr>
		<td align="left" colspan="2" valign="top"><span id="spnAuthorCond"></span></td>
	</tr>
	<tr>
		<td style="width: 130px" align="right" valign="top">&nbsp;</td>
		<td width="220" align="left" valign="top">
            <input id="btnClose" name="btnClose"
                   type="button" value="Close" onclick="window.close();" style="display:none" /></td>
	</tr>
</table>
</div>
  
        </div>
    </form>
</body>
</html>
