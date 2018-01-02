<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LogonGbook.aspx.vb" Inherits="Default7" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="請輸入密碼(密碼是1974)"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="確認" />
    
    </div>
    <p>
        <asp:Label ID="Label2" runat="server" Font-Size="Large" ForeColor="Red" 
            Text="密碼錯誤" Visible="False" ></asp:Label>
    </p>
    </form>
</body>
</html>
