<%
	Function Member_Check_Login(DestUrl)'-----�P�_�n�J�P�_
		if DestUrl = "" or isNull(DestUrl) = true then DestUrl = "service.asp"
		Session("Member_DestUrl") = DestUrl
		Select Case cstr(Session("membersn"))
			Case "n/a":
				PopMessage "Replace","�Х��n�J","service.asp"
			Case "":
				PopMessage "Replace","�Х��n�J","service.asp"
			Case null:
				PopMessage "Replace","�Х��n�J","service.asp"
		End Select
		Exit Function
	End Function
'----------------------------�S��|���n�J
	Sub Member_Login_desinger(UID,PWD)
		'Dim DestUrl
		'if DestUrl  = "" or isNull(DestUrl ) = true then DestUrl = "service.asp"
		Dim LoginRS,job,checkstatus
		Set LoginRS = GetDataByWhereString("member","*"," Where email='"&email&"' and pwd='"&PWD&"' and status=1 ")
		if LoginRS.eof then
			Set LoginRS = nothing
			PopMessage "BACK","�b���K�X��J���~�A�Э��s��J",""
		end if
		
		Session("membersn") = LoginRS("sn")		'�|���s��
		Session("name") = LoginRS("name") 		'�|���u��m�W
		Session("email") = LoginRS("email") 	'�|��email
		Session("phone") = LoginRS("phone") 	'�|��phone
		'job= LoginRS("job") 					'�|���u�@
		checkstatus = LoginRS("chcekstatus")
		
		Set LoginRS = nothing
	'	if (job="�s�y�~" or job="�]�p�v" or job="�ؿv�v" or job="�س]���q") and checkstatus=1 then
	'		Session("goodjob")=true
	'		PopMessage "","","designerzone_detail.asp"
	'		Response.end()
	'	elseif (job="�s�y�~" or job="�]�p�v" or job="�ؿv�v" or job="�س]���q") and checkstatus=0 then
	'		Session("goodjob")=false
	'		PopMessage "REPLACE","�z����Ƽf�֤��еy��A��!!","service.asp"
	'		Response.end()
	'	else
	'		Session("goodjob")=false
			PopMessage "","","service.asp"
			Response.end()
	'	end if
	End Sub
	'----------------------------�|���n�J
	Sub Member_Login(UID,PWD,DestUrl,checkcode)
		if DestUrl  = "" or isNull(DestUrl ) = true then DestUrl = "service.asp"
		if cint(checkcode)=cint(session("checkcode2")) then
			Dim LoginRS,job
			Set LoginRS = GetDataByWhereString("member","*"," Where email='"&UID&"' and pwd='"&PWD&"' and status=1 ")
			if LoginRS.eof then
				Set LoginRS = nothing
				PopMessage "BACK","�b���K�X��J���~�A�Э��s��J",""
			end if
			Session("membersn") = LoginRS("sn")		'�|���s��
			Session("name") = LoginRS("name") 		'�|���u��m�W
			Session("email") = LoginRS("email") 	'�|��email
			Session("phone") = LoginRS("phone") 	'�|��phone
			'job = LoginRS("job") 					'�|���u�@
			'if job="�s�y�~" or job="�]�p�v" or job="�ؿv�v" or job="�س]���q" then
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
			PopMessage "Replace","�b���K�X��J���~�A�Э��s��J",DestUrl
		end if
	End Sub
	Sub Member_add_Login(UID,PWD)
		Dim LoginRS,job
		Set LoginRS = GetDataByWhereString("member","*"," Where email='"& UID &"' and pwd='"& PWD &"' and status=1")
		if LoginRS.eof then
			Set LoginRS = nothing
			PopMessage "BACK","�b���K�X��J���~�A�Э��s��J",""
		end if
		Session("membersn") = LoginRS("sn")		'�|���s��
		Session("name") = LoginRS("name") 		'�|���u��m�W
		Session("email") = LoginRS("email") 	'�|��email
		Session("phone") = LoginRS("phone") 	'�|��email
'		job = LoginRS("job") 					'�|���u�@
'		if job="�s�y�~" or job="�]�p�v" or job="�ؿv�v" or job="�س]���q" then
'			Session("goodjob")=true
'		else
'			Session("goodjob")=false
'		end if		
		Set LoginRS = nothing
	End Sub
'----------------------------�|���n�X
	Sub Member_Logout
		Session.Contents.RemoveAll()
	End Sub
 
%>