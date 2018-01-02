<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Userlogin.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>登入頁面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Login ID="MyLogin" runat="server" DestinationPageUrl="~/Admin/boardAdmin.aspx">
        <LayoutTemplate>
            <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" id="TABLE1" language="javascript" onclick="return TABLE1_onclick()">
                            <tr>
                                <td align="center" colspan="2">
                                    登入</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server">使用者名稱:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="必須提供使用者名稱。" ToolTip="必須提供使用者名稱。" ValidationGroup="MyLogin">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server">密碼:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="必須提供密碼。" ToolTip="必須提供密碼。" ValidationGroup="MyLogin">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="記憶密碼供下次使用。" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: red">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="登入" ValidationGroup="MyLogin" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>
    </div>
    </form>
</body>
</html>
