<%
Function isblank(str)
	if str="" or str=null or isnull(str) then
		isblank=true
	else
		isblank=false
	end if	
End Function
'on error resume next
Function GetMemberType(str)
	if str="製造業" or str="設計師" or str="建築師" or str="建設公司" then
		GetMemberType = "特殊會員"
	else
		GetMemberType = "一般會員"
	end if	
End Function

Function Getdistrict(str)
	Getdistrict = right(str,len(str)-instr(1,str," ",1))
End Function

Function GetProductCount(sn)
   Dim c1,c2,c3
   c1= GetStringBySQL("SELECT count(sn) from product where instr(','+iif( IsNull(csn1)=-1 , '' , csn1 )+',' , ',"& sn &",' )>0")
   c2= GetStringBySQL("SELECT count(sn) from product where instr(','+iif( IsNull(csn2)=-1 , '' , csn2 )+',' , ',"& sn &",' )>0")
   c3= GetStringBySQL("SELECT count(sn) from product where instr(','+iif( IsNull(csn3)=-1 , '' , csn3 )+',' , ',"& sn &",' )>0")
   GetProductCount=c1+c2+c3
	'GetProductCount = GetStringByWhereString("product","count(sn)","Where csn1 in (select sn from v_category where psn="& sn &" or sn="& sn &") or csn2 in (select sn from v_category where psn="& sn &" or sn="& sn &") or csn3 in (select sn from v_category where psn="& sn &" or sn="& sn &")")
End Function

Function GetProductCountBysn1(sn,ctype)
	if ctype="pro" then
		GetProductCountBysn1 = GetStringByWhereString("product","count(sn)","Where csn1 ="& sn )
	else
		GetProductCountBysn1 = GetStringByWhereString("product","count(sn)","Where csn2 ="& sn )
	end if
End Function

'取完整類別
Function GatCategoryStr(sn)
	'GatCategoryStr = GetStringByWhereString("(category a","case when isnull(b.cname,'')='' then a.cname else b.cname+'/'+a.cname end as cname","left join category b on a.psn=b.sn )where a.sn="&sn &"" )
	GatCategoryStr = GetStringByWhereString("(category a"," iif(b.cname='',b.cname+'/'+a.cname,a.cname) as cname","left join category b on a.psn=b.sn )where a.sn="& sn &"" )
    'IIF(判斷式,True的回傳值,False的回傳值)
End Function


