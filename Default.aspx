<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Debug="true" EnableEventValidation="false" 
    Inherits="_Default" ValidateRequest="false" %>
<%@ Register Src="CtrlBanner.ascx" TagName="CtrlBanner" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chardoc [v3]- Search</title>
    <link href="styles/chardoc3.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/prototype.js"></script>
<script type="text/javascript">
    var authWin;
	function authorPopup()
	{
	    var w = '380';
	    var h = '460';
	    var opts = 'width=' + w + ',height=' + h + ',status=yes,toolbar=no,menubar=no,location=no,resizable=yes';
	    authWin = window.open('Authors.aspx?rnd=1','authorWin',opts);
	    authWin.moveTo(500,180);
	}
	function switchChecks(b) 
	{
	    //var arr = document.getElementsByClassName('cbListItem');
	    var arr = document.getElementsByTagName('input');
	    //alert(arr.length);
	    for (var i=0;i<arr.length;i++) {
	        //alert(arr[i].type);
	        if ((arr[i].type == 'checkbox') && (arr[i].className == 'cbListItem')) {
	            //alert('here');
	          arr[i].checked = b;
	        }
	    }
	}
	function authorClose()
	{
	    try {
	       // alert(document.forms[0].action);
	    
	        document.forms[0].action="Default.aspx";
	        authWin.close();	
	    } 
	    catch(e) {
	        //do nothing
	    }
	}
	function fixWildcard() {
	    var re = new RegExp('(\\b[^\\"][0-9a-zA-Z]+\\*[^\\"])');
	      var arrFldNames = [ 'txtAccNumber',
	                  'txtTitle',
                      'txtAuthor',
                      'txtDocNumber',
                      'txtCompanySource',
                      'txtAuthorLoc',
                      'txtFreeText' ];
            var arrFldVals = new Array();
              var pf = '"';
              var sf = '"';   
              for (i=0;i<arrFldNames.length;i++) {
                    //alert(arrFldNames[i]);
                    arrFldVals[i] = document.getElementById(arrFldNames[i]).value.replace(re,pf + "$1" + sf);
                    document.getElementById(arrFldNames[i]).value = arrFldVals[i];
              } 
	}
</script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="sectionMain">
            <uc1:CtrlBanner ID="CtrlBanner1" runat="server" ScreenName="Main Page" />
            <div style="border: solid 1px #111; background-color: #EEE;padding: 0px;">
            <table border="0" cellpadding="2" cellspacing="0" style="width: 770px; padding: 2px">
                                <tr>
                        <td align="left" nowrap="nowrap" valign="top" colspan="2" style="border-bottom:solid 1px #CCC">
                            <strong>Tips:</strong> 1) Enclose all wildcard searches in quotes, e.g., <em><strong>"ester*"</strong></em>;
                            the asterisk is ignored when quotes are not used.<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) Omit parentheses within and/or
                                around search terms, e.g., use <em><strong>bishydroxyethyl</strong></em> <span style="text-decoration:underline">not</span>
                                <em><strong>bis(hydroxyethyl)</strong></em><br />
                            
                        </td>
                        <td align="left" rowspan="11" valign="top" width="200" style="background-color: #DDD">
                            <br />
                                                    <asp:TextBox ID="txtDebug" CssClass="hideme" runat="server" Height="66px" TextMode="MultiLine"
                            Width="20px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" valign="top" width="130">
                            Accession Number:</td>
                        <td align="left" valign="top" width="500" nowrap="nowrap">
                            <asp:TextBox ID="txtAccNumber" runat="server" Width="140px" TabIndex="1"></asp:TextBox></td>
          
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" valign="top" width="130">
                            Title:</td>
                        <td align="left" valign="top" width="500" nowrap="nowrap">
                            <asp:TextBox ID="txtTitle" runat="server" Width="474px" TabIndex="2"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" valign="top" width="130">
                            Author:</td>
                        <td align="left" valign="top" width="500" nowrap="nowrap">
                            <asp:TextBox ID="txtAuthor" runat="server" Width="400px" TabIndex="3"></asp:TextBox>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="authorPopup();">author list</a></td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" valign="top" width="130">
                            Document Number:</td>
                        <td align="left" valign="top" width="500" nowrap="nowrap">
                            <asp:TextBox ID="txtDocNumber" runat="server" Width="474px" TabIndex="4"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" valign="top" width="130">
                            Document Year:</td>
                        <td align="left" valign="top" width="500" nowrap="nowrap">
                            &nbsp;between&nbsp;&nbsp;<asp:TextBox ID="txtDocYearStart" runat="server" Width="80px"
                                TabIndex="5"></asp:TextBox>
                            &nbsp; and &nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtDocYearEnd" runat="server" Width="80px"
                                TabIndex="6"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" valign="top" width="130">
                            Company Source:</td>
                        <td align="left" valign="top" width="500" nowrap="nowrap">
                            <asp:TextBox ID="txtCompanySource" runat="server" Width="474px" TabIndex="7"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" valign="top" width="130">
                            Author Location:</td>
                        <td align="left" valign="top" width="500" nowrap="nowrap">
                            <asp:TextBox ID="txtAuthorLoc" runat="server" Width="474px" TabIndex="8"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" valign="top" width="130">
                            <b>Text:</b><br />
                            <small><i>Includes all Fields,<br />
                                Except Document Year</i></small></td>
                        <td align="left" valign="top" width="500" nowrap="nowrap">
                            <asp:TextBox ID="txtFreeText" runat="server" Height="66px" TextMode="MultiLine" Width="480px"
                                TabIndex="9"></asp:TextBox>
                        </td>
                    </tr>
                <tr>
                    <td align="center" colspan="2" nowrap="nowrap" valign="top">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <asp:CheckBox ID="cboxLimit" runat="server" Checked="True" Text="Limit results to 2000 records. Uncheck to display all." /></td>
                </tr>
                    <tr>
                        <td align="right" nowrap="nowrap" width="130" valign="top">
                            <a href="/chardoc3/Thesaurus/qryAllItems.xls" target="_blank">Thesaurus</a> /&nbsp; <a href="/chardoc3/supportdocs/help.doc"
                                target="_blank">Help</a></td>
                        <td align="left" width="420" valign="top" nowrap>
                            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search"
                                Width="120px" TabIndex="10" OnClientClick="authorClose();" />
                            <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" Width="120px" OnClientClick="authorClose();" />
                            </td>
                    </tr>
                </table>
            </div>
            <table>
                <tr>
                    <td align="left" nowrap="nowrap" style="background-color: #fff" valign="top" colspan="3">
                        <asp:Panel ID="pnlAdmin" runat="server" BackColor="#999999" Width="100%" CssClass="sbutton">
                            &nbsp;<input id="btnAddSummary" type="button" 
                                   onclick="authorClose();window.open('AddSummary.aspx','_top');" value="Add New" class="sbutton" />
                            <input id="btnViewNew" type="button" 
                                   onclick="authorClose();var accnum=prompt('What is the Accession Number of the case you would like to view?');window.navigate('ViewSummary.aspx?id='+accnum+'&h=0');" value="View New" class="sbutton" />
                            &nbsp; 
                        <asp:Button id="btnDeleteChecked" runat="server" CssClass="sbutton" PostBackUrl="~/deleteabstracts.aspx" OnClientClick="authorClose();" Text="Delete Checked" />
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</asp:Panel>&nbsp;</td>
                </tr>
                <tr>
                    <td align="right" nowrap="nowrap" width="130" valign="top" style="background-color: #fff">
                    </td>
                    <td align="left" width="420" valign="top" nowrap style="background-color: #fff">
