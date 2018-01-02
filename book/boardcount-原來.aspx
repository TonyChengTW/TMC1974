<%@ Page Language="VB" AutoEventWireup="false" CodeFile="boardcount.aspx.vb" Inherits="Testcount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>討論區排行榜</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="DIV1" runat="server">
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT talk.who AS 人名,COUNT(talk.who) +(SELECT COUNT(talkre.re_who) FROM talkre WHERE talkre.dcreate >= #1/22/2009# and talkre.re_who=talk.who  ) AS 合計 FROM talk WHERE (talk.dcreate >= #1/22/2009#)   GROUP BY  talk.who ORDER BY COUNT(talk.who) DESC">
        </asp:AccessDataSource>
        <table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td align="left" style="width: 100%; background-color: #ccffff">
                    &nbsp; &nbsp; &nbsp; &nbsp; 請有在意筆數問題的人留言姓名要一致，留言排行榜筆數才會一樣，還有也不要在姓名前面加個空白，這樣筆數也會不一樣喔</td>
            </tr>
        </table>
        <table border="1" style="width: 342px">
            <tr>
                <td align="center" style="width: 460px; color: #ffffff; background-color: #ff0066; text-align: center;" valign="top">
                    總排行</td>
            </tr>
            <tr>
                <td style="width: 460px" valign="top">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
                        DataSourceID="AccessDataSource3" Width="337px" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <Columns>
                           <asp:BoundField DataField="人名" HeaderText="人名" SortExpression="人名" />
                            <asp:BoundField DataField="合計" HeaderText="合計" ReadOnly="True" SortExpression="合計" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>
