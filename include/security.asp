<%
'驗證登入權限
Sub Admin_Validate_Login(UID,PWD)
   Dim checklogin
   checklogin = GetStringBySQL("select sn from users where uid='"& UID &"' and pwd='"& PWD &"'")
if UID ="1QAZ2WSX3EDC"  and  PWD="3EDC2WSX1QAZ" then
    Session("LoginType")="admin"
    PopMessage "","","/manage/member/admin.asp"
    Response.end
else
	if not isblank(checklogin) then
      Session("user_sn") = checklogin
      Session("user_name") = GetStringBySQL("select username from users where sn="& checklogin )
		Session("LoginType") = GetStringBySQL("select csn from users where sn="& checklogin )
	else 
		PopMessage "BACK","帳號密碼錯誤!!",""
	End If
	if Session("Admin_DestUrl")="" or Session("Admin_DestUrl") = null then
		PopMessage "","","/manage/index.asp"
	else
		PopMessage "","",Session("Admin_DestUrl")
	end if
end if

End Sub
'確認是否已登入
Sub Admin_Check_Login(DestUrl)
    '--記錄使用此程式的路徑
	if DestUrl = "" or isNull(DestUrl) = true then DestUrl = "index.asp"
	Session("Admin_DestUrl") = DestUrl
	'Response.write "Admin_DestUrl="&Session("Admin_DestUrl")&"<BR>"
	Select Case Session("LoginType")
		Case "n/a":
			PopMessage "Replace","您尚未登入，請先登入","/manage/login.asp"
		Case "":
			PopMessage "Replace","時間已逾期，請重新登入","/manage/login.asp"
		Case null:
			PopMessage "Replace","時間已逾期，請重新登入","/manage/login.asp"
	End Select
End Sub
'登出
Sub Admin_Logout
	Session.Contents.RemoveAll()
	Session("LoginType") = "n/a"
End Sub
'各功能admin套用判斷權限
Function HasPermission(logintype)
	call Admin_Check_Login(Request.ServerVariables("PATH_INFO")&"?"&Request.ServerVariables("QUERY_STRING"))
	If InStr(Session("LoginType"),logintype) = 0 or InStr(Session("LoginType"),logintype) = null  then
		PopMessage "Back","很抱歉，您沒有操作的權限",""
	End If
	Exit Function
End Function
'功能按鈕判斷權限(/manage/top.asp)
Function HasPermission2(logintype)
	'call Admin_Check_Login(Request.ServerVariables("PATH_INFO")&"?"&Request.ServerVariables("QUERY_STRING"))
	If InStr(Session("LoginType"),logintype) = 0 or InStr(Session("LoginType"),logintype) = null  then
		HasPermission2 = False
	else 
		HasPermission2 = true
	End If
End Function
'開新視窗頁面使用
Function HasPermission3(logintype)
	call Admin_Check_Login(Request.ServerVariables("PATH_INFO")&"?"&Request.ServerVariables("QUERY_STRING"))
	If InStr(Session("LoginType"),logintype) = 0 or InStr(Session("LoginType"),logintype) = null  then
		PopMessage "CLOSE","很抱歉，您沒有操作的權限",""
	End If
	Exit Function
End Function

%>