'刪除檔案(檔案實體路徑,檔案名)
Sub delfile(SavePath,FileName)
	Dim delfilefs
	set delfilefs = server.createobject("scripting.filesystemobject")
	if delfilefs.FileExists(SavePath&"\"&FileName) then delfilefs.DeleteFile(SavePath&"\"&FileName)
	Set delfilefs = nothing	
End Sub
'刪除陣列所有檔案
Sub DeletAllFile(ByRef delFile)
	Dim fi,dfs,SavePath
	SavePath = Server.MapPath("/upload")
	set dfs = server.createobject("scripting.filesystemobject")
	For fi = 0 to UBound(delFile)
		if dfs.FileExists(SavePath&"\"&delFile(0)) then dfs.DeleteFile(SavePath&"\"&delFile(0))
	Next
	Set dfs = nothing	
end Sub
 
'回傳RS(資料表名稱,欄位字串,條件字串,連線類別)
Function GetDataByWhereString(tablename,colnameString,WhereString)
	Dim GDBTCSSQL,GDBTCSRS
	Set GDBTCSRS = Server.CreateObject("ADODB.RECORDSET")
	GDBTCSSQL = "Select " & colnameString & " from " & tablename &" "& WhereString
	'Response.write "GDBTCSSQL="&GDBTCSSQL&"<BR>"
	'Response.end
	GDBTCSRS.open GDBTCSSQL,conn,1,3
	Set	GetDataByWhereString = GDBTCSRS
End Function
'回傳值(資料表名稱,欄位名稱,索引值欄位名稱,索引值)
Function GetStringByWhereString(tablename,colname,WhereString)
	Dim GDBTCSSQL,GDBTCSRS,ANS,tempi
	Set GDBTCSRS = Server.CreateObject("ADODB.RECORDSET")
	GDBTCSSQL = "Select " & colname & " from " & tablename &" "& WhereString
	'Response.write "GDBTCSSQL="&GDBTCSSQL&"<BR>"
	'Response.end
	GDBTCSRS.open GDBTCSSQL,conn,1,3
	'GDBTCSRS.open GDBTCSSQL,conn,1,3
	if GDBTCSRS.eof then
		ANS = ""	
	else
		ANS = GDBTCSRS(0)
	end if
	Set GDBTCSRS = nothing
	GetStringByWhereString = ANS
End Function
Function GetCategoryNameByArray(txtstring)
   Dim temparray,adi,temp,ans
   if isblank(txtstring) then
      GetCategoryByArray=""
   else
      temparray = split(txtstring,",")
		for adi=0 to UBound(temparray)
		   if trim(temparray(adi))<>"" then
            if ans="" then
		         ans = GetStringBySQL("select cname from category where sn="& temparray(adi) )
            else
               ans = ans &","& GetStringBySQL("select cname from category where sn="& temparray(adi) )
            end if
		   end if

		next
      GetCategoryNameByArray = ans
	end if
End Function
'回傳值(SQL)
Function GetStringBySQL(SQL)
	Dim GDBTCSSQL,GDBTCSRS,ANS,tempi
	if SQL<>"" and not isnull(SQL) then
		Set GDBTCSRS = Server.CreateObject("ADODB.RECORDSET")
		'Response.write "SQL="&SQL&"<BR>"
		'Response.end 
		GDBTCSRS.open SQL,conn,1,3
		if GDBTCSRS.eof then
			ANS = ""	
		else
			ANS = GDBTCSRS(0)
		end if
		GDBTCSRS.close
		Set GDBTCSRS = nothing
	else
		ANS = ""
	end if
	GetStringBySQL = ANS
End Function
'回傳RS(SQL)
Function GetDataBySQL(SQL)
	Dim GDBTCSSQL,GDBTCSRS
	Set GDBTCSRS = Server.CreateObject("ADODB.RECORDSET")
	GDBTCSSQL = SQL
	'Response.write "GDBTCSSQL="&GDBTCSSQL&"<BR>"
	'Response.end
	GDBTCSRS.open GDBTCSSQL,conn,1,3
	Set	GetDataBySQL = GDBTCSRS
End Function

'回傳值(資料表名稱,欄位名稱,索引值欄位名稱,索引值,索引值類型(int or other))
Function GetDataByTableColumnSN(tablename,colname,indexcolname,indexvalue,indextype)
	Dim GDBTCSSQL,GDBTCSRS,ANS,tempi
	Set GDBTCSRS = Server.CreateObject("ADODB.RECORDSET")
	tempi=indexvalue
	if Lcase(indextype) = "int" then
		if indexvalue = "" or isnull(indexvalue) then tempi = 0	
		GDBTCSSQL = "Select [" & colname & "] from " & tablename & " Where " & indexcolname & "= " & cint(tempi)
	else
		if isnull(indexvalue) then tempi = ""		
		GDBTCSSQL = "Select [" & colname & "] from " & tablename & " Where " & indexcolname & "= '" & tempi &"'"
	end if
	'Response.write "GDBTCSSQL="&GDBTCSSQL&"<BR>"
	'Response.end
	GDBTCSRS.open GDBTCSSQL,conn,1,3
	'GDBTCSRS.open GDBTCSSQL,conn,1,3
	if GDBTCSRS.eof then
		ANS = ""	
	else
		ANS = GDBTCSRS(colname)
	end if
	Set GDBTCSRS = nothing
	GetDataByTableColumnSN = ANS
End Function

'--取得序號(編號前代碼字串[""：索引值為長整數],資料表名稱,流水號長度,類別["day"以當天時間作序號,""不限])
Function GetSNFile(titalstr,tablename,columnname,intlenght)
	Dim GetSNConn,GetSNSQL,GetSNRS,GetSNStr,temp,DataCreateDate,OldDate,OldYYYY,OldMM,OldDD,diff
	'Set GetSNConn = GetConn()
	Set GetSNRS = Server.CreateObject("ADODB.RECORDSET")
	GetSNSQL = "Select top 1 "& columnname &" From "& tablename &" where "& columnname &" like '%"& titalstr &"%' Order By "& columnname &" Desc"
	'response.write "SQL="&GetSNSQL&"<BR>"
	'response.end
	GetSNRS.open GetSNSQL,conn,1,3
	If not GetSNRS.EOF then
		'資料型別為長整數
		temp = GetSNRS(columnname)
		'response.write "temp1="&temp&"<BR>"
		If GetSNRS.Fields(0).Type = 131 or GetSNRS.Fields(0).Type = 3 or GetSNRS.Fields(0).Type = 2 then
			GetSNStr = Cint(temp)+1			
		Else '序號不是整數型態
			'response.write "test="&instr(1,temp,titalstr,0)&"<BR>"
			If temp <>"" then
				If instr(1,temp,Ucase(titalstr),0) <> 0 then'撈出字串不同目前欄位字串
					OldDate = Replace(temp,Ucase(titalstr),"")
					'response.write "OldDate1="&OldDate&"<BR>"
					temp = left(OldDate,(8+intlenght))
					OldYYYY = left(OldDate,4)
					OldMM = left(right(OldDate,len(OldDate)-4),2)
					OldDD = left(right(OldDate,len(OldDate)-6),2)
					OldDate = OldYYYY&"/"&OldMM&"/"&OldDD
					'response.write "temp="&temp&"<BR>"
					'response.write "OldDate2="&OldDate&"<BR>"
					diff = DateDiff("h", Now,DateAdd("d",1,Year(OldDate)&"/"&Month(OldDate)&"/"&(Day(OldDate))))
					'判斷是否為當天
					If diff <= 24 and diff >= 0 then'最新的序號是當天的
						GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,Cint(right(temp,intlenght))+1)
					Else'不是當天
						GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,1)
					End If	
					'response.write "getYYYYMMDD()="&getYYYYMMDD()&"<BR>"
					'response.write "GetSNStr="&GetSNStr&"<BR>"
				Else
					GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,1)
				End If
			Else
				GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,1)
			End If
		End If
	Else
	'資料表無資料時
		If titalstr = "" then 
			GetSNStr = 1
		Else 
			GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,1)
		End If
	End If
	Set GetSNRS = nothing
	Set GetSNConn = nothing
	GetSNFile = GetSNStr
