<%@ WebHandler Language="VB" Class="addForum" %>

Imports System
Imports System.Web

Public Class addForum : Implements IHttpHandler
    Dim who As String = ""
    Dim subject As String = ""
    Dim msg As String = ""
    Dim contactway As String = ""
    Dim uid As String = ""
    Dim addType As String = ""
    Dim CheckCode As String = ""
    Dim category As String = ""
    Dim UserIP As String = ""

    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        context.Response.ContentType = "text/plain"
        Dim rtnMsg As String = ""
        addType = context.Request("addType")

        If addType = "1" Or addType = "2" Then
            Dim connstr As String = ""

            Dim objSQL As New SqlFunc()


            Dim strUpdSQL As String = ""

            connstr = (New WebConfig).ConnStr("Tmc").ToString

            uid = context.Request("uid")
            who = context.Request("who")
            subject = context.Request("subject")
            msg = context.Request("msg")
            msg = HttpUtility.HtmlDecode(msg)
            msg = Board.ReplaceLine(msg)

            category = context.Request("category")

            For i As Integer = 1 To 16
                Dim NPicName As String = ""
                Dim ImgName As String = ""
                NPicName = String.Format("[NPIC{0}]", i)
                ImgName = String.Format("<img alt="""" src=""/images/sana_msn_icon/msn_icon_{0:00}.gif""/>", i)
                If msg.Contains(NPicName) Then
                    msg = msg.Replace(NPicName, ImgName)
                End If
            Next

            contactway = context.Request("contactway")

            CheckCode = context.Request("CheckCode")
            UserIP = context.Request.ServerVariables("REMOTE_ADDR")
            rtnMsg = chkContent()
            If String.IsNullOrWhiteSpace(rtnMsg) Then
                Dim strSQL As New StringBuilder

                If addType = "1" Then
                    strSQL.AppendLine("Insert Into talk(subject,category,ip,who,msg,contactway) Values(")
                    strSQL.AppendFormat("{0},", SqlPara.Varchar(subject)).AppendLine()
                    strSQL.AppendFormat("{0},", SqlPara.Int(category)).AppendLine()
                    strSQL.AppendFormat("{0},", SqlPara.Varchar(UserIP)).AppendLine()
                ElseIf addType = "2" Then
                    strUpdSQL = String.Format("UPDATE talk SET newdcreate=now(),re=re+1 WHERE uid = {0}", uid)

                    objSQL.ExecuteSQL(connstr, strUpdSQL)

                    strSQL.AppendLine("Insert Into talkRe(uid,re_who,re_msg,re_contactway) Values(")
                    strSQL.AppendFormat("{0},", SqlPara.Varchar(uid)).AppendLine()

                End If

                strSQL.AppendFormat("{0},", SqlPara.Varchar(who)).AppendLine()
                strSQL.AppendFormat("{0},", SqlPara.Varchar(msg)).AppendLine()
                strSQL.AppendFormat("{0})", SqlPara.Varchar(contactway)).AppendLine()


                objSQL.ExecuteSQL(connstr, strSQL.ToString)
                rtnMsg = "Y"
            End If
        Else
            rtnMsg = "參數錯誤"
        End If
        context.Response.Write(rtnMsg)
    End Sub
    Public Function chkContent() As String
        Dim chkError As Boolean = False
        Dim errMsg As String = ""

        If String.IsNullOrWhiteSpace(who) Then
            errMsg = "請輸入姓名" & vbCrLf
            chkError = True
        Else
            If who.Length > 10 Then
                errMsg += "姓名請勿超過10個字" & vbCrLf
                chkError = True
            End If
            If who.Contains("外送茶") Then
                errMsg += "留言請勿含有色情留言" & vbCrLf
                chkError = True
            End If
        End If

        If String.IsNullOrWhiteSpace(msg) Then
            errMsg += "請輸入內容" & vbCrLf
            chkError = True
        Else
            If msg.Length > 20000 Then
                errMsg += "內容請勿超過20000個字" & vbCrLf
                chkError = True
            End If
            If msg.Contains("外送茶") Then
                errMsg += "留言請勿含有色情留言" & vbCrLf
                chkError = True
            End If
        End If

        If Not String.IsNullOrWhiteSpace(contactway) Then
            If contactway.Length > 30 Then
                errMsg += "聯絡方式請勿超過30個字" & vbCrLf
                chkError = True
            End If
            If contactway = "0985931520" Then '此電話為色情留言電話
                errMsg += "留言請勿含有色情留言" & vbCrLf
                chkError = True
            End If
        End If

        If addType = 1 Then
            If String.IsNullOrWhiteSpace(subject) Then
                errMsg += "請輸入主題" & vbCrLf
                chkError = True
            Else
                If subject.Length > 30 Then
                    errMsg += "主題請勿超過30個字" & vbCrLf
                    chkError = True
                End If
                If subject.Contains("外送茶") Then
                    errMsg += "留言請勿含有色情留言" & vbCrLf
                    chkError = True
                End If
            End If
            If String.IsNullOrWhiteSpace(category) Then
                errMsg += "請輸入分類" & vbCrLf
                chkError = True
            End If
        End If

        If UserIP = "118.163.1.211" Then
            errMsg += "此IP可能為色情留言IP" & vbCrLf
            chkError = True
        End If

        If CheckCode <> HttpContext.Current.Request.Cookies("CheckCode").Value Then
            errMsg += "驗證碼錯誤!" & vbCrLf
            chkError = True
        End If

        Return errMsg

    End Function

    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class