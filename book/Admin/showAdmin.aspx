<%@ Import Namespace="system.data" %>
<%@ Import Namespace="system.data.oledb"  %>
<%@ Page Language="VB" ValidateRequest="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Server.Transfer("boardAdmin.aspx")
    End Sub

    Protected Sub Afterupdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs)
        Response.Redirect("boardAdmin.aspx")
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>健言社留言內容</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <span style="font-size: 48pt; color: #3300ff; font-family: 標楷體"><strong><em title="健言社留言版內容">
            健言社留言版內容</em></strong></span><br />
        <hr />
        <table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
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
        <table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td align="right" style="width: 100%">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/boardAdmin.aspx">回上一頁</asp:HyperLink></td>
            </tr>
        </table>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT * FROM [talk] WHERE ([uid] = ?)" DeleteCommand="DELETE FROM [talk] WHERE [uid] = ?" InsertCommand="INSERT INTO [talk] ([uid], [who], [subject], [msg], [tel], [email], [dcreate]) VALUES (?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [talk] SET [who] = ?, [subject] = ?, [msg] = ?, [tel] = ?, [email] = ?,[top] = ?  WHERE [uid] = ?">
            <SelectParameters>
                <asp:QueryStringParameter Name="uid" QueryStringField="uid" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="uid" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="who" Type="String" />
                <asp:Parameter Name="subject" Type="String" />
                <asp:Parameter Name="msg" Type="String" />
                <asp:Parameter Name="tel" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="top" Type="Int32" />
                <asp:Parameter Name="uid" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="uid" Type="Int32" />
                <asp:Parameter Name="who" Type="String" />
                <asp:Parameter Name="subject" Type="String" />
                <asp:Parameter Name="msg" Type="String" />
                <asp:Parameter Name="tel" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="dcreate" Type="DateTime" />
                 <asp:Parameter Name="top" Type="Int32" /> 
            </InsertParameters>
        </asp:AccessDataSource>
        &nbsp; &nbsp;<asp:FormView ID="FormView1" runat="server" DataKeyNames="uid" DataSourceID="AccessDataSource1" Width="80%" OnItemUpdated="Afterupdated">
            <EditItemTemplate>
                <table border="1" cellpadding="0" cellspacing="0" style="width: 100%; background-color: #ffffcc">
                    <tr>
                        <td style="color: #ffffff; background-color: green; text-align: left">
                            姓名</td>
                        <td style="background-color: #ffffcc; text-align: left">
                <asp:TextBox ID="whoTextBox" runat="server" Text='<%# Bind("who") %>' Width="200px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="color: #ffffff; background-color: green; text-align: left">
                            標題</td>
                        <td style="background-color: #ffffcc; text-align: left">
                <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' Width="500px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="color: #ffffff; background-color: green; text-align: left">
                            內容</td>
                        <td style="text-align: left">
                <asp:TextBox ID="msgTextBox" runat="server" Text='<%# Bind("msg") %>' Height="400px" TextMode="MultiLine" Width="600px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="color: #ffffff; background-color: green">
                            電話</td>
                        <td style="background-color: #ffffcc; text-align: left">
                <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("tel") %>' Width="300px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="color: #ffffff; background-color: green">
                            郵件</td>
                        <td style="background-color: #ffffcc; text-align: left">
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' Width="300px"></asp:TextBox></td>
                    </tr>
                     <tr>
                        <td style="color: #ffffff; background-color: green">
                            置頂(設定為1)</td>
                        <td style="background-color: #ffffcc; text-align: left">
                <asp:TextBox ID="TopTextBox" runat="server" Text='<%# Bind("top") %>' Width="300px"></asp:TextBox></td>
                    </tr>
                </table>
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="更新">
                </asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="取消">
                </asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                uid:
                <asp:TextBox ID="uidTextBox" runat="server" Text='<%# Bind("uid") %>'>
                </asp:TextBox><br />
                who:
                <asp:TextBox ID="whoTextBox" runat="server" Text='<%# Bind("who") %>'>
                </asp:TextBox><br />
                subject:
                <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>'>
                </asp:TextBox><br />
                msg:
                <asp:TextBox ID="msgTextBox" runat="server" Text='<%# Bind("msg") %>'>
                </asp:TextBox><br />
                phone:
                <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("tel") %>'>
                </asp:TextBox><br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>'>
                </asp:TextBox><br />
                dcreate:
                <asp:TextBox ID="dcreateTextBox" runat="server" Text='<%# Bind("dcreate") %>'>
                </asp:TextBox><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="插入">
                </asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="取消">
                </asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                <table border="1" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td style="width:15%; color: #ffffff; background-color: green; text-align: left">
                            <span style="font-size: 10pt">
                            留言時間</span></td>
                        <td style="width:100%; background-color: #ffffcc; text-align: left">
                <asp:Label ID="dcreateLabel" runat="server" Text='<%# Bind("dcreate") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:15%; color: #ffffff;background-color: green; text-align: left">
                            <span style="font-size: 10pt">
                            我的姓名</span></td>
                        <td style="width:100%;background-color: #ffffcc; text-align: left">
                <asp:Label ID="whoLabel" runat="server" Text='<%# Bind("who") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:15%; color: #ffffff; background-color: green; text-align: left">
                            <span style="font-size: 10pt">
                            我的主題</span></td>
                        <td style="width:100%; background-color: #ffffcc; text-align: left">
                <asp:Label ID="subjectLabel" runat="server" Text='<%# Bind("subject") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:15%; color: #ffffff; background-color: green; text-align: left">
                            <span style="font-size: 10pt">
                            留言內容</span></td>
                        <td style="width:100%; background-color: #ffffcc; text-align: left">
                <asp:Label ID="msgLabel" runat="server" Text='<%# Replace(Eval("msg"),vbcrlf,"<br>") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:15%; color: #ffffff; background-color: green; text-align: left">
                            <span style="font-size: 10pt">
                            電子郵件</span></td>
                        <td style="width:100%; background-color: #ffffcc; text-align: left">
                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:15%; color: #ffffff; background-color: green; text-align: left">
                            <span style="font-size: 10pt">
                            我的電話</span></td>
                        <td style="width:100%; background-color: #ffffcc; text-align: left">
                <asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("tel") %>'></asp:Label></td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
                <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="編輯" />
            </FooterTemplate>
        </asp:FormView>
        &nbsp;&nbsp;<table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td align="right" style="width: 100%">
                    <input id="Button5" onclick="window.history.back()" type="button" value="回上一頁" /></td>
            </tr>
        </table>
        <br />
        <br />
        &nbsp;&nbsp;<br />
        </div>
    </form>
</body>
</html>