End Function
'--取得序號(編號前代碼字串[""：索引值為長整數],資料表名稱,流水號長度,類別["day"以當天時間作序號,""不限])
Function GetSN(titalstr,tablename,columnname,intlenght)
	Dim GetSNConn,GetSNSQL,GetSNRS,GetSNStr,temp,DataCreateDate,OldDate,OldYYYY,OldMM,OldDD,diff
	'Set GetSNConn = GetConn()
	Set GetSNRS = Server.CreateObject("ADODB.RECORDSET")
	GetSNSQL = "Select top 1 "& columnname &" From "& tablename &" Order By "& columnname &" Desc"
	'response.write "SQL="&GetSNSQL&"<BR>"
	'response.end
	GetSNRS.open GetSNSQL,conn,1,3
	If not GetSNRS.EOF then
		'資料型別為長整數
		temp = GetSNRS(columnname)
		if trim(temp) = "" or isnull(temp) then temp = 0
'		response.write "temp1="&temp&"<BR>"
		'response.end 
		If GetSNRS.Fields(0).Type = 131 or GetSNRS.Fields(0).Type = 3 or GetSNRS.Fields(0).Type = 2 then
			GetSNStr = Cint(temp)+1			
		Else '序號不是整數型態
			if temp <>"" then
				OldDate = Replace(temp,Ucase(titalstr),"")
				'temp = left(OldDate,(len(OldDate)-intlenght))
				OldYYYY = left(OldDate,4)
				OldMM = left(right(OldDate,len(OldDate)-4),2)
				OldDD = left(right(OldDate,len(OldDate)-6),2)
				OldDate = OldYYYY&"/"&OldMM&"/"&OldDD
				'response.write "temp="&temp&"<BR>"
				'response.write "OldDate="&OldDate&"<BR>"
				diff = DateDiff("h", Now,DateAdd("d",1,Year(OldDate)&"/"&Month(OldDate)&"/"&(Day(OldDate))))
				'判斷是否為當天
				If diff <= 24 and diff >= 0 then'最新的序號是當天的
					GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,Cint(right(temp,intlenght))+1)
				Else'不是當天
					GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,1)
				End If	
				'response.write "GetSNStr="&GetSNStr&"<BR>"
			else
				GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,1)
			end if
		End If
	Else
	'資料表無資料時
		If titalstr = "" then 
			GetSNStr = 1
		Else 
			GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,1)
		End If
	End If
	Set GetSNRS = nothing
	Set GetSNConn = nothing
	GetSN = GetSNStr
