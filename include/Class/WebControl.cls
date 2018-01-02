<%	
	Class SelectControl

	'-----------------------Data Member------------------------------
		Private pSelectedIndex
		Private pSelectedItem
		Private pSelectedItem2
		Private pSelTextField
		Private pSelValueField
		Private pRS
		Private pAttachEvent
		Private pSelectName
		Private pSelectSize
		Private pisMultiple
		Private pStyle
		Private Sub Class_Initialize		' Setup Initialize event.
			pSelectedIndex = 0
			pSelectedItem = Array("")
		    pSelectedItem2 = ""
			pSelTextField = ""
			pSelValueField = ""
			pAttachEvent = ""
			pSelectName = "Select1"
			pisMultiple = false
			pSelectSize = 1
			pStyle = ""
		End Sub
		Private Sub Class_Terminate   ' Setup Terminate event.
			
		End Sub
	'-----------------------Properties-----------------------------------
		Public Property Let SelectedIndex(value)
			pSelectedIndex = value
		End Property
		Public Property Let SelectedItem(value)
			pSelectedItem = split(value,",")
		End Property
		Public Property Let SelectedItem2(value)
			pSelectedItem2 = value
		End Property
		Public Property Let SelTextField(value)
			pSelTextField = value
		End Property
		Public Property Let SelValueField(value)
			pSelValueField = value
		End Property
		Public Property Let SelectName(value)
			pSelectName = value
		End Property
		Public Property Let AttachEvent(value)
			pAttachEvent = value
		End Property
		Public Property Let SelectSize(value)
			if value="" or isNull(value) = true then RaiseError "You must set SelectSize a numeric value"
			if CInt(value) = false then RaiseError "You must set SelectSize a numeric value"
			pSelectSize = value
		End Property
		Public Property Let isMultiple(value)
			pisMultiple = value
		End Property
		Public Property Let Style(value)
			pStyle = value
		End Property
		Public Property Set RS(ref)
			Set pRS = ref
		End Property
	'-----------------------Methods-------------------------------------
		Sub Fill_Order()
			Dim txtSelect,temp,style
			Dim size,multi
			if not pRS.eof then
				'response.write "pRS(pSelTextField)="&pRS(pSelTextField)&"<BR>"
				size = ""
				multi = ""
				style = ""
				size = " size="""& pSelectSize &""""
				if pisMultiple = true then multi = " multiple"
				if pStyle <> "" then style = " class="""& pStyle &""""
				temp = ""
				if pSelTextField = "" then RaiseError("尚未設定SelText Field")
				if pSelValueField = "" then RaiseError("尚未設定SelValue Field")
				txtSelect = "<select name="""& pSelectName &""" "& pAttachEvent & size & multi & style &">"&vbNewLine
				While not pRS.eof
					if isItemInArray(pSelectedItem,pRS(pSelValueField)) = true then temp = " selected"
					if cstr(pSelectedItem2) = cstr(pRS(pSelValueField)) then temp = " selected"
					txtSelect = txtSelect&"<option value="""& pRS(pSelValueField) &""""& temp &">Name:"& pRS(pSelTextField)&"(ID:"&pRS(pSelValueField)&")"&"</option>"&vbNewLine
				pRS.MoveNext
				temp = ""
				Wend
				txtSelect = txtSelect&"</select>"&vbNewLine
				Response.Write txtSelect
				pRS.close : Set pRS = nothing
			end if
		End Sub
		Sub Fill()
			Dim txtSelect,temp,style
			Dim size,multi
			if not pRS.eof then
				'response.write "pRS(pSelTextField)="&pRS(pSelTextField)&"<BR>"
				size = ""
				multi = ""
				style = ""
				size = " size="""& pSelectSize &""""
				if pisMultiple = true then multi = " multiple"
				if pStyle <> "" then style = " class="""& pStyle &""""
				temp = ""
				if pSelTextField = "" then RaiseError("尚未設定SelText Field")
				if pSelValueField = "" then RaiseError("尚未設定SelValue Field")
				txtSelect = "<select name="""& pSelectName &""" "& pAttachEvent & size & multi & style &">"&vbNewLine
				While not pRS.eof
					if isItemInArray(pSelectedItem,pRS(pSelValueField)) = true then temp = " selected"
					if cstr(pSelectedItem2) = cstr(pRS(pSelValueField)) then temp = " selected"
					txtSelect = txtSelect&"<option value="""& pRS(pSelValueField) &""""& temp &">"& pRS(pSelTextField) &"</option>"&vbNewLine
				pRS.MoveNext
				temp = ""
				Wend
				txtSelect = txtSelect&"</select>"&vbNewLine
				Response.Write txtSelect
				pRS.close : Set pRS = nothing
			end if
		End Sub
		Sub Fill2()
			Dim txtSelect,temp,style
			Dim size,multi
			if not pRS.eof then
				'response.write "pRS(pSelTextField)="&pRS(pSelTextField)&"<BR>"
				size = ""
				multi = ""
				style = ""
				size = " size="""& pSelectSize &""""
				if pisMultiple = true then multi = " multiple"
				if pStyle <> "" then style = " class="""& pStyle &""""
				temp = ""
				if pSelTextField = "" then RaiseError("尚未設定SelText Field")
				if pSelValueField = "" then RaiseError("尚未設定SelValue Field")
				txtSelect = "<select name="""& pSelectName &""" "& pAttachEvent & size & multi & style &">"&vbNewLine
				txtSelect = txtSelect&"<option value="""" selected>請選擇</option>"&vbNewLine
				While not pRS.eof
					if isItemInArray(pSelectedItem,pRS(pSelValueField)) = true then temp = " selected"
					if cstr(pSelectedItem2) = cstr(pRS(pSelValueField)) then temp = " selected"
					txtSelect = txtSelect&"<option value="""& pRS(pSelValueField) &""""& temp &">"& pRS(pSelTextField) &"</option>"&vbNewLine
				pRS.MoveNext
				temp = ""
				Wend
				txtSelect = txtSelect&"</select>"&vbNewLine
				Response.Write txtSelect
				pRS.close : Set pRS = nothing
			end if
		End Sub

		Sub FillSeries(ByVal StartNo,ByVal EndNo,ByVal Steps)
			Dim size,multi,style
			size = ""
			multi = ""
			style = ""
			size = " size="""& pSelectSize &""""
			if pStyle <> "" then style = " class="""& pStyle &""""
			if pisMultiple = true then multi = " multiple"
			if isNumeric(StartNo) = false then RaiseError("You Must Set StartNo a numeric value")
			if isNumeric(EndNo) = false then RaiseError("You Must Set EndNo a numeric value---"&EndNo)
			if isNumeric(Steps) = false then RaiseError("You Must Set Steps a numeric value")
			Dim txtSelect,temp,i
			temp = ""
			txtSelect = "<select name="""& pSelectName &""" "& pAttachEvent & size & multi  & style &">"&vbNewLine
			For i = CInt(StartNo) to CInt(EndNo) Step CInt(Steps)
				if isItemInArray(pSelectedItem,i) = true then temp = " selected"
				txtSelect = txtSelect&"<option value="""& i &""""& temp &">"& i &"</option>"&vbNewLine
			temp = ""
			Next
			txtSelect = txtSelect&"</select>"&vbNewLine
			Response.Write txtSelect
		End Sub
	'=========================================
	' Supporting functions
	'=========================================

	Private Sub RaiseError(ByVal Msg)
		Err.Raise vbObjectError + 99999, "WebControl.SelectControl", Msg		
	End Sub

	End Class





	Class ImageControl
		Private imgName
		Private imgWidth
		Private imgHeight
		Private imgAlign
		Private imgBorder
		Private imgStyle
		Private imgclass
		Private strWidth
		Private strHeight
		
		Private Sub Class_Initialize
			imgWidth = 100
			imgHeight = 100
			imgName = null
			imgAlign = ""
			imgBorder = 0
			imgStyle = ""
			imgclass = ""
			strWidth = ""
			strHeight = ""
		End Sub
		Private Sub Class_Terminate

		End Sub
		Public Function GetOriginString()
			if isNull(imgName) = false and imgName <> "" then
				GetOriginString =  "<img src=""/Upload/"&imgName&""" border="""& imgBorder &""" align="""& imgAlign &"""  Style="""& imgStyle &"""  class="""& imgClass &""">"
			end if
		End Function
		Public Function FillOrigin2()
			if isNull(imgName) = false and imgName <> "" then
				Response.Write "<img src=""/Upload/"&imgName&"""  border="""& imgBorder &""" align="""& imgAlign &"""  Style="""& imgStyle &"""  class="""& imgClass &""">"
			end if
		End Function
		Public Function FillOrigin()
			if isNull(imgName) = false and imgName <> "" then
				Response.Write "<img src=""/Upload/"&imgName&"""  width="""& imgWidth &""" height="""& imgHeight &""" border="""& imgBorder &""" align="""& imgAlign &"""  Style="""& imgStyle &"""  class="""& imgClass &""">"
			end if
		End Function
		Public Function Fill()
			if isNull(imgName) = false and imgName <> "" then
				Response.Write "<a href=""#"" onClick=""showImg('/include/imageView.asp?file=/upload/"&imgName&"');return false;"">"
				Response.Write "<img src=""/Upload/"&imgName&""" width="""& imgWidth &""" height="""& imgHeight &""" border="""& imgBorder &""" Style="""& imgStyle &""" alt=""點我看大圖""  class="""& imgClass &""">"
				Response.Write "</a>"
			end if
		End Function
		Public Function Fill_NoView()
			if isNull(imgName) = false and imgName <> "" then
				Response.Write "<img src=""/Upload/"&imgName&""" width="""& imgWidth &""" height="""& imgHeight &""" border="""& imgBorder &""" Style="""& imgStyle &"""  class="""& imgClass &""">"
			end if
		End Function
		Public Property Let Name(value)
			imgName = value
		End Property
		Public Property Let Width(value)
			imgWidth = value
		End Property
		Public Property Let Height(value)
			imgHeight = value
		End Property
		Public Property Let Align(value)
			imgAlign = value
		End Property
		Public Property Let Border(value)
			imgBorder = value
		End Property
		Public Property Let Style(value)
			imgStyle = value
		End Property
		Public Property Let css(value)
			imgclass = value
		End Property
	End Class
	Function isItemInArray(ByRef ary,ByVal item)
		Dim items
		isItemInArray = False
		For each items in ary
			if CStr(trim(items)) = CStr(item) then
				isItemInArray = True
				Exit For
			end if
		Next
		Exit Function
	End Function
%>