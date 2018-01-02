
Partial Class login_login
    Inherits System.Web.UI.Page

    Dim connstr As String = (New WebConfig).ConnStr("Tmc").ToString
    Dim connstrDemo As String = (New WebConfig).ConnStr("demo").ToString
    Dim objSql As New SqlFunc
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim FromUrl As String = ""

        FromUrl = Request("FromUrl")

        If Session("manageboard") = "1" AndAlso FromUrl = "" Then
            Response.Write("<script type=""text/javascript"">location.href='http://www.tmc1974.com/board/board.aspx';</script>")
            Response.End()
        End If

        If Board.chkAccount(txtAccount.Text, txtPwd.Text) Then
            Session("manageboard") = 1
            If FromUrl = "1" Then
                Response.Write("<script type=""text/javascript"">alert('登入成功!');location.href='http://www.tmc1974.com/manage/SetPeriod.aspx';</script>")
            Else
                Response.Write("<script type=""text/javascript"">alert('留言版管理登入成功!');location.href='http://www.tmc1974.com/board/board.aspx';</script>")
            End If
        End If

    End Sub
End Class
