<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("admin")
	'���o�Ϳ��~�]���|����
	'on error resume next	
	'--------------------variables definition
	Dim result,sn,pwd,username,uid,email,checkuid,USQL,csn
'	uid = filter_data_normal(Request.form("uid"))
'  �P�_�b���O�_����
'	checkuid=GetStringByWhereString("users","sn","where uid='"& uid &"'")
'	if checkuid<>"" then
'		PopMessage "Back","�b������!!�ШϥΨ�L�b��!!",""
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
			PopMessage "Replace","�ק令�\","admin.asp"
		Case "FAIL":
			PopMessage "Back","�ק異�ѡA�еy��A��",""
		Case Else:
			PopMessage "Back","�ק異�ѡA�еy��A��("& result &")",""
	End Select
	
%>