<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("news")	'���o�Ϳ��~�]���|����
	'on error resume next
	Dim ErrDescription,columnname
	Dim FileName,FileTag,i
	Dim pic1,pic2,pic3,nfile
	Dim ISQL
	Dim result'----Insert result flag
	Dim category,title,releasedate,startdate,enddate,hintpic,content1
	
'	Set objUpload = Server.CreateObject("aspSmartUpload.SmartUpload")
	'-----------initialize--------------------------------------
	Response.Write("��ƳB�z���A�еy�ԡE�E�E�E")
'	FileName = Array(null,null,null,null)
'	FileTag = Array(null,null,null,null)
'	objUpload.CodePage = "big5"
	
'	objUpload.Upload
	'Response.end 
	i = 0	
	
	'��C���ɮפ��O�ʧ@ 
'	For each objUploadedFile In objUpload.Files
'		'���W���ɮפ~�s��
'		FileTag(i) = RequestedFile.Name
'		if objUploadedFile.FileName <> "" and ErrDescription = "" then
'			FileName(i) = GetSNFile("N"&FileTag(i),"new",FileTag(i),3)&"."&objUploadedFile.FileExt
'			'�s�ɰʧ@�A�ؿ����|�n�]�w�A�ۤv��������}�U���ؿ��A���Ҭ��z���D�����ؿ��U��upload�ؿ�
'			RequestedFile.SaveAs  ("/upload/" & FileName(i))
'			if instr(1,replace(Err.Description,"'",""),"(Error 1120)",1) <> 0 then ErrDescription = "�L�k�x�s�ɮ�!!"
'		else
'			FileName(i) = ""
'		end if
'		i=i+1
'	next
	'Response.end 
	if ErrDescription = "" or isnull(ErrDescription) then
		category = filter_data_normal(request.form("category"))
		title = filter_data_normal(Request.form("title"))
		releasedate = filter_data_normal(Request.form("releasedate"))
		startdate = filter_data_normal(Request.form("startdate"))
		enddate = filter_data_normal(Request.form("enddate"))
		hintpic = filter_data_normal(Request.form("hintpic"))
		content1 = HTML_Filter(filter_data_normal(Request.form("content1")))
		nfile = filter_data_normal(Request.form("nfile"))
'		For i = 0 to UBound(FileName)
'			Select Case FileTag(i)
'				Case "pic1" :
'					pic1 = FileName(i)
'				Case "pic2":
'					pic2 = FileName(i)
'				Case "pic3":
'					pic3 = FileName(i)
				'Case "nfile":
				'	nfile = FileName(i)
'			End Select
'		Next
		if category="" then category="null"
		ISQL = "INSERT INTO new (category,title,releasedate,startdate,enddate,hintpic,content1,pic1,pic2,pic3,nfile) "
		ISQL = ISQL& " Values ("& category &",'"& title &"','"& releasedate &"','"& startdate &"','"& enddate &"','"& hintpic &"','"& content1 &"','"& pic1 &"','"& pic2 &"','"& pic3 &"','"& nfile &"')"
		
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
'Set objUpload = nothing
%>