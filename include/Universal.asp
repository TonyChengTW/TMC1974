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
	if str="�s�y�~" or str="�]�p�v" or str="�ؿv�v" or str="�س]���q" then
		GetMemberType = "�S��|��"
	else
		GetMemberType = "�@��|��"
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

'���������O
Function GatCategoryStr(sn)
	'GatCategoryStr = GetStringByWhereString("(category a","case when isnull(b.cname,'')='' then a.cname else b.cname+'/'+a.cname end as cname","left join category b on a.psn=b.sn )where a.sn="&sn &"" )
	GatCategoryStr = GetStringByWhereString("(category a"," iif(b.cname='',b.cname+'/'+a.cname,a.cname) as cname","left join category b on a.psn=b.sn )where a.sn="& sn &"" )
    'IIF(�P�_��,True���^�ǭ�,False���^�ǭ�)
End Function


'�R���ɮ�(�ɮ׹�����|,�ɮצW)
Sub delfile(SavePath,FileName)
	Dim delfilefs
	set delfilefs = server.createobject("scripting.filesystemobject")
	if delfilefs.FileExists(SavePath&"\"&FileName) then delfilefs.DeleteFile(SavePath&"\"&FileName)
	Set delfilefs = nothing	
End Sub
'�R���}�C�Ҧ��ɮ�
Sub DeletAllFile(ByRef delFile)
	Dim fi,dfs,SavePath
	SavePath = Server.MapPath("/upload")
	set dfs = server.createobject("scripting.filesystemobject")
	For fi = 0 to UBound(delFile)
		if dfs.FileExists(SavePath&"\"&delFile(0)) then dfs.DeleteFile(SavePath&"\"&delFile(0))
	Next
	Set dfs = nothing	
end Sub
 
'�^��RS(��ƪ�W��,���r��,����r��,�s�u���O)
Function GetDataByWhereString(tablename,colnameString,WhereString)
	Dim GDBTCSSQL,GDBTCSRS
	Set GDBTCSRS = Server.CreateObject("ADODB.RECORDSET")
	GDBTCSSQL = "Select " & colnameString & " from " & tablename &" "& WhereString
	'Response.write "GDBTCSSQL="&GDBTCSSQL&"<BR>"
	'Response.end
	GDBTCSRS.open GDBTCSSQL,conn,1,3
	Set	GetDataByWhereString = GDBTCSRS
End Function
'�^�ǭ�(��ƪ�W��,���W��,���ޭ����W��,���ޭ�)
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
'�^�ǭ�(SQL)
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
'�^��RS(SQL)
Function GetDataBySQL(SQL)
	Dim GDBTCSSQL,GDBTCSRS
	Set GDBTCSRS = Server.CreateObject("ADODB.RECORDSET")
	GDBTCSSQL = SQL
	'Response.write "GDBTCSSQL="&GDBTCSSQL&"<BR>"
	'Response.end
	GDBTCSRS.open GDBTCSSQL,conn,1,3
	Set	GetDataBySQL = GDBTCSRS
End Function

'�^�ǭ�(��ƪ�W��,���W��,���ޭ����W��,���ޭ�,���ޭ�����(int or other))
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

'--���o�Ǹ�(�s���e�N�X�r��[""�G���ޭȬ������],��ƪ�W��,�y��������,���O["day"�H��Ѯɶ��@�Ǹ�,""����])
Function GetSNFile(titalstr,tablename,columnname,intlenght)
	Dim GetSNConn,GetSNSQL,GetSNRS,GetSNStr,temp,DataCreateDate,OldDate,OldYYYY,OldMM,OldDD,diff
	'Set GetSNConn = GetConn()
	Set GetSNRS = Server.CreateObject("ADODB.RECORDSET")
	GetSNSQL = "Select top 1 "& columnname &" From "& tablename &" where "& columnname &" like '%"& titalstr &"%' Order By "& columnname &" Desc"
	'response.write "SQL="&GetSNSQL&"<BR>"
	'response.end
	GetSNRS.open GetSNSQL,conn,1,3
	If not GetSNRS.EOF then
		'��ƫ��O�������
		temp = GetSNRS(columnname)
		'response.write "temp1="&temp&"<BR>"
		If GetSNRS.Fields(0).Type = 131 or GetSNRS.Fields(0).Type = 3 or GetSNRS.Fields(0).Type = 2 then
			GetSNStr = Cint(temp)+1			
		Else '�Ǹ����O��ƫ��A
			'response.write "test="&instr(1,temp,titalstr,0)&"<BR>"
			If temp <>"" then
				If instr(1,temp,Ucase(titalstr),0) <> 0 then'���X�r�ꤣ�P�ثe���r��
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
					'�P�_�O�_�����
					If diff <= 24 and diff >= 0 then'�̷s���Ǹ��O��Ѫ�
						GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,Cint(right(temp,intlenght))+1)
					Else'���O���
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
	'��ƪ�L��Ʈ�
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
'--���o�Ǹ�(�s���e�N�X�r��[""�G���ޭȬ������],��ƪ�W��,�y��������,���O["day"�H��Ѯɶ��@�Ǹ�,""����])
Function GetSN(titalstr,tablename,columnname,intlenght)
	Dim GetSNConn,GetSNSQL,GetSNRS,GetSNStr,temp,DataCreateDate,OldDate,OldYYYY,OldMM,OldDD,diff
	'Set GetSNConn = GetConn()
	Set GetSNRS = Server.CreateObject("ADODB.RECORDSET")
	GetSNSQL = "Select top 1 "& columnname &" From "& tablename &" Order By "& columnname &" Desc"
	'response.write "SQL="&GetSNSQL&"<BR>"
	'response.end
	GetSNRS.open GetSNSQL,conn,1,3
	If not GetSNRS.EOF then
		'��ƫ��O�������
		temp = GetSNRS(columnname)
		if trim(temp) = "" or isnull(temp) then temp = 0
'		response.write "temp1="&temp&"<BR>"
		'response.end 
		If GetSNRS.Fields(0).Type = 131 or GetSNRS.Fields(0).Type = 3 or GetSNRS.Fields(0).Type = 2 then
			GetSNStr = Cint(temp)+1			
		Else '�Ǹ����O��ƫ��A
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
				'�P�_�O�_�����
				If diff <= 24 and diff >= 0 then'�̷s���Ǹ��O��Ѫ�
					GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,Cint(right(temp,intlenght))+1)
				Else'���O���
					GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,1)
				End If	
				'response.write "GetSNStr="&GetSNStr&"<BR>"
			else
				GetSNStr = Ucase(titalstr) & getYYYYMMDD() & toMend(intlenght,1)
			end if
		End If
	Else
	'��ƪ�L��Ʈ�
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
'���o�ثe����r��YYYYMMDD
Function getYYYYMMDD()
	getYYYYMMDD = cstr(Year(Now)) & toMend(2,cstr(Month(Now))) & toMend(2,Day(Now))
