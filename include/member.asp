<%
	Function Member_Check_Login(DestUrl)'-----判斷登入與否
		if DestUrl = "" or isNull(DestUrl) = true then DestUrl = "service.asp"
		Session("Member_DestUrl") = DestUrl
		Select Case cstr(Session("membersn"))
			Case "n/a":
				PopMessage "Replace","請先登入","service.asp"
			Case "":
				PopMessage "Replace","請先登入","service.asp"
			Case null:
				PopMessage "Replace","請先登入","service.asp"
		End Select
		Exit Function
	End Function
'----------------------------特殊會員登入
	Sub Member_Login_desinger(UID,PWD)
		'Dim DestUrl
		'if DestUrl  = "" or isNull(DestUrl ) = true then DestUrl = "service.asp"
		Dim LoginRS,job,checkstatus
		Set LoginRS = GetDataByWhereString("member","*"," Where email='"&email&"' and pwd='"&PWD&"' and status=1 ")
		if LoginRS.eof then
			Set LoginRS = nothing
			PopMessage "BACK","帳號密碼輸入有誤，請重新輸入",""
		end if
		
		Session("membersn") = LoginRS("sn")		'會員編號
		Session("name") = LoginRS("name") 		'會員真實姓名
		Session("email") = LoginRS("email") 	'會員email
		Session("phone") = LoginRS("phone") 	'會員phone
		'job= LoginRS("job") 					'會員工作
		checkstatus = LoginRS("chcekstatus")
		
		Set LoginRS = nothing
	'	if (job="製造業" or job="設計師" or job="建築師" or job="建設公司") and checkstatus=1 then
	'		Session("goodjob")=true
	'		PopMessage "","","designerzone_detail.asp"
	'		Response.end()
	'	elseif (job="製造業" or job="設計師" or job="建築師" or job="建設公司") and checkstatus=0 then
	'		Session("goodjob")=false
	'		PopMessage "REPLACE","您的資料審核中請稍後再試!!","service.asp"
	'		Response.end()
	'	else
	'		Session("goodjob")=false
			PopMessage "","","service.asp"
			Response.end()
	'	end if
	End Sub
	'----------------------------會員登入
	Sub Member_Login(UID,PWD,DestUrl,checkcode)
		if DestUrl  = "" or isNull(DestUrl ) = true then DestUrl = "service.asp"
		if cint(checkcode)=cint(session("checkcode2")) then
			Dim LoginRS,job
			Set LoginRS = GetDataByWhereString("member","*"," Where email='"&UID&"' and pwd='"&PWD&"' and status=1 ")
			if LoginRS.eof then
				Set LoginRS = nothing
				PopMessage "BACK","帳號密碼輸入有誤，請重新輸入",""
			end if
			Session("membersn") = LoginRS("sn")		'會員編號
			Session("name") = LoginRS("name") 		'會員真實姓名
			Session("email") = LoginRS("email") 	'會員email
			Session("phone") = LoginRS("phone") 	'會員phone
			'job = LoginRS("job") 					'會員工作
			'if job="製造業" or job="設計師" or job="建築師" or job="建設公司" then
		'		Session("goodjob")=true
	'		else
	'			Session("goodjob")=false
	'		end if		
			Set LoginRS = nothing
			if DestUrl="" or DestUrl=null then
				PopMessage "","","service.asp" 
			else
				PopMessage "","",DestUrl
			end if
		else
			PopMessage "Replace","帳號密碼輸入有誤，請重新輸入",DestUrl
		end if
	End Sub
	Sub Member_add_Login(UID,PWD)
		Dim LoginRS,job
		Set LoginRS = GetDataByWhereString("member","*"," Where email='"& UID &"' and pwd='"& PWD &"' and status=1")
		if LoginRS.eof then
			Set LoginRS = nothing
			PopMessage "BACK","帳號密碼輸入有誤，請重新輸入",""
		end if
		Session("membersn") = LoginRS("sn")		'會員編號
		Session("name") = LoginRS("name") 		'會員真實姓名
		Session("email") = LoginRS("email") 	'會員email
		Session("phone") = LoginRS("phone") 	'會員email
'		job = LoginRS("job") 					'會員工作
'		if job="製造業" or job="設計師" or job="建築師" or job="建設公司" then
'			Session("goodjob")=true
'		else
'			Session("goodjob")=false
'		end if		
		Set LoginRS = nothing
	End Sub
'----------------------------會員登出
	Sub Member_Logout
		Session.Contents.RemoveAll()
	End Sub
 
%>