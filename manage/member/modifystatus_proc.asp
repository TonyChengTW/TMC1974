<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("Admin")
	'���o�Ϳ��~�]���|����
	'on error resume next	
	'--------------------variables definition
	Dim result,sn,datastatus,USQL
	sn = filter_data_normal(Request.form("sn"))
	datastatus = GetStringByWhereString("member","status","where sn="&sn)
	if datastatus=0 then
		datastatus=1
	else
		datastatus=0
	end if
	USQL = "update member Set status="& datastatus &" Where sn="&sn 
	'Response.Write "DSQL="&DSQL&"<BR>"
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
			PopMessage "Back","�ק令�\�A�еy��A��",""
		Case Else:
			PopMessage "Back","�ק令�\�A�еy��A��("& result &")",""
	End Select
	
%>