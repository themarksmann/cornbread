<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomReport.aspx.cs" Inherits="CustomReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
        </asp:GridView>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CharDoc3 %>"
            SelectCommand="">
        </asp:SqlDataSource>
        
        <!--  [document_number], [document_date] -->
    </form>
</body>
</html>