End Function
'取得目前日期字串YYYYMMDD
Function getYYYYMMDD()
	getYYYYMMDD = cstr(Year(Now)) & toMend(2,cstr(Month(Now))) & toMend(2,Day(Now))
End Function
'字串補0
Function toMend(strlen,txt)
	Dim toMendcount,toMendlen,toMendtxt
	toMendtxt = txt 
	If len(txt) < Cint(strlen) then
		toMendlen = Cint(strlen) - len(txt)
		For toMendcount = 1 to toMendlen
			toMendtxt = "0"&toMendtxt
		Next
	End If
	toMend = toMendtxt
End Function
Function CheckDataInstr(string1,string2,backstring)
	Dim ans
	if Instr(1,string1,string2,1) <> 0 then
		ans = backstring 
	else
		ans = ""
	end if
	CheckDataInstr=ans
End Function

Function CheckData(string1,string2,backstring)
	Dim ans
	if string1 = string2 then
		ans = backstring 
	else
		ans = ""
	end if
	CheckData=ans
End Function
Function isCorrectContentType(FileType,strContentType)
	If InStr(1,strContentType,FileType,1) = 0 then
		isCorrectContentType = False
	Else
		isCorrectContentType = True
	End If
	Exit Function
End Function

Sub PopMessage(Flag,Msg,Location)
	Select Case UCase(Flag)
		Case "BACK" :
			Response.Write "<script>alert('"& Msg &"');history.go(-1);</script>"
			Response.End
		Case "REPLACE" :
			Response.Write "<script>alert('"& Msg &"');document.location.replace('"& Location &"');</script>"
			Response.End
		Case "CLOSE" :
			Response.Write "<script>alert('"& Msg &"');window.close();</script>"
			Response.End
		Case "CLOSE&RELOAD" :
			Response.Write "<script>alert('"& Msg &"');window.close();opener.document.location.replace('"& Location &"');</script>"
			Response.End
		Case "" :
			if Location<>"" then
				Response.Write "<script>document.location.replace('"& Location &"');</script>"
				Response.End
			end if
	End Select
End Sub
'---- 修正 ' ----
Function filter_data_normal(data)
	If data = "" Then
		filter_data_normal = data
	Else
		data = Replace_String(data,"DECLARE",len("DECLARE"))
		data = Replace_String(data,"VARCHAR",len("VARCHAR"))
		data = Replace_String(data,"EXEC(@",len("EXEC(@"))
		data = Replace_String(data,"CAST(",len("CAST("))
		data = Replace_String(data,"CONVERT(",len("CONVERT("))
		filter_data_normal = Replace(data,"'","、")
	End If
End Function
'---- 必須要填資料-一般 ----
Function filter_data_unnull(data,text)
	If data = "" Then
		PopMessage "Back",text,""
	Else
		data = Replace_String(data,"DECLARE",len("DECLARE"))
		data = Replace_String(data,"VARCHAR",len("VARCHAR"))
		data = Replace_String(data,"EXEC(@",len("EXEC(@"))
		data = Replace_String(data,"CAST(",len("CAST("))
		data = Replace_String(data,"CONVERT(",len("CONVERT("))
		filter_data_unnull = Replace(data,"'","、")
	End If
