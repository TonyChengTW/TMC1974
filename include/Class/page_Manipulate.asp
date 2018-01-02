<meta http-equiv="Content-Type" content="text/html; charset=big5">	
<%
	Class Page_Class
		Private List_OrderSeq					'Order Sequence
		Private List_OrderBy					'Order By What Column
		Private List_PSize						'UserLis Page Size
		Private List_AbsPage					'UserList Absolute Page
		Private List_AtlCount					'Total Products
		Private List_PageCount					'List PageCount
		Private Sub Class_Initialize			'Setup Initialize event
			List_OrderSeq = "Desc"
			List_OrderBy = "CreateDate"
			List_PSize = 10
			List_AbsPage = 1
			List_AtlCount = 0
			List_PageCount = 1
		End Sub
		Private Sub Class_Terminate   ' Setup Terminate event.
		End Sub
'-------搜尋用
		Public Function GetListBySearch(TableName,IndxColumnName,SearchText)
			Dim ProductListRS,ProductListSQL1,ProductListSQL
			Set ProductListRS = Server.CreateObject("ADODB.Recordset")
			if List_AbsPage > 1 then
				ProductListSQL1 = "Select Top "& (Cint(List_PSize)*(cint(List_AbsPage)-1)) &" "&IndxColumnName&" From "&TableName&" "& SearchText &" Order By "& List_OrderBy &" "& List_OrderSeq
			else
				ProductListSQL1 = "Select "&IndxColumnName&" From "&TableName&" Where "&IndxColumnName&" is null"
			end if
			ProductListSQL = "Select Top " & List_PSize &" "&IndxColumnName&" From "&TableName&" "& SearchText &" And "&IndxColumnName&" not in ("& ProductListSQL1 &") Order By "& List_OrderBy &" "& List_OrderSeq
			ProductListSQL = "Select * From "&TableName&" "& SearchText &" and  "&IndxColumnName&" in("& ProductListSQL &") Order By "& List_OrderBy &" "& List_OrderSeq
'			Response.Write "ProductListSQL="&ProductListSQL&"<BR>"
'			Response.end
			ProductListRS.open ProductListSQL,conn,1,3
			Set GetListBySearch = ProductListRS
			List_PageCount = GetPageCount(TableName,IndxColumnName,SearchText)
			List_AtlCount = GetCount(TableName,IndxColumnName,SearchText)			
			Exit Function
		End Function
		
		Public Function GetList(TableName,IndxColumnName)
			Dim ProductListRS,ProductListSQL1,ProductListSQL
			Set ProductListRS = Server.CreateObject("ADODB.Recordset")
			if List_AbsPage > 1 then
				ProductListSQL1 = "Select Top "& (Cint(List_PSize)*(cint(List_AbsPage)-1)) &" "&IndxColumnName&" From "&TableName&" Order By "& List_OrderBy &" "& List_OrderSeq
			else
				ProductListSQL1 = "Select "&IndxColumnName&" From "&TableName&" Where "&IndxColumnName&" is null"
			end if
			ProductListSQL = "Select Top " & List_PSize &" "&IndxColumnName&" From "&TableName&" Where "&IndxColumnName&" not in ("& ProductListSQL1 &") Order By "& List_OrderBy &" "& List_OrderSeq
			ProductListSQL = "Select * From "&TableName&" Where "&IndxColumnName&" in("& ProductListSQL &") Order By "& List_OrderBy &" "& List_OrderSeq
			'Response.Write "ProductListSQL="&ProductListSQL&"<BR>"
			'Response.end
			ProductListRS.open ProductListSQL,conn,1,3
			Set GetList = ProductListRS
			List_PageCount = GetPageCount(TableName,IndxColumnName,"")
			List_AtlCount = GetCount(TableName,IndxColumnName,"")			
			Exit Function
		End Function
		'---------------------------Get Properties-----------------------------------------
		Public Property Get ListAtlCount()
			'List_AtlCount = GetProduct_AtlCount()
			ListAtlCount = List_AtlCount
		End Property
		Public Property Get ListAbsPage()
			ListAbsPage = List_AbsPage
		End Property
		Public Property Get ListPageCount()
			'List_PageCount = GetProduct_PageCount()
			'If List_PageCount <= 0 then List_PageCount = 1
			ListPageCount = List_PageCount
		End Property
		Public Property Get ListPSize()
			ListPSize = List_PSize
		End Property
		Public Property Get ListOrderBy()
			ListOrderBy = List_OrderBy
		End Property
		Public Property Get ListOrderSeq()
			ListOrderSeq = List_OrderSeq
		End Property
		Public Property Let ListOrderSeq(value)
			if isNull(value) = False and value <> "" then
				List_OrderSeq = value
			else
				List_OrderSeq = "DESC"
			end if
		End Property
		Public Property Let ListOrderBy(value)
			if isNull(value) = False and value <> "" then
				List_OrderBy = value
			else
				List_OrderBy = "CreateDate"
			end if
		End Property
		Public Property Let ListPSize(value)
			if isNull(value) = False and value <> "" then
				List_PSize = CInt(value)
			else
				List_PSize = value
			end if
		End Property
		Public Property Let ListAbsPage(value)
			if isNull(value) = False and value <> "" then
				List_AbsPage = CInt(value)
			else
				List_AbsPage = 1
			end if
		End Property
	'-----------------------Private Functions & Subs------------------------------------
	Private Function GetCount(TableName,IndxColumnName,SearchText)
		Dim GTCountSQL,TCount,GTCountRS
		Set GTCountRS = Server.CreateObject("ADODB.Recordset")
		if SearchText = "" then
			GTCountSQL = "Select "&IndxColumnName&" from "&TableName 
		else
			GTCountSQL = "Select "&IndxColumnName&" from "&TableName &" "& SearchText 
		end if
		GTCountRS.open GTCountSQL,conn,1,3
		if not GTCountRS.eof then
			TCount  = GTCountRS.Recordcount
		else
			TCount = 0
		end if
		Set GTCountRS = nothing
		GetCount = TCount
		Exit Function
	End Function
	Private Function GetPageCount(TableName,IndxColumnName,SearchText)
		Dim PageCountSQL,TPageCount,PageCountRS,TCount
		Set PageCountRS = Server.CreateObject("ADODB.Recordset")
		if SearchText = "" then
			PageCountSQL = "Select "&IndxColumnName&" from "&TableName
		else
			PageCountSQL = "Select "&IndxColumnName&" from "&TableName&" "& SearchText 
		end if
		PageCountRS.open PageCountSQL,conn,1,3
		if not PageCountRS.eof or PageCountRS.Recordcount <> null  then
			TCount = PageCountRS.Recordcount
			TPageCount =  TCount/List_PSize
			'response.write "TPageCount="& TPageCount &"<BR>"
			if (TPageCount - Round(cint(TCount)/List_PSize,0)) > 0  then
				TPageCount  = Cint(TPageCount)+1
			else 
				TPageCount = Round(TPageCount,0)
			end if
		else
			TPageCount = 1
		end if
		Set PageCountRS = nothing
		GetPageCount = TPageCount
	End Function
End Class

%>