End Function
'�r���0
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
'---- �ץ� ' ----
Function filter_data_normal(data)
	If data = "" Then
		filter_data_normal = data
	Else
		data = Replace_String(data,"DECLARE",len("DECLARE"))
		data = Replace_String(data,"VARCHAR",len("VARCHAR"))
		data = Replace_String(data,"EXEC(@",len("EXEC(@"))
		data = Replace_String(data,"CAST(",len("CAST("))
		data = Replace_String(data,"CONVERT(",len("CONVERT("))
		filter_data_normal = Replace(data,"'","�B")
	End If
End Function
'---- �����n����-�@�� ----
Function filter_data_unnull(data,text)
	If data = "" Then
		PopMessage "Back",text,""
	Else
		data = Replace_String(data,"DECLARE",len("DECLARE"))
		data = Replace_String(data,"VARCHAR",len("VARCHAR"))
		data = Replace_String(data,"EXEC(@",len("EXEC(@"))
		data = Replace_String(data,"CAST(",len("CAST("))
		data = Replace_String(data,"CONVERT(",len("CONVERT("))
		filter_data_unnull = Replace(data,"'","�B")
	End If
End Function
'---- ���� SQL Injection ----
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
'--------���o����[�P���r��
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

'--------�r��R���T�w���
Function CutString(str,length)
	CutString = str
	If isNull(CutString) = false then
		if Len(CutString) <= CInt(length) then Exit Function
		CutString = Left(CutString,CInt(length))&"..."
	end If
	Exit Function
