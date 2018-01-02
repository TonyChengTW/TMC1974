<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("admin")
	'有發生錯誤也不會停止
	'on error resume next	
	'--------------------variables definition
	Dim result,uid,pwd,username,gender,email,ISQL,checkuid
	uid = filter_data_normal(Request.form("uid"))
	
	'判斷帳號是否重複
	checkuid=GetStringByWhereString("users","sn","where uid='"& uid &"'")
	if checkuid<>"" then 
		PopMessage "Back","帳號重複!!請使用其他帳號!!",""
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
			'寄出加入會員通知信
			'sendmail email,"加入會員成功通知信","memberjoin",mname 
			PopMessage "Replace","新增成功","admin.asp"
		Case "FAIL":
			PopMessage "Back","新增失敗，請稍後再試",""
		Case Else:
			PopMessage "Back","新增失敗，請稍後再試("& result &")",""
	End Select
	
%>