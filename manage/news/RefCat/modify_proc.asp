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
		Dim casesn,USQL,sn
		Dim result'----Insert result flag
		Dim cname,oldtitleimg,oldcimg,deltitleimg,delcimg
		sn = filter_data_normal(objUpload.form("sn"))
		cname = filter_data_normal(objUpload.form("cname"))
		'�O�_�R���¤W�ǹ���
		deltitleimg = lcase(filter_data_normal(objUpload.form("deltitleimg")))
		delcimg = lcase(filter_data_normal(objUpload.form("delcimg")))
		'�����ɮ׸��
		oldtitleimg = GetStringByWhereString("category","titleimg","where sn="&sn)
		oldcimg = GetStringByWhereString("category","cimg","where sn="&sn)
		
		For i = 0 to UBound(FileName)
			Select Case FileTag(i)
				Case "titleimg" :
					if deltitleimg<>"yes" and FileName(i)="" then
						titleimg = oldtitleimg
					else
						titleimg = FileName(i)
					end if
				Case "cimg":
					if delcimg<>"yes" and FileName(i)="" then
						cimg = oldcimg
					else
						cimg = FileName(i)
					end if
			End Select
		Next	
		
		USQL = "Update category Set cname='"& cname &"',titleimg='"& titleimg &"',cimg='"& cimg &"'"
		USQL = USQL& " where sn="&sn 
		'Response.Write "USQL="&USQL&"<BR>"
		'Response.end
		CONN.execute(USQL)
		 
		If Err.Number <> 0 then
			result = "FAIL"
		Else
			result = "SUCCESS"
		End if 
	else
		result = ErrDescription
	End if
	'�ɮצs�������|
	Dim FilePath
	FilePath = Server.MapPath("/upload")
		
	Select Case result
		Case "SUCCESS":
			if deltitleimg="yes" or oldtitleimg <> titleimg then delfile FilePath,oldtitleimg 
			if delcimg="yes" or oldcimg <> cimg then delfile FilePath,oldcimg 
			PopMessage "Replace","�ק令�\","admin.asp"
		Case "FAIL":
			DeletAllFile FileName 
			PopMessage "Back","�ק異�ѡA�еy��A��",""
		Case Else:
			DeletAllFile FileName 
			PopMessage "Back","�ק異�ѡA�еy��A��("& result &")",""
	End Select	
'����SmartUpload�@�~ 
Set objUpload = nothing
%>