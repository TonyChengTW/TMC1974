<%@ Import Namespace="system.data" %>
<%@ Import Namespace="system.data.oledb" %>
<%@ Page Language="VB" MaintainScrollPositionOnPostback="true"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
       
        GridView1.DataBind()
        ViewState("pageindex") = GridView1.PageIndex
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
        If Text_name.Text = "" And Text_SelectSubject.Text = "" Then
            Me.Txt_msg.Text = Me.Txt_msg.Text & img.CommandName
        Else
            If Not IsPostBack Then
                Me.Txt_msg.Text = Me.Txt_msg.Text & img.CommandName
            End If
        End If
      
    End Sub
    Protected Sub AddData(ByVal sender As Object, ByVal e As System.EventArgs)
        If Text_name.Text = "" And Txt_subject.Text = "" Then
            Lab_showError.Text = "您未輸入姓名、標題"
        Else
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
        End If
       
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Txt_who.Text = ""
        Txt_subject.Text = ""
        Txt_email.Text = ""
        Txt_tel.Text = ""
        Txt_msg.Text = ""
    End Sub
    Protected Sub LinkButton1_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        Text_name.Text = ""
        Text_SelectSubject.Text = ""
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>健言留言版</title>

</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <strong><em><span style="font-size: 48pt; color: #3300ff; font-family: 標楷體" title="健言社留言版">
            <span style="font-size: 12pt">
                <table border="1" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 25%">
                            <asp:HyperLink ID="Hype_Admin" runat="server" NavigateUrl="~/admin.aspx" Font-Bold="True" Font-Italic="False" Font-Names="Times New Roman">管理者登入</asp:HyperLink></td>
                    </tr>
                </table>
                <br />
            </span>
            健言社留言版</span></em></strong><br />
        <hr />
        &nbsp;
        &nbsp; &nbsp; &nbsp;<table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
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
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT * FROM [talk] WHERE (([who] LIKE '%' + ? + '%') AND ([subject] LIKE '%' + ? + '%')) ORDER BY [uid] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="Text_name" DefaultValue="%" Name="who" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="Text_SelectSubject" DefaultValue="%" Name="subject"
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td align="left" style="width: 100%; background-color: #ccffff">
                    110期留言目標 &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Blue" Text="1000"></asp:Label>
                    - 目前留言&nbsp;<asp:ListBox ID="ListBox2" runat="server" DataSourceID="ADS_boradcount" DataTextField="Expr1000" DataValueField="Expr1000"
                            Rows="1" SelectionMode="Multiple"></asp:ListBox>&nbsp;
                    = <asp:ListBox ID="ListBox3"
                                runat="server" DataSourceID="ADS_totle" DataTextField="Expr1"
                                DataValueField="Expr1" Rows="1" SelectionMode="Multiple"></asp:ListBox>
                    加油！離目標越來越近了 <span style="color: #0000ff;"><a href="boardcount.aspx" target="_blank">留言排行榜</a></span><asp:ListBox ID="ListBox1" runat="server"
                        DataSourceID="ADS_boradcount" DataTextField="Expr1000" DataValueField="Expr1000"
                        Rows="1" SelectionMode="Multiple" Visible="False"></asp:ListBox></td>
            </tr>
            <tr>
                <td align="left" style="width: 100%; background-color: #ccffff">
                    搜尋姓名<asp:TextBox ID="Text_name" runat="server" Width="265px"></asp:TextBox>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1">清除搜尋姓名和標題</asp:LinkButton></td>
            </tr>
            <tr>
                <td align="left" style="width: 100%; background-color: #ccffff">
                    搜尋標題<asp:TextBox ID="Text_SelectSubject" runat="server" Width="265px"></asp:TextBox> <a href="SelectHelp.aspx" target="_blank">搜尋說明請按我</a>&nbsp;</td>
            </tr>
        </table>
        <br />
        <table border="1" cellpadding="0" cellspacing="0" style="width: 80%; background-color: #ffffcc; font-size: 12pt;">
            <tr>
                <td style="color: #ffffff; background-color: green; text-align: left; width: 110px;">
                    <span>
                    姓名</span></td>
                <td style="background-color: #ffffcc; text-align: left;" colspan="3">
                    <asp:TextBox ID="Txt_who" runat="server" Width="250px"></asp:TextBox>&nbsp;</td>
            </tr>
            <tr>
                <td style="color: #ffffff; background-color: green; text-align: left; width: 49px;">
                    <span>
                    標題</span></td>
                <td style="background-color: #ffffcc; text-align: left;" colspan="3">
                    <asp:TextBox ID="Txt_subject" runat="server" Width="400px" MaxLength="30"></asp:TextBox><span
                        style="color: #ff0066"></span></td>
            </tr>
            <tr>
                <td style="color: #ffffff; background-color: green; text-align: left; width: 49px;">
                    <span>
                    表情</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:Panel ID="Panel1" runat="server" BackColor="#C0FFC0" Height="57px" Width="489px">
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td rowspan="2" style="color: #ffffff; background-color: green; text-align: left; width: 49px;">
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
                <td style="color: #ffffff; background-color: green; text-align: left; width: 49px;">
                    <span>
                    郵件</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_email" runat="server" Width="400px"></asp:TextBox></td>
            </tr>
            <tr>
                <td rowspan="2" style="color: #ffffff; background-color: green; text-align: left; width: 49px;">
                    <span>
                    電話</span></td>
                <td colspan="3" rowspan="2" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_tel" runat="server" Width="250px"></asp:TextBox></td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td rowspan="1" style="color: #ffffff; background-color: green; text-align: left; width: 49px;">
                </td>
                <td colspan="3" rowspan="1" style="background-color: #ffffcc; text-align: center">
                    <asp:Button ID="Button1" runat="server" OnClick="AddData" Text="送出" />
                    <asp:Button ID="Btn_Clear" runat="server" OnClick="Button2_Click" Text="清除" /></td>
            </tr>
            <tr>
                <td rowspan="1" style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                </td>
                <td colspan="3" rowspan="1" style="background-color: #ffffcc; text-align: center">
                    <asp:Label ID="Lab_showError" runat="server" ForeColor="Red" Width="400px"></asp:Label></td>
            </tr>
        </table>
        &nbsp;</div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="uid"
            DataSourceID="AccessDataSource1" AllowPaging="True" CellPadding="4" ForeColor="#333333" Width="80%" PageSize="60" CellSpacing="1" Font-Size="Medium">
            <Columns>
                <asp:BoundField DataField="who" HeaderText="姓名" SortExpression="who" >
                    <ItemStyle HorizontalAlign="Left" Width="12%" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="uid" DataNavigateUrlFormatString="show.aspx?uid={0}"
                    DataTextField="subject" HeaderText="標題" >
                    <ItemStyle HorizontalAlign="Left" Width="60%" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="dcreate" HeaderText="日期" SortExpression="dcreate" HtmlEncode="False" DataFormatString="{0:g}" >
                    <ItemStyle HorizontalAlign="Left" Width="23%" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" HorizontalAlign="Left" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="DodgerBlue" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <PagerSettings PageButtonCount="60" Position="TopAndBottom" />
        </asp:GridView>
        <asp:AccessDataSource ID="ADS_boradcount" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT         count (*)&#13;&#10;FROM             talk&#13;&#10;WHERE         (dcreate > #10/1/2008#)">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ADS_totle" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT         1000 - COUNT(*) AS Expr1&#13;&#10;FROM             talk&#13;&#10;WHERE         (dcreate > #10/1/2008#)">
        </asp:AccessDataSource>
    </form>
</body>
</html>