</td>
                    <td align="left" valign="top" width="220" style="background-color: #fff">
                        <asp:Label ID="lblRecordCount" runat="server"></asp:Label><br />
                        <br />
                        <asp:Literal ID="litLimit" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                    <td align="left" colspan="3" nowrap="nowrap" style="background-color: #fff" valign="top">
                        <input id="btnCheckAll" style="width: 120px" type="button" value="Check All" onclick="switchChecks(true);" runat="server" />
                        <input id="btnUncheckAll" style="width: 120px" type="button" value="Uncheck All" onclick="switchChecks(false);" runat="server" />
                        <asp:Button ID="btnExportExcel" runat="server" OnClick="btnExportExcel_Click" PostBackUrl="ExportExcel.ashx?ft=.xls"
                            Text="Output Checked Items (Title Format) to Excel" ToolTip="Export selected items to Excel" Width="250px" />
                        <asp:Button ID="btnExportWord" runat="server" OnClick="btnExportExcel_Click" PostBackUrl="ExportWord.ashx?ft=.doc"
                            Text="Output Checked Items (Abstracts Only) to a File" ToolTip="Export selected items to Word" Width="250px" />&nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="False" CellPadding="3"
                PageSize="20"
                GridLines="Vertical" AllowSorting="True" BackColor="White" 
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate><input type="checkbox" name="cboxSelect" class="cbListItem" value="<%# "|" + Eval("accession_number") + "|" %>" /></ItemTemplate>
                        <ItemStyle Width="40px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="ACCESSION_NUMBER" HeaderText="Accession #" SortExpression="ACCESSION_NUMBER">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="author" HeaderText="Authors" SortExpression="Author">
                        <ItemStyle Wrap="True" Width="120px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="TITLE">
                        <ItemStyle Wrap="False" Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DOCUMENT_NUMBER" HeaderText="Document #" SortExpression="DOCUMENT_NUMBER">
                        <ItemStyle Width="150px" />
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DOCUMENT_YEAR" HeaderText="Year" SortExpression="DOCUMENT_YEAR" />
                    <asp:TemplateField HeaderText="Abstract" ControlStyle-Width="60">
                        <ItemTemplate>
                             <a href="<%# "ViewSummary.aspx?id=" + Eval("ACCESSION_NUMBER") %>">Abstract</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image" SortExpression="URL2" ControlStyle-Width="60" 
                    HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("url2") %>
                        </ItemTemplate>
                        <ItemStyle Width="60px" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <RowStyle BackColor="#DDDDDD" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
                <EmptyDataTemplate></EmptyDataTemplate>
            </asp:GridView>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
