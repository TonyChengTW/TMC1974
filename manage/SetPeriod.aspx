<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SetPeriod.aspx.vb" Inherits="manage_SetPeriod"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <H2>留言版期數設定(帳號密碼與留言版管理相同)</H2>
        
        <table cellspadding="0" cellspacing="0">
            <tr>
                <td>請輸入本期期數</td>
                <td><asp:TextBox ID="txtPeriod" runat="server" MaxLength="3"></asp:TextBox></td>
            </tr>

            <tr>
                <td>請輸入本期開始日期</td>
                <td><asp:TextBox ID="txtStartDate" runat="server" MaxLength="10"></asp:TextBox></td>
            </tr>

            <tr>
                <td>請輸入本期結束日期</td>
                <td><asp:TextBox ID="txtEndDate" runat="server" MaxLength="10"></asp:TextBox></td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="儲存更新" />
                </td>
                <td><a href="http://www.tmc1974.com/manage/">回首頁</a></td>
            </tr> 
        </table>

    </form>
</body>
</html>
