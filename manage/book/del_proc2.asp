<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("news")
	'���o�Ϳ��~�]���|����
	'on error resume next	
	'--------------------variables definition
	Dim result,sn,pic1,pic2,pic3,DSQL
	sn = filter_data_normal(Request.form("sn"))
	
	DSQL = "DELETE * FROM [talkRe] where re_uid = "& sn

	Response.Write "DSQL="&DSQL&"<BR>"
	'Response.end
	Conn.execute(DSQL)
	 
	If Err.Number <> 0 then
		result = "FAIL"
	Else
		result = "SUCCESS"
	End if 		

	Select Case result
		Case "SUCCESS":
			PopMessage "Replace","�R�����\","admin.asp"
		Case "FAIL":
			PopMessage "Back","�R�����ѡA�еy��A��",""
		Case Else:
			PopMessage "Back","�R�����ѡA�еy��A��("& result &")",""
	End Select
	
%>