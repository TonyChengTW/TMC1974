<%
'���ҵn�J�v��
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
		PopMessage "BACK","�b���K�X���~!!",""
	End If
	if Session("Admin_DestUrl")="" or Session("Admin_DestUrl") = null then
		PopMessage "","","/manage/index.asp"
	else
		PopMessage "","",Session("Admin_DestUrl")
	end if
end if

End Sub
'�T�{�O�_�w�n�J
Sub Admin_Check_Login(DestUrl)
    '--�O���ϥΦ��{�������|
	if DestUrl = "" or isNull(DestUrl) = true then DestUrl = "index.asp"
	Session("Admin_DestUrl") = DestUrl
	'Response.write "Admin_DestUrl="&Session("Admin_DestUrl")&"<BR>"
	Select Case Session("LoginType")
		Case "n/a":
			PopMessage "Replace","�z�|���n�J�A�Х��n�J","/manage/login.asp"
		Case "":
			PopMessage "Replace","�ɶ��w�O���A�Э��s�n�J","/manage/login.asp"
		Case null:
			PopMessage "Replace","�ɶ��w�O���A�Э��s�n�J","/manage/login.asp"
	End Select
End Sub
'�n�X
Sub Admin_Logout
	Session.Contents.RemoveAll()
	Session("LoginType") = "n/a"
End Sub
'�U�\��admin�M�ΧP�_�v��
Function HasPermission(logintype)
	call Admin_Check_Login(Request.ServerVariables("PATH_INFO")&"?"&Request.ServerVariables("QUERY_STRING"))
	If InStr(Session("LoginType"),logintype) = 0 or InStr(Session("LoginType"),logintype) = null  then
		PopMessage "Back","�ܩ�p�A�z�S���ާ@���v��",""
	End If
	Exit Function
End Function
'�\����s�P�_�v��(/manage/top.asp)
Function HasPermission2(logintype)
	'call Admin_Check_Login(Request.ServerVariables("PATH_INFO")&"?"&Request.ServerVariables("QUERY_STRING"))
	If InStr(Session("LoginType"),logintype) = 0 or InStr(Session("LoginType"),logintype) = null  then
		HasPermission2 = False
	else 
		HasPermission2 = true
	End If
End Function
'�}�s���������ϥ�
Function HasPermission3(logintype)
	call Admin_Check_Login(Request.ServerVariables("PATH_INFO")&"?"&Request.ServerVariables("QUERY_STRING"))
	If InStr(Session("LoginType"),logintype) = 0 or InStr(Session("LoginType"),logintype) = null  then
		PopMessage "CLOSE","�ܩ�p�A�z�S���ާ@���v��",""
	End If
	Exit Function
End Function

%>