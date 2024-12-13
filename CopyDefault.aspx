<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="CopyDefault.aspx.cs" debug="true" Inherits="CopyDefault" ValidateRequest="false" %>

<%@ Register Src="CtrlBanner.ascx" TagName="CtrlBanner" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>CharDoc3 - Advanced Search</title>
    <link href="styles/chardoc3.css" rel="stylesheet" type="text/css" />
    
<script type="text/javascript">
function grabAuthor(val)
{
  if (document.getElementById('txtAuthor').value == "") {
      document.getElementById('txtAuthor').value = '"' + val + '"';
  } else {
    document.getElementById('txtAuthor').value = document.getElementById('txtAuthor').value + ' OR "' + val + '"';
  }
}    
</script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"  />
    
    <div id="sectionMain">
        <uc1:CtrlBanner ID="CtrlBanner1" runat="server" />

    <table border="0" cellpadding="2" cellspacing="0" class="tblTool" style="border-collapase: collapse; width: 770px">
            <tr>
                <td align="right" class="mainframeR" nowrap="nowrap" valign="top" width="130">
                    </td>
                <td align="left" valign="top" width="420" nowrap>
                    &nbsp;</td>
                <td align="left" rowspan="8" valign="top" width="220">
                    &nbsp;<input ID="txtFilterNames" type="text" runat="server" style="width:170px" value=""
      onkeyup="document.getElementById('txtHiddenAuthorFilter').value=this.value;document.getElementById('btnHiddenAuthorRefresh').click();" /><br />
                    <asp:UpdatePanel ID="upnlAuthors" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <select id="selAuthors" runat="server" size="16" style="width: 180px"
                     onchange="grabAuthor(this.value);" onkeyup="grabAuthor(this.value);">       
                                      <option selected="selected"></option>
                     </select>
                     </ContentTemplate>
                     <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnHiddenAuthorRefresh" EventName="Click" />
                     </Triggers>
                    </asp:UpdatePanel>
                    <asp:TextBox ID="txtHiddenAuthorFilter" runat="server" Width="170px" CssClass="hideme"></asp:TextBox>
                    <asp:Button ID="btnHiddenAuthorRefresh" runat="server" OnClick="Button1_Click" Text="Button" CssClass="hideme" /></td>
            </tr>
            <tr>
                <td align="right" class="mainframeR" nowrap="nowrap" valign="top" width="130">
                    </td>
                <td align="left" valign="top" width="420" nowrap>
                    </td>
            </tr>
            <tr>
                <td align="right" class="mainframeR" nowrap="nowrap" valign="top" width="130">
                    </td>
                <td align="left" valign="top" width="420" nowrap>
                    </td>
            </tr>
            <tr>
                <td align="right" class="mainframeR" nowrap="nowrap" valign="top" width="130">
                    </td>
                <td align="left" valign="top" width="420" nowrap>
                    </td>
            </tr>
            <tr>
                <td align="right" class="mainframeR" nowrap="nowrap" valign="top" width="130">
                    </td>
                <td align="left" valign="top" width="420" nowrap>
                    </td>
            </tr>
            <tr>
                <td align="right" class="mainframeR" nowrap="nowrap" valign="top" width="130">
                    </td>
                <td align="left" valign="top" width="420" nowrap>
                    </td>
            </tr>
            <tr>
                <td align="right" class="mainframeR" nowrap="nowrap" valign="top" width="130">
                    </td>
                <td align="left" valign="top" width="420" nowrap>
                    </td>
            </tr>
            <tr>
                <td align="right" class="mainframeR" nowrap="nowrap" valign="top" width="130">
                    </td>
                <td align="left" valign="top" width="420" nowrap>
                </td>
            </tr>
        </table>
        <br />
        <br />
        </div>
    </form>
</body>
</html>
