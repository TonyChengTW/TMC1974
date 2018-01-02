<% Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%

HasPermission("news")	'有發生錯誤也不會停止
	'on error resume next
	Dim ErrDescription,columnname
	Dim FileName,FileTag,i
	Dim pic1,pic2,pic3,nfile
	Dim ISQL,Poster
	Dim result'----Insert result flag
	Dim category,title,releasedate,startdate,enddate,hintpic,content1, content2, content3, content4, head1, head2,head3,head4,sdate,coverLink,htitle1,htitle2,htitle3
	
'	Set objUpload = Server.CreateObject("aspSmartUpload.SmartUpload")
	'-----------initialize--------------------------------------
	Response.Write("資料處理中，請稍候‧‧‧‧")
'	FileName = Array(null,null,null,null)
'	FileTag = Array(null,null,null,null)
'	objUpload.CodePage = "big5"
	
'	objUpload.Upload
	'Response.end 
	i = 0	
	
	'對每個檔案分別動作 
'	For each objUploadedFile In objUpload.Files
'		'有上傳檔案才存檔
'		FileTag(i) = RequestedFile.Name
'		if objUploadedFile.FileName <> "" and ErrDescription = "" then
'			FileName(i) = GetSNFile("N"&FileTag(i),"new",FileTag(i),3)&"."&objUploadedFile.FileExt
'			'存檔動作，目錄路徑要設定你自己的網站位址下的目錄，此例為您的主網頁目錄下的upload目錄
'			RequestedFile.SaveAs  ("/upload/" & FileName(i))
'			if instr(1,replace(Err.Description,"'",""),"(Error 1120)",1) <> 0 then ErrDescription = "無法儲存檔案!!"
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
                sdate = filter_data_normal(Request.form("sdate"))
		hintpic = filter_data_normal(Request.form("hintpic"))
		content1 = HTML_Filter(filter_data_normal(Request.form("content1")))
                content2 = HTML_Filter(filter_data_normal(Request.form("content2")))
		content3 = HTML_Filter(filter_data_normal(Request.form("content3")))
                content4 = HTML_Filter(filter_data_normal(Request.form("content4")))
		head1 = HTML_Filter(filter_data_normal(Request.form("head1")))
		head2 = HTML_Filter(filter_data_normal(Request.form("head2")))
		head3 = HTML_Filter(filter_data_normal(Request.form("head3")))
		head4 = HTML_Filter(filter_data_normal(Request.form("head4")))
                htitle1 = HTML_Filter(filter_data_normal(Request.form("htitle1")))
		htitle2 = HTML_Filter(filter_data_normal(Request.form("htitle1")))
		htitle3 = HTML_Filter(filter_data_normal(Request.form("htitle3")))
		nfile = filter_data_normal(Request.form("nfile"))
                coverLink= HTML_Filter(filter_data_normal(Request.form("coverLink")))
                Poster= HTML_Filter(filter_data_normal(Request.form("Poster")))
   
                
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
ISQL = "INSERT INTO new (category,title,releasedate,startdate,enddate,sdate,hintpic,content1,pic1,pic2,pic3,content2,content3,content4,head1,head2,head3,head4,coverLink,htitle1,htitle2,htitle3,Poster, nfile) "
ISQL = ISQL& " Values ("& category &",'"& title &"','"& releasedate &"','"& startdate &"','"& enddate &"','"& sdate &"','"& hintpic &"','"& content1 &_
       "','"& pic1 &"','" & pic2 &"','"& pic3 &"','"& content2 &"','"& content3 &"','"& content4 &"','"& head1 &"','"& head2 &"','"& head3 &"','"& head4 &"','"& coverLink &"', '"& htitle1 &"', '"& htitle2 &"', '"& htitle3 &"', '"& Poster &"','"& nfile &"')"
		

 
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
'Set objUpload = nothing
%>