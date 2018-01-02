<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<%
HasPermission("news")
'有發生錯誤也不會停止
	'on error resume next	
	Dim objUpload,objUploadedFile,ErrDescription,columnname
	Dim FileName,FileTag,i
	'-----------initialize--------------------------------------
	Response.Write("資料處理中，請稍候‧‧‧‧")
	FileName = Array(null,null)
	FileTag = Array(null,null)	
	Set objUpload = Server.CreateObject("aspSmartUpload.SmartUpload")
	objUpload.CodePage = "big5"
	objUpload.Upload
	i = 0	
	'對每個檔案分別動作 
	For each objUploadedFile In objUpload.Files 
		'有上傳檔案才存檔
		FileTag(i) = objUploadedFile.Name
		if objUploadedFile.FileName <> "" and ErrDescription = "" then
			FileName(i) = GetSNFile(FileTag(i),"category",FileTag(i),3)&"."&objUploadedFile.FileExt
			'存檔動作，目錄路徑要設定你自己的網站位址下的目錄，此例為您的主網頁目錄下的upload目錄 
			objUploadedFile.SaveAs  ("/upload/" & FileName(i)) 
			if instr(1,replace(Err.Description,"'",""),"(Error 1120)",1) <> 0 then ErrDescription = "無法儲存檔案!!"
		else
			FileName(i) = ""
		end if
		i=i+1
	next 
	if ErrDescription = "" or isnull(ErrDescription) then
		Dim titleimg,cimg
		Dim casesn,ISQL,sn
		Dim result'----Insert result flag
		Dim cname,colorcode,RefTitle,ParentSN,osn
		cname = filter_data_normal(objUpload.form("cname"))
		RefTitle = filter_data_normal(objUpload.form("RefTitle"))
		ParentSN = filter_data_normal(objUpload.form("ParentSN"))
		osn = GetStringByWhereString("category","top 1 osn+1"," where ctype='"& RefTitle &"' and psn="& ParentSN &" order by osn desc" )
	
		For i = 0 to UBound(FileName)
			Select Case FileTag(i)
				Case "titleimg" :
					titleimg = FileName(i)
				Case "cimg":
					cimg = FileName(i)
			End Select
		Next	
		if isblank(osn) then osn=0
		if isblank(ParentSN) then ParentSN=0
		
		ISQL = "INSERT INTO category (cname,ctype,psn,osn) "
		ISQL = ISQL& " Values ('"& cname &"','"& RefTitle &"',"& ParentSN &","& osn &")"
		'Response.Write "ISQL="&ISQL&"<BR>"
		'Response.end
		CONN.execute(ISQL)
		 
		If Err.Number <> 0 then
			result = "FAIL"
		Else
			result = "SUCCESS"
		End if 
	else
		result = ErrDescription
	End if	
	Select Case result
		Case "SUCCESS":
			PopMessage "Replace","建立成功","admin.asp"
		Case "FAIL":
			DeletAllFile FileName
			PopMessage "Back","建立失敗，請稍後再試",""
		Case Else:
			DeletAllFile FileName
			PopMessage "Back","建立失敗，請稍後再試("& result &")",""
	End Select	
'結束SmartUpload作業 
Set objUpload = nothing
%>