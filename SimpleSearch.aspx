<%@ Page Language="C#" AutoEventWireup="true" Buffer="True" CodeFile="SimpleSearch.aspx.cs" Inherits="SimpleSearch" %>

<%@ Register Src="CtrlBanner.ascx" TagName="CtrlBanner" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Simple Search</title>
    <link href="styles/chardoc3.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="sectionMain">
        <uc1:CtrlBanner ID="CtrlBanner1" runat="server" ScreenName="Simple Search" />
        <br />
        <br />
        <asp:TextBox ID="txtSearch" runat="server" Width="400px"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />&nbsp;<br />
        <br />
        <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="False" CellPadding="3" PageSize="20" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="accession_number" DataNavigateUrlFormatString="ViewSummary.aspx?id={0}"
                    DataTextField="accession_number" HeaderText="Accession #" />
                <asp:BoundField DataField="author" HeaderText="Authors">
                    <ItemStyle Wrap="True" Width="120px" />
                </asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Title">
                    <ItemStyle Wrap="False" Width="300px" />
                </asp:BoundField>
                <asp:BoundField DataField="DOCUMENT_NUMBER" HeaderText="Document #">
                    <ItemStyle Width="90px" />
                </asp:BoundField>
                <asp:BoundField DataField="DOCUMENT_YEAR" HeaderText="Year" />
                <asp:TemplateField HeaderText="File">
                    <ItemTemplate>
                    <%# Eval("url2") %>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="Gainsboro" />
        </asp:GridView>
        <br />
        <br />
        <asp:TextBox ID="txtHack" runat="server" CssClass="hideme"></asp:TextBox></div>
    </form>
</body>
</html>
