<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<%
HasPermission("news")
Server.ScriptTimeout = 600
On Error Resume Next
	Dim newsID,MSQL,MRS,Subject,Content,ERS,ESQL,indx,EmailEnd
	Dim title,releasedate,hintpic
	EmailEnd=false
	Set MRS = Server.CreateObject("ADODB.Recordset")
	Set ERS = Server.CreateObject("ADODB.Recordset")
	newsID = filter_data_unnull(Request("newsID"),"�L�����")
	indx = Replace(Request("indx"),"'","")
	if indx = "" then indx = 0
	Response.Write "�H�H��~�еy��~<BR>"
	
	ESQL = "Select * From new Where sn="&newsID
	ERS.open ESQL,conn,3,1
	if not ERS.eof then
		title = ERS("title")
		releasedate = ERS("releasedate")
		hintpic = ERS("hintpic")
	end if
    ERS.close  
	Dim Endsn 
	ESQL = "Select top 1 sn From member Where subscribe=1 and status=1 order by sn desc"
	ERS.open ESQL,conn,3,1
	if not ERS.eof then 
		Endsn = ERS("sn")
	else
		EndEmail = ""
		EmailEnd = true
	end if	
	'response.write "Endsn="&Endsn&"<BR>"
	Set ERS = nothing	
	Dim myMailServer,sch,cdoConfig,cdoMessage,i
	MSQL = "Select top 50 Email,sn From member Where subscribe=1 and status=1 and sn>="& indx &" and sn< "& (indx+50) &" order by sn"
	MRS.open MSQL,conn,3,1
	
	While not MRS.eof
		'�H�H
		sendmail MRS("Email"),getcontent(newsID,title,releasedate,hintpic),"TOTO�̷s�����q��"
		'sendmail "tim0611@gmail.com",getcontent(newsID,title,releasedate,hintpic),"TOTO�̷s�����q��"
		if Endsn = MRS("sn") then EmailEnd = true
		'�����~�T��
		If Err.Number <> 0 then
			 if len(session("error_Description")) > 0 then 
			 	session("error_Description") = "Email = "& MRS("Email") &":���~�T���G"& Err.Description &"<BR>"
			 else
			 	session("error_Description") = session("error_Description") &"Email = "& MRS("Email") &":���~�T���G"& Err.Description &"<BR>"
			 end if
		end if
		MRS.movenext
	Wend
	if len(session("email_counts")) > 0 then
		session("email_counts") = cint(session("email_counts"))+MRS.recordcount
	else
		session("email_counts") = MRS.recordcount
	end if
	Response.write "<BR>(�w�H�X"& session("email_counts") &"�ʫH)"
	Set MRS  = nothing
	if EmailEnd then
		MSQL = "update new set sendstatus = 1 Where sn="& newsID
		'Response.write "MSQL="&MSQL&"<BR>"
		conn.execute(MSQL)
		sendmail "tim0611@gmail.com","�H�e���ơG"& session("email_counts") &"<BR>�����G<BR>"& session("error_Description") &"<BR>����ɶ��G"&now(),"TOTO�̷s�����q�����浲�G"
		session("error_Description") = ""
		session("email_counts") = ""
		Response.write "<script>alert('�w�g�N�H��H�e����');window.navigate('admin.asp')</script>"
		Response.end
	else
		Response.write "<script>window.navigate('sendnews.asp?indx="& indx+50 &"&newsID="& newsID &"')</script>"
	end if

function sendmail(sendemail,Content,subject)
    Dim HTMLBody,objEmail
	set objEmail = Server.CreateObject("CDO.Message")     'Mailer object
	objEmail.bodypart.charset = "big5" '==�Ф@�w�n�[�o�@��,�קK����r�}�X 
	objEmail.TO = sendemail
	objEmail.From = "TOTO<twtoto@twtoto.com.tw>"
	objEmail.Subject = subject
	objEmail.HTMLBody = Content
	objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
	objEmail.Configuration.Fields.Update
	objEmail.Send
	Set objEmail = nothing
end function

