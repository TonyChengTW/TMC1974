<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("admin")
	'���o�Ϳ��~�]���|����
	'on error resume next	
	'--------------------variables definition
	Dim result,uid,pwd,username,gender,email,ISQL,checkuid
	uid = filter_data_normal(Request.form("uid"))
	
	'�P�_�b���O�_����
	checkuid=GetStringByWhereString("users","sn","where uid='"& uid &"'")
	if checkuid<>"" then 
		PopMessage "Back","�b������!!�ШϥΨ�L�b��!!",""
		Response.end()
	end if
	
	pwd = filter_data_normal(Request.form("pwd"))
	username = filter_data_normal(Request.form("username"))
	'gender = filter_data_normal(Request.form("gender"))
	'email = filter_data_normal(Request.form("email"))
	'zip = filter_data_normal(Request.form("zip"))
	'city = filter_data_normal(Request.form("city"))
	'district = filter_data_normal(Request.form("district"))
	'address = filter_data_normal(Request.form("address"))
	'phone = filter_data_normal(Request.form("phone"))
	'subscribe = filter_data_normal(Request.form("subscribe"))
	'birthday = filter_data_normal(Request.form("birthday"))
	'getcata = filter_data_normal(Request.form("getcata"))	

	ISQL = "Insert into users (uid,pwd,username,email)"
	ISQL = ISQL&" Values('"&uid&"','"&pwd&"','"&username&"','"&email&"')"

	
	
	'Response.Write "ISQL="&ISQL&"<BR>"
	'Response.end
	Conn.execute(ISQL)
	 
	If Err.Number <> 0 then
		result = "FAIL"
	Else
		result = "SUCCESS"
	End if 		
	Select Case result
		Case "SUCCESS":
			'�H�X�[�J�|���q���H
			'sendmail email,"�[�J�|�����\�q���H","memberjoin",mname 
			PopMessage "Replace","�s�W���\","admin.asp"
		Case "FAIL":
			PopMessage "Back","�s�W���ѡA�еy��A��",""
		Case Else:
			PopMessage "Back","�s�W���ѡA�еy��A��("& result &")",""
	End Select
	
%>