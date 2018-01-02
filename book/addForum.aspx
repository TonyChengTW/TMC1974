<%@ Page Language="VB" AutoEventWireup="false" CodeFile="addForum.aspx.vb" Inherits="addForum" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>台北健言社討論區新增主題</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td align="center" style="width: 100%; background-color: #ffffcc; text-align: center">
                    <strong><span style="font-size: 24pt">健言社四不：不談商業(廣告)、色情、宗教、政治</span></strong>
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td align="center" style="width: 100%; background-color: #ffffcc; text-align: left">
                    歡迎您來到健言留言版<br />
                    留言時請遵守健言四不談：不談商業、不談色情、不談宗教、不談政治<br />
                    本社有權刪除不當留言，敬請見諒，謝謝合作！
                </td>
            </tr>
        </table>
        <br />
        <table border="1" cellpadding="0" cellspacing="0" style="font-size: 12pt; width: 80%;
            font-family: Times New Roman; background-color: #ffffcc">
            <tr>
                <td style="width: 110px; color: #ffffff; background-color: green; text-align: left">
                    <span>姓名</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_who" runat="server" Width="250px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                        ID="Requir_name" runat="server" ControlToValidate="Txt_who" ErrorMessage="請輸入姓名"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="Requir_msg" runat="server" ControlToValidate="Txt_msg"
                        ErrorMessage="請輸入內容"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>標題</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_subject" runat="server" MaxLength="30" Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Requir_subject" runat="server" ControlToValidate="Txt_subject"
                        ErrorMessage="請輸入標題不可超過三十個字"></asp:RequiredFieldValidator><span
                        style="color: #ff0066"></span></td>
            </tr>
            <tr>
                <td style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>表情</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:Panel ID="Panel1" runat="server" BackColor="#C0FFC0" Height="57px" Width="489px">
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>內容<br />
                    </span>
                </td>
                <td colspan="3" rowspan="2" style="text-align: left">
                    <asp:TextBox ID="Txt_msg" runat="server" AutoCompleteType="Disabled" Height="300px"
                        TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>郵件</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_email" runat="server" Width="400px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txt_email"
                        ErrorMessage="您的E-Mail格式不對" ValidationExpression="[\w]+@[\w]+\.(com|ent|edu|org)[\w\.]*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>電話</span></td>
                <td colspan="3" rowspan="2" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_tel" runat="server" Width="250px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txt_tel"
                        ErrorMessage="您輸入電話格式不對" ValidationExpression="[0][1-9]\d{7,8}"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td rowspan="1" style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    網站</td>
                <td colspan="3" rowspan="1" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_web" runat="server" Width="397px"></asp:TextBox><asp:RegularExpressionValidator
                        ID="RegularExpressionValidator3" runat="server" ControlToValidate="Txt_web" ErrorMessage="您輸網址格式不對"
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td rowspan="1" style="width: 49px; color: #ffffff; background-color: green; text-align: left; height: 26px;">
                </td>
                <td colspan="3" rowspan="1" style="background-color: #ffffcc; text-align: center; height: 26px;">
                    <asp:Button ID="Button1" runat="server" OnClick="AddData" Text="送出" />
                    <asp:Button ID="Btn_Clear" runat="server" OnClick="Button2_Click" Text="清除" />
                    <asp:Button ID="Btn_Post" runat="server" CausesValidation="False" Text="回首頁" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