End Function

'-----------DistinctStr(�i�N�r�ꤺ���ƪ���Ʋ���)
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

'�H�H�{��
Function sendmail(toEmail,subject,mailtype,membername)
	Dim HTMLBody,objEmail,SendStatus
	Dim OrderID,Uordcls,URS,URS2,Uprocls,OrderSum,ReName,RePhone,ReMobile,ReAddress,PayMethod,email,OrderName
	Dim ProductID,Price,PerPrice,ProductName,SubTotalPrice,Freight,COD,OrderQTY,UnitText,Unit,PerUnit,TotalUnit

'	objEmail.bodypart.charset = "big5" '==�Ф@�w�n�[�o�@��,�קK����r�}�X 
	'HTMLBody = "<html>"
	SendStatus=false
	Dim mailsubject
	Dim cRS,casename,expectpublishdate,createsn,createEmail,caseunit,casesn
	Dim servicecategory,Qname,inquirycontent,replydate,replycontent
	mailsubject = subject
	select case Lcase(mailtype)
	case "memberjoin"
		HTMLBody ="�˷R�� "&membername&" �|���z�n!<br>"
		HTMLBody = HTMLBody &"�P�±z�[�J�ڭ̺����A<br><br>"
		HTMLBody = HTMLBody &"���۪ѥ��������q �q�W"
		SendStatus = true
	case "inquiry"
		HTMLBody ="�˷R�� �޲z�� �z�n!<br>"
		HTMLBody = HTMLBody &"���s���D�A�Ыe����ݳB�z!!<br>"
		HTMLBody = HTMLBody &"<a href='http://www.redstone.com.tw/manage/service/detial.asp?sn="& membername &"' target='_blank'>�^��</a><br><br>"
		HTMLBody = HTMLBody &"���۪ѥ��������q �q�W"
		SendStatus = true
	case "reply"
		Qname = GetStringByWhereString("member","name","where sn="& membername )
		servicecategory = GetStringByWhereString("category","cname","where sn in ( select csn from service where sn="& membername &" ) ")
		inquirycontent = GetStringByWhereString("service","inquirycontent","where sn="&membername)
		replydate = GetStringByWhereString("service","replydate","where sn="&membername)
		replycontent = GetStringByWhereString("service","replycontent","where sn="&membername)
		HTMLBody ="�˷R�� "&Qname&" �z�n!<br>"
		HTMLBody = HTMLBody &"<B>���O�G</B>"&servicecategory&"<br>"
		HTMLBody = HTMLBody &"<B>�Ըߤ��e�G</B><br>"&inquirycontent&"<br>"
		HTMLBody = HTMLBody &"<B>�Ըߤ���G</B>"&replydate&"<br><br>"
		HTMLBody = HTMLBody &"<B>�^�Ф��e�G</B><br>"&replycontent&"<br><br>"
		HTMLBody = HTMLBody &"���۪ѥ��������q �q�W"
		SendStatus = true
	case "getpwd"
		dim pwd
		pwd = GetStringByWhereString("member","pwd","where sn="&membername)
		Qname = GetStringByWhereString("member","name","where sn="&membername)
		HTMLBody ="�˷R�� "& Qname &" �|���z�n!<br>"
		HTMLBody = HTMLBody &"<B>�K�X�G</B>"&pwd&"<br><br>"
		HTMLBody = HTMLBody &"���۪ѥ��������q �q�W"
		SendStatus = true
	End Select

	set objEmail = Server.CreateObject("CDO.Message")     'Mailer object
	objEmail.bodypart.charset = "big5" '==�Ф@�w�n�[�o�@��,�קK����r�}�X 
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