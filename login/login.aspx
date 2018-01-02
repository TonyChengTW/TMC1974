<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <table>
            <tr>
                <td>帳號</td>
                <td><asp:TextBox ID="txtAccount" runat="server" MaxLength="10"></asp:TextBox></td>
            </tr>
            <tr>
                <td>密碼</td>
                <td><asp:TextBox ID="txtPwd" runat="server" MaxLength="10" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td>確認密碼</td>
                <td><asp:TextBox ID="txtRePwd" runat="server" MaxLength="10" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="btnSave" runat="server" Text="登入留言版" /></td>
            </tr>
        </table>
        <input type="hidden" name="fromurl" value="<%=Request("fromurl")%>" />
    </form>
</body>
</html>