End Function
'---- 防止 SQL Injection ----
Function filter_data_Injection(data)
	If data = "" Then
		filter_data_Injection = data
	Else
		data = Replace(data,";","")
		data = Replace(data,"@","")
		data = Replace_String(data,"DECLARE",len("DECLARE"))
		data = Replace_String(data,"VARCHAR",len("VARCHAR"))
		data = Replace_String(data,"EXEC(@",len("EXEC(@"))
		data = Replace_String(data,"CAST(",len("CAST("))
		data = Replace_String(data,"CONVERT(",len("CONVERT("))
		data = Replace_String(data,"update",len("update"))
		data = Replace_String(data,"delete",len("delete"))		
		data = Replace_String(data,"or",len("or"))
		filter_data_Injection = left(Replace(ucase(data),"VARCHAR",""),20)
	End If
End Function
Function Replace_String(str,replace_str,strint)
	Dim stringint
	stringint = instr(1,Ucase(str),Ucase(replace_str),1)
	if stringint = 0 then
		Replace_String = str
	else
		Replace_String = replace(str,left(right(str,len(str)-stringint+1),strint),"")
	end if
End Function
'--------取得日期加星期字串
Function GetToday()
	Dim weekday,d
	d = DatePart("w",Date())
	Select Case d
		Case 1:
			weekday = "Sun."
		Case 2:
			weekday = "Mon."
		Case 3:
			weekday = "Tue."
		Case 4:
			weekday = "Wed."
		Case 5:
			weekday = "Thu."
		Case 6:
			weekday = "Fri."
		Case 7:
			weekday = "Sat."
	End Select
	GetToday = Date()&" "&weekday
End Function

Function HTML_Filter(Cont)
	Dim Content
	Content = Cont
	if isNull(Content) = false then				
		'Content =  Replace(Content,"<","&lt;")
		'Content =  Replace(Content,">","&gt;")
		'Content = Replace(Content,"&lt;br&gt;","<br>")
		Content =  Replace(Content,vbNewLine,"<br>")
	End If
	HTML_Filter = Content
	Exit Function
End Function

Function Content_Filter(Cont)
	Dim Content
	Content = Cont
	If isNull(Content) = false then Content =  Replace(Content,"<br>",vbNewLine)
	Content_Filter = Content
	Exit Function
End Function

'--------字串刪除固定位數
Function CutString(str,length)
	CutString = str
	If isNull(CutString) = false then
		if Len(CutString) <= CInt(length) then Exit Function
		CutString = Left(CutString,CInt(length))&"..."
	end If
	Exit Function
End Function

'-----------DistinctStr(可將字串內重複的資料移除)
Function GetDistinctStr(GetStr)
	Dim GetArrayStr,Stri,Strj,DistinctStr
	GetArrayStr = split(GetStr,",")
	For Stri = 0 to UBound(GetArrayStr)
		For Strj = Stri+1 to UBound(GetArrayStr)
			If GetArrayStr(Stri)&"," = GetArrayStr(Strj)&"," then 
				GetArrayStr(Stri) = ""
				Exit For
			end If 
		Next
	Next
	For Stri = 0 to UBound(GetArrayStr)
		If DistinctStr = "" then 
			If GetArrayStr(Stri) <> "" then DistinctStr = GetArrayStr(Stri)& "," 
		else
			If GetArrayStr(Stri) <> "" then DistinctStr = DistinctStr & GetArrayStr(Stri)& "," 
		end If
	Next
	GetDistinctStr = DistinctStr
End Function

Function GetDate()
	Dim tempDate
	tempDate = now()
	tempDate = FormatDateTime(now(),2)&" "& FormatDateTime(now(),4)
	GetDate = tempDate
End Function

'寄信程式
Function sendmail(toEmail,subject,mailtype,membername)
	Dim HTMLBody,objEmail,SendStatus
	Dim OrderID,Uordcls,URS,URS2,Uprocls,OrderSum,ReName,RePhone,ReMobile,ReAddress,PayMethod,email,OrderName
	Dim ProductID,Price,PerPrice,ProductName,SubTotalPrice,Freight,COD,OrderQTY,UnitText,Unit,PerUnit,TotalUnit

