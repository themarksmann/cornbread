<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SyntaxError.aspx.cs" Inherits="SyntaxError" %>

<%@ Register Src="CtrlBanner.ascx" TagName="CtrlBanner" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Chardoc [v3]-Search Syntax Error</title>
        <link href="styles/chardoc3.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="sectionMain">
        <uc1:CtrlBanner ID="CtrlBanner1" runat="server" />
        <br />
        <br />
<ul>
        <li>Enclose all phrases in quotes: <strong><em>"Black Carbon"</em></strong> </li>
        <li>Enclose all wildcard searches in quotes: <strong><em>"Poly*"</em></strong> The asterisk is ignored when the quotes are not used.</li>
        <li>Use parentheses when grouping things together <strong><em>black and (carbon or color)</em></strong>
        </li>
</ul>
    
    </div>
    </form>
</body>
</html>
