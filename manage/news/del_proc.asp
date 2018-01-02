<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("news")
	'有發生錯誤也不會停止
	'on error resume next	
	'--------------------variables definition
	Dim result,sn,pic1,pic2,pic3,DSQL
	sn = filter_data_normal(Request.form("sn"))
	
	pic1 = GetStringByWhereString("new","pic1","where sn="&sn)
	pic2 = GetStringByWhereString("new","pic2","where sn="&sn)
	pic3 = GetStringByWhereString("new","pic3","where sn="&sn)

	DSQL = "delete from new Where sn="&sn
	'Response.Write "DSQL="&DSQL&"<BR>"
	'Response.end
	Conn.execute(DSQL)
	 
	If Err.Number <> 0 then
		result = "FAIL"
	Else
		result = "SUCCESS"
	End if 		
	Dim FilePath
	FilePath = Server.MapPath("/upload")
	Select Case result
		Case "SUCCESS":
			delfile FilePath,pic1 
			delfile FilePath,pic2 
			delfile FilePath,pic3 
			PopMessage "Replace","刪除成功","admin.asp"
		Case "FAIL":
			PopMessage "Back","刪除失敗，請稍後再試",""
		Case Else:
			PopMessage "Back","刪除失敗，請稍後再試("& result &")",""
	End Select
	
%>