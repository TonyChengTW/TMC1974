<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DDRYMD.aspx.vb" Inherits="DDRYMD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>未命名頁面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <P align="center"><FONT face="新細明體">以程式控制的方式產生下拉式日期選單</FONT></P>
   <FONT face="新細明體">
    <P>
     <asp:DropDownList id="DDLYear" runat="server" AutoPostBack="True"></asp:DropDownList>年
     <asp:DropDownList id="DDLMonth" runat="server" AutoPostBack="True">
      <asp:ListItem Value="1">1</asp:ListItem>
      <asp:ListItem Value="2">2</asp:ListItem>
      <asp:ListItem Value="3">3</asp:ListItem>
      <asp:ListItem Value="4">4</asp:ListItem>
      <asp:ListItem Value="5">5</asp:ListItem>
      <asp:ListItem Value="6">6</asp:ListItem>
      <asp:ListItem Value="7">7</asp:ListItem>
      <asp:ListItem Value="8">8</asp:ListItem>
      <asp:ListItem Value="9">9</asp:ListItem>
      <asp:ListItem Value="10">10</asp:ListItem>
      <asp:ListItem Value="11">11</asp:ListItem>
      <asp:ListItem Value="12">12</asp:ListItem>
     </asp:DropDownList>月
     <asp:DropDownList id="DDLDate" runat="server"></asp:DropDownList>日</P>
   </FONT>

    </div>
    </form>
</body>
</html>
