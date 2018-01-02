 <%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("news")	'有發生錯誤也不會停止
	'on error resume next
	Dim objUpload,objUploadedFile,ErrDescription,columnname
	Dim FileName,FileTag,i
	'-----------initialize--------------------------------------
	Response.Write("資料處理中，請稍候‧‧‧‧")
	
	'上傳檔案處理
'	FileName = Array(null,null,null,null)
'	FileTag = Array(null,null,null,null)
'	Set objUpload = Server.CreateObject("aspSmartUpload.SmartUpload")
'	objUpload.CodePage = "big5"
'	objUpload.Upload
'	i = 0
	
	'對每個檔案分別動作 
'	For each objUploadedFile In objUpload.Files
		'有上傳檔案才存檔
'		FileTag(i) = objUploadedFile.Name
'		if objUploadedFile.FileName <> "" and ErrDescription = "" then
'			FileName(i) = GetSNFile("N"&FileTag(i),"new",FileTag(i),3)&"."&objUploadedFile.FileExt
'			'存檔動作，目錄路徑要設定你自己的網站位址下的目錄，此例為您的主網頁目錄下的upload目錄
'			objUploadedFile.SaveAs  ("/upload/" & FileName(i))
'			if instr(1,replace(Err.Description,"'",""),"(Error 1120)",1) <> 0 then ErrDescription = "無法儲存檔案!!"
'		else
'			FileName(i) = ""
'		end if
'		i=i+1
'	next
	'其他資料處理
	if ErrDescription = "" or isnull(ErrDescription) then
		Dim pic1,pic2,pic3,nfile,sn,oldpic1,oldpic2,oldpic3,oldnfile,delpic1,delpic2,delpic3,delnfile
		Dim USQL,Poster
		Dim result'----Insert result flag
		Dim category,title,releasedate,startdate,enddate,hintpic,head1,content1,head2,content2,head3,head4,content3,content4,sdate,coverLink,htitle1,htitle2,htitle3
		'讀取資料
		sn = filter_data_normal(Request.form("sn"))
		category = filter_data_normal(Request.form("category"))
		title = filter_data_normal(Request.form("title"))
		releasedate = filter_data_normal(Request.form("releasedate"))
		startdate = filter_data_normal(Request.form("startdate"))
                sdate = filter_data_normal(Request.form("sdate"))
		enddate = filter_data_normal(Request.form("enddate"))
		hintpic = filter_data_normal(Request.form("hintpic"))
		content1 = HTML_Filter(filter_data_normal(Request.form("content1")))
                content2 = HTML_Filter(filter_data_normal(Request.form("content2")))
                 content3= HTML_Filter(filter_data_normal(Request.form("content3")))
  		content4= HTML_Filter(filter_data_normal(Request.form("content4")))
                head1= HTML_Filter(filter_data_normal(Request.form("head1")))
		head2= HTML_Filter(filter_data_normal(Request.form("head2")))
		head3= HTML_Filter(filter_data_normal(Request.form("head3")))
		head4= HTML_Filter(filter_data_normal(Request.form("head4")))
                htitle1 = HTML_Filter(filter_data_normal(Request.form("htitle1")))
		htitle2 = HTML_Filter(filter_data_normal(Request.form("htitle2")))
		htitle3 = HTML_Filter(filter_data_normal(Request.form("htitle3")))
		nfile = filter_data_normal(Request.form("nfile"))
                coverLink= HTML_Filter(filter_data_normal(Request.form("coverLink")))
				  Poster= HTML_Filter(filter_data_normal(Request.form("Poster")))
		'是否刪除舊上傳圖檔
'		delpic1 = lcase(filter_data_normal(objUpload.form("delpic1")))
'		delpic2 = lcase(filter_data_normal(objUpload.form("delpic2")))
'		delpic3 = lcase(filter_data_normal(objUpload.form("delpic3")))
'		delnfile = lcase(filter_data_normal(objUpload.form("delnfile")))
		'撈舊檔案資料
'		oldpic1 = GetStringByWhereString("new","pic1","where sn="&sn)
'		oldpic2 = GetStringByWhereString("new","pic2","where sn="&sn)
'		oldpic3 = GetStringByWhereString("new","pic3","where sn="&sn)
'		oldnfile = GetStringByWhereString("new","nfile","where sn="&sn)
		'判斷及選擇上傳檔案檔名
'		For i = 0 to UBound(FileName)
'			Select Case FileTag(i)
'				Case "pic1" :
'					if delpic1<>"yes" and FileName(i)="" then
'						pic1 = oldpic1
'					else
'						pic1 = FileName(i)
'					end if
'				Case "pic2":
'					if delpic2<>"yes" and FileName(i)="" then
'						pic2 = oldpic2
'					else
'						pic2 = FileName(i)
'					end if
'				Case "pic3":
'					if delpic3<>"yes" and FileName(i)="" then
'						pic3 = oldpic3
'					else
'						pic3 = FileName(i)
'					end if
'				'Case "nfile":
'				'	if delnfile<>"yes" and FileName(i)="" then
				'		nfile = oldnfile
				'	else
				'		nfile = FileName(i)
				'	end if					
'			End Select
'		Next
'		if category="" then category="null"	
'		USQL = "Update new Set category="& category &",title='"& title &"',releasedate='"& releasedate &"',startdate='"& startdate &"',enddate='"& 'enddate &"'"
'		USQL = USQL+ ",hintpic='"& hintpic &"',content1='"& content1 &"' ,content2='"& content2 &"'  ,content3='"& content3 &"' 
'                USQL = USQL + ",head1='"& head1 &"'   ,head2='"& head2 &"'    ,head3='"& head3 &"' ,pic1='"& pic1 &"',pic2='"& pic2 &"',pic3='"& pic3 &"' 
'                USQL = USQL + ",nfile='"& nfile &"',mdate='"&GetDate()&"'  where sn="&sn
USQL = "Update new Set category="& category &",title='"& title &"',releasedate='"& releasedate &"',startdate='"& startdate &"',sdate='"& sdate &"',enddate='"& enddate &"'"
USQL = USQL&",hintpic='"& hintpic &"',content1='"& content1 &"',content2='"& content2 &"',content3='"& content3 &"',content4='"& content4 &"',head1='"& head1 &"',head2='"& head2 &"',head3='"& head3 &"',head4='"& head4 &"', pic1='"& pic1 &"',pic2='"& pic2 &"',pic3='"& pic3 &"',coverLink='"& coverLink &"',htitle1='"& htitle1 &"',htitle2='"& htitle2 &"',htitle3='"& htitle3 &"',Poster='"& Poster &"',nfile='"& nfile &"',mdate='"&GetDate()&"'  where sn="&sn
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
	'檔案存放實體路徑
'	Dim FilePath
'	FilePath = Server.MapPath("/upload")
	Select Case result
		Case "SUCCESS":
'			if delpic1="yes" or oldpic1 <> pic1 then delfile FilePath,oldpic1
'			if delpic2="yes" or oldpic2 <> pic2 then delfile FilePath,oldpic2
'			if delpic3="yes" or oldpic3 <> pic3 then delfile FilePath,oldpic3
'			if delnfile="yes" or oldnfile <> nfile then delfile FilePath,oldnfile
			PopMessage "Replace","修改成功","admin.asp"
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