'	objEmail.bodypart.charset = "big5" '==請一定要加這一行,避免中文字破碼 
	'HTMLBody = "<html>"
	SendStatus=false
	Dim mailsubject
	Dim cRS,casename,expectpublishdate,createsn,createEmail,caseunit,casesn
	Dim servicecategory,Qname,inquirycontent,replydate,replycontent
	mailsubject = subject
	select case Lcase(mailtype)
	case "memberjoin"
		HTMLBody ="親愛的 "&membername&" 會員您好!<br>"
		HTMLBody = HTMLBody &"感謝您加入我們網站，<br><br>"
		HTMLBody = HTMLBody &"紅石股份有限公司 敬上"
		SendStatus = true
	case "inquiry"
		HTMLBody ="親愛的 管理者 您好!<br>"
		HTMLBody = HTMLBody &"有新問題，請前往後端處理!!<br>"
		HTMLBody = HTMLBody &"<a href='http://www.redstone.com.tw/manage/service/detial.asp?sn="& membername &"' target='_blank'>回覆</a><br><br>"
		HTMLBody = HTMLBody &"紅石股份有限公司 敬上"
		SendStatus = true
	case "reply"
		Qname = GetStringByWhereString("member","name","where sn="& membername )
		servicecategory = GetStringByWhereString("category","cname","where sn in ( select csn from service where sn="& membername &" ) ")
		inquirycontent = GetStringByWhereString("service","inquirycontent","where sn="&membername)
		replydate = GetStringByWhereString("service","replydate","where sn="&membername)
		replycontent = GetStringByWhereString("service","replycontent","where sn="&membername)
		HTMLBody ="親愛的 "&Qname&" 您好!<br>"
		HTMLBody = HTMLBody &"<B>類別：</B>"&servicecategory&"<br>"
		HTMLBody = HTMLBody &"<B>諮詢內容：</B><br>"&inquirycontent&"<br>"
		HTMLBody = HTMLBody &"<B>諮詢日期：</B>"&replydate&"<br><br>"
		HTMLBody = HTMLBody &"<B>回覆內容：</B><br>"&replycontent&"<br><br>"
		HTMLBody = HTMLBody &"紅石股份有限公司 敬上"
		SendStatus = true
	case "getpwd"
		dim pwd
		pwd = GetStringByWhereString("member","pwd","where sn="&membername)
		Qname = GetStringByWhereString("member","name","where sn="&membername)
		HTMLBody ="親愛的 "& Qname &" 會員您好!<br>"
		HTMLBody = HTMLBody &"<B>密碼：</B>"&pwd&"<br><br>"
		HTMLBody = HTMLBody &"紅石股份有限公司 敬上"
		SendStatus = true
	End Select

	set objEmail = Server.CreateObject("CDO.Message")     'Mailer object
	objEmail.bodypart.charset = "big5" '==請一定要加這一行,避免中文字破碼 
	objEmail.TO = toEmail
	objEmail.From = "rsonline01<rsonline01@redstone.com.tw>"
	objEmail.Subject = subject
	objEmail.HTMLBody = HTMLBody
	objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
   objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.gmail.com"
   objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
	objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = true
   objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "rsonline01@redstone.com.tw"
	objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "rs34220685"
	objEmail.Configuration.Fields.Update

	if SendStatus then objEmail.Send
	Set objEmail = nothing
end function

Function GetCounter(filename)
	Dim objReadTS_t,CounterName_t,objfs_t,HitRate_t
	CounterName_t = Server.MapPath("/"&filename)
	Set objfs_t = CreateObject("Scripting.FileSystemObject")
	Set objReadTs_t = objfs_t.OpenTextFile(CounterName_t,1,-1,0)
	HitRate_t = objReadTs_t.ReadLine
	objReadTs_t.Close
	Set objReadTs_t = nothing
	Set objfs_t = nothing
	GetCounter = HitRate_t	
End Function

%>