function getcontent(newsID,title,releasedate,hintpic)
	Dim HTMLBody
	HTMLBody = "<html>"& vbNewLine
	HTMLBody = HTMLBody &"<head>"& vbNewLine
	HTMLBody = HTMLBody &"<meta http-equiv='Content-Type' content='text/html; charset=big5' />"& vbNewLine
	HTMLBody = HTMLBody &"<title>TOTO�̷s�����q��</title>"& vbNewLine
	HTMLBody = HTMLBody &"</head>"& vbNewLine
	HTMLBody = HTMLBody &""& vbNewLine
	HTMLBody = HTMLBody &"<body link='#006699' vlink='#006699' alink='#FF3300'>"& vbNewLine
	HTMLBody = HTMLBody &"<center>"& vbNewLine
	HTMLBody = HTMLBody &"  <table width='600' border='0' cellpadding='0' cellspacing='0'>"& vbNewLine
	HTMLBody = HTMLBody &"    <tr>"& vbNewLine
	HTMLBody = HTMLBody &"      <td><img src='http://www.twtoto.com.tw/email/news/images/logobar.gif' width='600' height='60' /></td>"& vbNewLine
	HTMLBody = HTMLBody &"    </tr>"& vbNewLine
	HTMLBody = HTMLBody &"    <tr>"& vbNewLine
	HTMLBody = HTMLBody &"      <td height='300' align='center' valign='top' background='http://www.twtoto.com.tw/email/news/images/bg.gif'><font color='#339999' size='3'><b><br>"& vbNewLine
	HTMLBody = HTMLBody &"            <font color='#006699'>�̷s�����q��</font></b></font><br />"& vbNewLine
	HTMLBody = HTMLBody &"        <table width='100%' border='0' cellpadding='10'>"& vbNewLine
	HTMLBody = HTMLBody &"        <tr>"& vbNewLine
	HTMLBody = HTMLBody &"          <td><table width='100%' border='0'>"& vbNewLine
	HTMLBody = HTMLBody &"            <tr>"& vbNewLine
	HTMLBody = HTMLBody &"              <td><img src='http://www.twtoto.com.tw/email/news/images/news_dot.gif' width='14' height='14' align='absmiddle'>"
	HTMLBody = HTMLBody &"  			 <a href='http://www.twtoto.com.tw/news_detail.asp?sn="& newsID &"'>"
	HTMLBody = HTMLBody &" 				<font size='2'>"& title &"</font></a>"
	HTMLBody = HTMLBody &" 				<font size='2'> "& releasedate &" " 
	if hintpic <> "no" then
		HTMLBody = HTMLBody &"			<img src='http://www.twtoto.com.tw/email/news/images/"&hintpic&".gif' width='34' height='12'>"
	end if
	HTMLBody = HTMLBody &"   </font></td>"& vbNewLine
	HTMLBody = HTMLBody &"            </tr>"& vbNewLine
	HTMLBody = HTMLBody &"            <tr>"& vbNewLine
	HTMLBody = HTMLBody &"              <td><img src='http://www.twtoto.com.tw/email/news/images/line2.gif' width='560' height='5'></td>"& vbNewLine
	HTMLBody = HTMLBody &"            </tr>"& vbNewLine
	HTMLBody = HTMLBody &"          </table></td>"& vbNewLine
	HTMLBody = HTMLBody &"        </tr>"& vbNewLine
	HTMLBody = HTMLBody &"      </table></td>"& vbNewLine
	HTMLBody = HTMLBody &"    </tr>"& vbNewLine
	HTMLBody = HTMLBody &"    <tr>"& vbNewLine
	HTMLBody = HTMLBody &"      <td><img src='http://www.twtoto.com.tw/email/news/images/footer.gif' width='600' height='30' /></td>"& vbNewLine
	HTMLBody = HTMLBody &"    </tr>"& vbNewLine
	HTMLBody = HTMLBody &"  </table>"& vbNewLine
	HTMLBody = HTMLBody &"</center>"& vbNewLine
	HTMLBody = HTMLBody &"</body>"& vbNewLine
	HTMLBody = HTMLBody &"</html>"& vbNewLine	
	getcontent = HTMLBody
end function
%></div>
<div style="display:none">

