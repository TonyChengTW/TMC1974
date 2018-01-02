<%@ Page Language="VB" AutoEventWireup="false" CodeFile="boardcount.aspx.vb" Inherits="Testcount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>討論區排行榜</title>
</head>
<body>
    <form id="form1" runat="server">

        <table border="0" cellpadding="0" cellspacing="0" style="width: 80%" align="center">
            <tr>
                <td align="center" style="width: 100% ">姓名前面不留空白，留言姓名一致，留言排行榜筆數才會一樣!!!!</td>
            </tr>
        </table>
        <br />
        <asp:Literal ID="lifirstTable" runat="server"></asp:Literal>
        <asp:Literal ID="litable1" runat="server"></asp:Literal>
        <asp:Literal ID="litable2" runat="server"></asp:Literal>
        <asp:Literal ID="litable3" runat="server"></asp:Literal>

    </form>
</body>
</html>
