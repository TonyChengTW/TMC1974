
Partial Class Board_replydel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim connstr = (New WebConfig).ConnStr("Tmc").ToString
        Dim objSql As New SqlFunc

        Dim strSQL As String = ""
        Dim strSQLAll As String = ""
        Dim strSQLCount As String = ""
        Dim strSQLUpdate As String = ""
        Dim uid As String = ""
        Dim re_uid As String = ""
        Dim func As String = ""
        Dim re_count As Integer = 0


        uid = Request("uid")
        re_uid = Request("re_uid")
        func = Request("func")

        If Session("manageboard") = "1" AndAlso uid <> ""  And func <> "" Then
            If func = "1" Then
                strSQL = String.Format("Delete From talk Where uid={0}", SqlPara.Int(uid))
                strSQLAll = String.Format("Delete From talkre Where uid={0}", SqlPara.Int(uid))
                objSql.ExecuteSQL(connstr, strSQL)
                objSql.ExecuteSQL(connstr, strSQLAll)

            ElseIf func = "2" Then
		If re_uid <> "" Then 
                	strSQL = String.Format("Delete From talkre Where uid={0} and re_uid={1}", SqlPara.Int(uid), SqlPara.Int(re_uid))
                	objSql.ExecuteSQL(connstr, strSQL)
                	strSQLCount = String.Format("Select count(*) From talkre Where uid={0}", SqlPara.Int(uid))
                	re_count = objSql.GetDataValue(connstr, strSQLCount)
                	strSQLUpdate = String.Format("Update talk set re={0} where uid={1}", re_count, SqlPara.Int(uid))
                	objSql.ExecuteSQL(connstr, strSQLUpdate)
		End If
            End If

            Response.Write("<script type=""text/javascript"">alert('刪除成功!');location.href='http://www.tmc1974.com/board/board.aspx';</script>")
            Response.End()
        Else
            Response.Write("<script type=""text/javascript"">alert('請先登入!');location.href='http://www.tmc1974.com/login/login.aspx';</script>")
            Response.End()
        End If

       

    End Sub

End Class
