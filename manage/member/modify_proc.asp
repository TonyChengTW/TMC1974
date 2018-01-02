<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("admin")
	'有發生錯誤也不會停止
	'on error resume next	
	'--------------------variables definition
	Dim result,sn,pwd,username,uid,email,checkuid,USQL,csn
'	uid = filter_data_normal(Request.form("uid"))
'  判斷帳號是否重複
'	checkuid=GetStringByWhereString("users","sn","where uid='"& uid &"'")
'	if checkuid<>"" then
'		PopMessage "Back","帳號重複!!請使用其他帳號!!",""
'		Response.end()
'	end if
	sn  = filter_data_normal(Request.form("sn"))
	pwd = filter_data_normal(Request.form("pwd"))
	username = filter_data_normal(Request.form("username"))
	email = filter_data_normal(Request.form("email"))
	csn = filter_data_normal(Request.form("csn"))
	USQL = "Update [users] Set [csn]='" & csn &"',[pwd]='" &pwd &"',[username]='"& username&"',[email]='"& email &"',[mdate]='"& GetDate() &"' where sn="&sn

	'Response.Write "USQL="&USQL&"<BR>"
	'Response.end
	Conn.execute(USQL)
	 
	If Err.Number <> 0 then
		result = "FAIL"
	Else
		result = "SUCCESS"
	End if 		
	Select Case result
		Case "SUCCESS":
			PopMessage "Replace","修改成功","admin.asp"
		Case "FAIL":
			PopMessage "Back","修改失敗，請稍後再試",""
		Case Else:
			PopMessage "Back","修改失敗，請稍後再試("& result &")",""
	End Select
	
%>