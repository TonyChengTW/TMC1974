<%@ Import Namespace="system.data" %>
<%@ Import Namespace="system.data.oledb" %>
<%@ Page Language="VB" MaintainScrollPositionOnPostback="true"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim img As ImageButton
        Dim i As Integer
        For i = 0 To 33
            img = New ImageButton
            img.ID = "pic" & i
            img.ImageUrl = "images/" & i.ToString("0") & ".gif"
            img.CommandName = "[pic" & i & "]"
            AddHandler img.Click, AddressOf AddText
            Me.Panel1.Controls.Add(img)
            Dim lit As Literal
            lit = New Literal
            lit.Text = "&nbsp;&nbsp;"
            Me.Panel1.Controls.Add(lit)
        Next
    End Sub
    Sub AddText(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim img As ImageButton
        img = CType(sender, ImageButton)
        Me.Txt_msg.Text = Me.Txt_msg.Text & img.CommandName
    End Sub
    Protected Sub AddData(ByVal sender As Object, ByVal e As System.EventArgs)
        If IsValid Then
            Dim RComments As String = Txt_msg.Text
            RComments = Replace(RComments, "<", "&lt;")
            RComments = Replace(RComments, ">", "&gt;")
            RComments = Replace(RComments, vbCrLf, "<br>")
            For i As Integer = 0 To 33
                RComments = Replace(RComments, "[pic" & i & "]", "<img border=0 src=images/" & i & ".gif>")
            Next
            
            Dim T1 = Now()
            Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\Tmc.mdb")
            Dim Conn As New OleDbConnection(connectionString)
            
            Dim AddSQL As String = "INSERT INTO talk (who,subject,email,tel,msg,dcreate,ip) VALUES ('" & Txt_who.Text & "','" & Txt_subject.Text & "','" & Txt_email.Text & "','" & Txt_tel.Text & "','" & RComments & "','" & T1 & "','" & Request.ServerVariables("REMOTE_ADDR") & "')"
            Dim cmd As New OleDbCommand(AddSQL, Conn)
            Conn.Open()
            cmd.ExecuteNonQuery()
            Conn.Close()
            Response.Redirect("board.aspx")
        End If
    End Sub
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Txt_who.Text = ""
        Txt_subject.Text = ""
        Txt_email.Text = ""
        Txt_tel.Text = ""
        Txt_msg.Text = ""
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>健言社留言版內容</title>
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
            <tr style="font-size: 12pt">
                <td align="center" style="width: 100%; background-color: #ffffcc; text-align: left">
                    請各位健言社的朋友和正在瀏覽網頁的朋友們，健言社是一個公開的留言版，也是一個為了訓練口才技巧而設的社團、和大家一起討論口才和抒發心情的留言版，所以請各位在填寫留言版時，勿談及健言四不，本社有權保留和刪除您的留言資料。
                </td>
            </tr>
        </table><table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td align="right" style="width: 100%">
                    <input id="Button5" type="button" value="回上一頁" onclick="window.history.back()" /></td>
            </tr>
        </table>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT * FROM [talk] WHERE ([uid] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="uid" QueryStringField="uid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        &nbsp; &nbsp;&nbsp;<asp:FormView ID="FormView1" runat="server" DataKeyNames="uid" DataSourceID="AccessDataSource1" Width="80%">
            <EditItemTemplate>
                uid:
                <asp:Label ID="uidLabel1" runat="server" Text='<%# Eval("uid") %>'></asp:Label><br />
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
                            <span>
                            留言時間</span></td>
                        <td style="width:100%; background-color: #ffffcc; text-align: left">
                <asp:Label ID="dcreateLabel" runat="server" Text='<%# Bind("dcreate") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:15%; color: #ffffff;background-color: green; text-align: left">
                            <span>
                            我的姓名</span></td>
                        <td style="width:100%;background-color: #ffffcc; text-align: left">
                <asp:Label ID="whoLabel" runat="server" Text='<%# Bind("who") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:15%; color: #ffffff; background-color: green; text-align: left">
                            <span>
                            我的主題</span></td>
                        <td style="width:100%; background-color: #ffffcc; text-align: left">
                <asp:Label ID="subjectLabel" runat="server" Text='<%# Bind("subject") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:15%; color: #ffffff; background-color: green; text-align: left">
                            <span>
                            留言內容</span></td>
                        <td style="width:100%; background-color: #ffffcc; text-align: left">
                <asp:Label ID="msgLabel" runat="server" Text='<%# Replace(Eval("msg"),vbcrlf,"<br>") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:15%; color: #ffffff; background-color: green; text-align: left">
                            <span>
                            電子郵件</span></td>
                        <td style="width:100%; background-color: #ffffcc; text-align: left">
                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:15%; color: #ffffff; background-color: green; text-align: left">
                            <span>
                            我的電話</span></td>
                        <td style="width:100%; background-color: #ffffcc; text-align: left">
                <asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("tel") %>'></asp:Label></td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
                &nbsp;
            </FooterTemplate>
        </asp:FormView>
        <br /><table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td align="right" style="width: 100%">
                    <input id="Button4" type="button" value="回上一頁" onclick="window.history.back()" /></td>
            </tr>
        </table>
        <br />
        <table border="1" cellpadding="0" cellspacing="0" style="font-size: 12pt; width: 80%;
            background-color: #ffffcc">
            <tr>
                <td style="width: 110px; color: #ffffff; background-color: green; text-align: left">
                    <span>
                    姓名</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_who" runat="server" Width="250px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Txt_who"
                        ErrorMessage="請輸入姓名"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>
                    標題</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_subject" runat="server" MaxLength="30" Width="400px"></asp:TextBox><span
                        style="color: #ff0066"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="Txt_subject" ErrorMessage="請輸入標題，文字不可超過三十個字"></asp:RequiredFieldValidator></span></td>
            </tr>
            <tr>
                <td style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>
                    表情</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:Panel ID="Panel1" runat="server" BackColor="#C0FFC0" Height="57px" Width="489px">
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>
                    內容<br />
                        </span></td>
                <td colspan="3" rowspan="2" style="text-align: left">
                    <asp:TextBox ID="Txt_msg" runat="server" AutoCompleteType="Disabled" Height="300px"
                        TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>
                    郵件</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_email" runat="server" Width="400px"></asp:TextBox></td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>
                    電話</span></td>
                <td colspan="3" rowspan="2" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_tel" runat="server" Width="250px"></asp:TextBox></td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td rowspan="1" style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                </td>
                <td colspan="3" rowspan="1" style="background-color: #ffffcc; text-align: center">
                    <asp:Button ID="Button1" runat="server" OnClick="AddData" Text="送出" />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="清除" />
                &nbsp;&nbsp;
            </tr>
        </table>
        <table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td align="right" style="width: 100%">
                    <input id="Button3" type="button" value="回上一頁" onclick="window.history.back()" /></td>
            </tr>
        </table>
        &nbsp;&nbsp;<br />
        </div>
    </form>
</body>
</html>
