
Partial Class login_logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("manageboard") = "1" Then
            Session("manageboard") = ""
            Response.Write("<script type=""text/javascript"">alert('登出成功!');location.href='http://www.tmc1974.com/board/board.aspx';</script>")
        End If
    End Sub
End Class
