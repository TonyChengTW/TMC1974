<%@ Import Namespace="system.data" %>
<%@ Import Namespace="system.data.oledb" %>
<%@ Page Language="VB"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        GridView1.DataBind()
        ViewState("pageindex") = GridView1.PageIndex
    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>健言留言版</title>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <strong><span style="font-size: 48pt; color: #3300ff; font-family: 標楷體" title="健言社留言版">
            <span style="font-size: 12pt">&nbsp;<table border="1" cellpadding="0" cellspacing="0"
                style="width: 100%">
                <tr>
                    <td style="width: 50%">
                                    <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutImageUrl="~/images/logoff.jpg"
                                        LogoutPageUrl="~/board.aspx" LogoutText="" LogoutAction="Redirect" />
                    </td>
                    <td style="width: 50%"><a href="changePassword.aspx" target="_top" >修改帳號和密碼</a>
                    </td>
                </tr>
            </table>
                <br />
            </span><em>健言社留言版</em></span></strong><br />
        <hr />
        &nbsp;
        &nbsp; &nbsp; &nbsp;<table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td align="center" style="width: 100%; background-color: #ffffcc; text-align: center">
                    <strong><span style="font-size: 24pt">健言社四不：不談商業(廣告)、色情、宗教、政治</span></strong>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 100%; background-color: #ffffcc; text-align: left">
                    請各位健言社的朋友和正在瀏覽網頁的朋友們，健言社是一個公開的留言版，也是一個為了訓練口才技巧而設的社團、和大家一起討論口才和抒發心情的留言版，所以請各位在填寫留言版時，勿談及健言四不，本社有權保留和刪除您的留言資料。
                </td>
            </tr>
        </table>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT * FROM [talk] ORDER BY [uid] DESC" 
            DeleteCommand="DELETE FROM [talk] WHERE [uid] = ?" 
            InsertCommand="INSERT INTO [talk] ([uid], [who], [subject], [msg], [tel], [email], [url], [dcreate], [newdcreate], [hits], [re], [ip]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            UpdateCommand="UPDATE [talk] SET [who] = ?, [subject] = ?, [msg] = ?, [tel] = ?, [email] = ?, [url] = ?, [dcreate] = ?, [newdcreate] = ?, [hits] = ?, [re] = ?, [ip] = ? WHERE [uid] = ?">
            <DeleteParameters>
                <asp:Parameter Name="uid" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="who" Type="String" />
                <asp:Parameter Name="subject" Type="String" />
                <asp:Parameter Name="msg" Type="String" />
                <asp:Parameter Name="tel" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="url" Type="String" />
                <asp:Parameter Name="dcreate" Type="DateTime" />
                <asp:Parameter Name="newdcreate" Type="DateTime" />
                <asp:Parameter Name="hits" Type="Int32" />
                <asp:Parameter Name="re" Type="Int32" />
                <asp:Parameter Name="ip" Type="String" />
                <asp:Parameter Name="uid" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="uid" Type="Int32" />
                <asp:Parameter Name="who" Type="String" />
                <asp:Parameter Name="subject" Type="String" />
                <asp:Parameter Name="msg" Type="String" />
                <asp:Parameter Name="tel" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="url" Type="String" />
                <asp:Parameter Name="dcreate" Type="DateTime" />
                <asp:Parameter Name="newdcreate" Type="DateTime" />
                <asp:Parameter Name="hits" Type="Int32" />
                <asp:Parameter Name="re" Type="Int32" />
                <asp:Parameter Name="ip" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
        &nbsp; &nbsp;&nbsp; &nbsp;</div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="uid"
            DataSourceID="AccessDataSource1" AllowPaging="True" CellPadding="4" ForeColor="#333333" Width="80%" PageSize="20" CellSpacing="1" Font-Size="Medium">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('您要刪除這筆資料嗎');" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="刪除"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="6%" />
                </asp:TemplateField>
                <asp:BoundField DataField="who" HeaderText="姓名" SortExpression="who" >
                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="uid" DataNavigateUrlFormatString="showAdmin.aspx?uid={0}"
                    DataTextField="subject" HeaderText="標題" >
                    <ItemStyle HorizontalAlign="Left" Width="55%" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="dcreate" HeaderText="日期" SortExpression="dcreate" HtmlEncode="False" >
                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                </asp:BoundField>
                <asp:BoundField DataField="ip" HeaderText="ip" SortExpression="ip" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" HorizontalAlign="Left" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="DodgerBlue" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
    </form>
</body>
</html>
