<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<%
HasPermission("news")
'���o�Ϳ��~�]���|����
	'on error resume next	
	Dim objUpload,objUploadedFile,ErrDescription,columnname
	Dim FileName,FileTag,i
	'-----------initialize--------------------------------------
	Response.Write("��ƳB�z���A�еy�ԡE�E�E�E")
	FileName = Array(null,null)
	FileTag = Array(null,null)	
	Set objUpload = Server.CreateObject("aspSmartUpload.SmartUpload")
	objUpload.CodePage = "big5"
	objUpload.Upload
	i = 0	
	'��C���ɮפ��O�ʧ@ 
	For each objUploadedFile In objUpload.Files 
		'���W���ɮפ~�s��
		FileTag(i) = objUploadedFile.Name
		if objUploadedFile.FileName <> "" and ErrDescription = "" then
			FileName(i) = GetSNFile(FileTag(i),"category",FileTag(i),3)&"."&objUploadedFile.FileExt
			'�s�ɰʧ@�A�ؿ����|�n�]�w�A�ۤv��������}�U���ؿ��A���Ҭ��z���D�����ؿ��U��upload�ؿ� 
			objUploadedFile.SaveAs  ("/upload/" & FileName(i)) 
			if instr(1,replace(Err.Description,"'",""),"(Error 1120)",1) <> 0 then ErrDescription = "�L�k�x�s�ɮ�!!"
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
			PopMessage "Replace","�إߦ��\","admin.asp"
		Case "FAIL":
			DeletAllFile FileName
			PopMessage "Back","�إߥ��ѡA�еy��A��",""
		Case Else:
			DeletAllFile FileName
			PopMessage "Back","�إߥ��ѡA�еy��A��("& result &")",""
	End Select	
'����SmartUpload�@�~ 
Set objUpload = nothing
%>