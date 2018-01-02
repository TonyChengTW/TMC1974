<%@ Page Language="VB" AutoEventWireup="false" CodeFile="board1.aspx.vb" Inherits="Test" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>台北健言社討論區首頁</title>
    <style type="text/css">
        .style1
        {
            width: 103%;
        }
        .新增樣式1
        {
            background-color: #FFFFCC;
        }
        .style2
        {
            height: 32px;
        }
        .style3
        {
            height: 32px;
        }
        .style5
        {
            font-size: medium;
            text-align: center;
        }
        .style6
        {
            height: 32px;
            font-size: medium;
        }
        .style7
        {
            height: 32px;
            font-size: medium;
            width: 16%;
        }
        .style8
        {
            height: 32px;
            width: 241px;
        }
    </style>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div>
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 25%">
                    <asp:HyperLink ID="Hype_Admin" runat="server" Font-Bold="True" Font-Italic="False"
                        Font-Names="Times New Roman" NavigateUrl="~/admin.aspx">管理者登入</asp:HyperLink></td>
            </tr>
        </table>
        <strong><span style="font-size: 48pt; color: #3300ff; font-family: 標楷體">台北健言社討論區首頁</span></strong><br />
        <hr />
        <br />
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
        <asp:AccessDataSource ID="ADS_Insertboard" runat="server" 
            DataFile="~/App_Data/Tmc.mdb" SelectCommand="SELECT         COUNT(*) AS Expr1
FROM             talk
WHERE         (dcreate &gt; #10/1/2008#)"></asp:AccessDataSource>
        <asp:AccessDataSource ID="ADS_Reboard" runat="server" 
            DataFile="~/App_Data/Tmc.mdb" 
            SelectCommand="SELECT COUNT(*) AS Expr1 FROM talkRe WHERE (dcreate &gt; #10/1/2008#)">
        </asp:AccessDataSource>
        <br />
        <table border="0" cellpadding="0" cellspacing="0" width="80%">
            <tr>
                <td class="style7" style="text-align: center; background-color: #FFFFCC">
                                    111期-新增留言</td>
                <td class="style3" style="background-color: #FFFFCC">
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                        DataSourceID="ADS_Insertboard" Height="20px" Width="20px" 
                        style="text-align: center; color: #0000FF">
                        <Fields>
                            <asp:BoundField DataField="Expr1" ShowHeader="False" SortExpression="Expr1" />
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td class="style6" style="text-align: center; background-color: #FFFFCC">
                    &nbsp; +&nbsp; 回覆留言</td>
                <td class="style3" style="background-color: #FFFFCC">
                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                        DataSourceID="ADS_Reboard" Height="20px" 
                        style="text-align: center; color: #0000FF" Width="20px">
                        <Fields>
                            <asp:BoundField DataField="Expr1" ShowHeader="False" SortExpression="Expr1" />
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td class="style3" style="background-color: #FFFFCC">
                    =</td>
                <td class="style3" style="text-align: center; background-color: #FFFFCC">
                    <asp:Label ID="Lab_Count" runat="server" style="color: #0000FF"></asp:Label>
                </td>
                <td class="style8" style="text-align: left; background-color: #FFFFCC">
                    &nbsp;<span class="style5">- 希望達成目標值1000筆 = 尚欠&nbsp;</span></td>
                <td class="style2" style="background-color: #FFFFCC">
                    <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
                        DataSourceID="ADS_totle" Height="20px" 
                        style="text-align: center; color: #0000FF" Width="30px">
                        <Fields>
                            <asp:BoundField DataField="Expr1" ReadOnly="True" ShowHeader="False" 
                                SortExpression="Expr1" />
                        </Fields>
                    </asp:DetailsView>
                </td>
            </tr>
            </table>
        <br />
        <table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr style="color: #000000">
                <td style="background-color: #ffffcc; text-align: left" class="style1">
                    搜尋姓名<asp:TextBox ID="Txt_name" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="搜尋請按我" />&nbsp;
                    <asp:Button ID="Btn_clearsubject" runat="server" Text="清除搜尋" />
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/boardcount.aspx" 
                        Target="_blank">留言排行榜</asp:HyperLink></td>
            </tr>
            <tr style="color: #000000">
                <td style="color: #000000; background-color: #ffffcc; text-align: left" 
                    class="style1">
                    搜尋標題題<asp:TextBox ID="Txt_subject" runat="server"></asp:TextBox>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SelectHelp.aspx" Target="_blank">搜尋說明請按我</asp:HyperLink><span style="color: #0000ff; text-decoration: underline"></span></td>
            </tr>
        </table>
        <asp:AccessDataSource ID="ADS_boradcount" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT         count (*)&#13;&#10;FROM             talk&#13;&#10;WHERE         (dcreate > #10/1/2008#)">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ADS_totle" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT         1000 - COUNT(*) AS Expr1&#13;&#10;FROM             talk&#13;&#10;WHERE         (dcreate > #10/1/2008#)">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT * FROM [talk] WHERE (([who] LIKE '%' + ? + '%') AND ([subject] LIKE '%' + ? + '%')) ORDER BY [newdcreate] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="Txt_name" DefaultValue="%" Name="?" PropertyName="Text" />
                <asp:ControlParameter ControlID="Txt_subject" DefaultValue="%" Name="?" PropertyName="Text" />
            </SelectParameters>
        </asp:AccessDataSource>
        <table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td style="width: 100%; background-color: #ffffcc; text-align: left">
                    <asp:Button ID="Btn_Add" runat="server" Text="新增主題" /></td>
            </tr>
        </table>
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="uid"
            DataSourceID="AccessDataSource1" Width="80%" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="50" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="who" HeaderText="姓名" SortExpression="who" >
                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="uid" DataNavigateUrlFormatString="Reforum.aspx?uid={0}"
                    DataTextField="subject" HeaderText="標題">
                    <ItemStyle HorizontalAlign="Left" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="newdcreate" DataFormatString="{0:g}" HeaderText="最後回應" SortExpression="newdcreate" />
                <asp:BoundField DataField="hits" HeaderText="點閱" SortExpression="hits" />
                <asp:BoundField DataField="re" HeaderText="回覆" SortExpression="re" />
            </Columns>
            <PagerSettings PageButtonCount="60" Position="TopAndBottom" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </form>
</body>
</html>
