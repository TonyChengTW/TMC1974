<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("admin")
	'有發生錯誤也不會停止
	'on error resume next	
	'--------------------variables definition
	Dim result,sn,pic1,pic2,pic3,DSQL
	sn = filter_data_normal(Request.form("sn"))
	DSQL = "delete from users Where sn="&sn
	'Response.Write "DSQL="&DSQL&"<BR>"
	'Response.end
	Conn.execute(DSQL)
	If Err.Number <> 0 then
		result = "FAIL"
	Else
		result = "SUCCESS"
	End if 		
	Select Case result
		Case "SUCCESS":
			PopMessage "Replace","刪除成功","admin.asp"
		Case "FAIL":
			PopMessage "Back","刪除失敗，請稍後再試",""
		Case Else:
			PopMessage "Back","刪除失敗，請稍後再試("& result &")",""
	End Select
	
%>