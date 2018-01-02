<%Option Explicit%>
<!-- #include virtual="/include/manage.asp"-->
<%
'-----------------------------------------Command & RecordSet--------------------------------------
Dim RS,Refcls,wcRefCat
	Set Refcls = new RefCat_Class
	Set wcRefCat = new SelectControl
Dim RefCat,counter,flag,NextCatSN,LastLevel				'to Loop RefCat
	If Len(Request("RefCat")) = 0 then
		RefCat = split("0",",")
	Else
		RefCat = split(Request("RefCat"),",")
	End If
	counter = 0
	NextCatSN = 0
	flag = true
	LastLevel = Request("LastLevel")
'-------------------------RefCat_Picker-------------------------------------------------------------
Dim RefTitle,txtTarget,valTarget
RefTitle = Request("RefTitle") : txtTarget = Request("txtTarget") : valTarget = Request("valTarget")
if RefTitle = "" or isNull(RefTitle) then Call PopMessage("Close","請指定類別種類","")
if RefTitle = "" or isNull(txtTarget) then Call PopMessage("Close","請指定類別:txtTarget","")
if RefTitle = "" or isNull(RefTitle) then Call PopMessage("Close","請指定類別:valTarget","")
%>
<html>
<head>
<title>TOTO管理後端</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style type="text/css">
<!--
.copyfont {  font-size: 10pt; line-height: 20px}
a:link {  color: #3366CC; text-decoration: none}
a:hover {  color: #CC0033; text-decoration: underline}
a:visited {  text-decoration: none}
-->
</style>
<link href="/manage/manage.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {font-family: Arial, Helvetica, sans-serif; background-color: #DEDFDE;}
-->
</style>
<script>
<!--
	function RefCat_Pick(){
		var txtTarget = opener.document.getElementById('<%=txtTarget%>');
		var valTarget = opener.document.getElementById('<%=valTarget%>');
		var RefCats = document.getElementsByName('RefCat');
		var RefCat = RefCats[RefCats.length-1];
		//txtTarget.innerText = RefCat.options[RefCat.options.selectedIndex].text;
		txtTarget.innerText = Get_FullRefText()
		valTarget.value = RefCat.options[RefCat.options.selectedIndex].value;
		self.close();
	}
	function Get_FullRefText(){
		var RefCat = document.getElementsByName('RefCat');
		var strRefCat='';
		for(var i=0;i<RefCat.length;i++){
			if(i==0) strRefCat = RefCat[i].options[RefCat[i].options.selectedIndex].text;
			else strRefCat+='/'+RefCat[i].options[RefCat[i].options.selectedIndex].text;
		}
		return strRefCat;
	}
-->
</script>
</head>

<body onBlur="document.focus();" bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" text="#666666" vlink="#3366CC">
<div align="center">
  <table width="90%" border="0">
    <tr align="center"> 
      <td class="copyfont"> 
        <form name="form1" method="post" action="RefCat_Picker.asp">
        	<table width="100%" border="1" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#666666" cellpadding="4">
            	<tr>
            		<td height="25" align="center" class="TableHeader">類　別　選　擇</td>
       		  </tr>
				<%
					 If UBound(RefCat) >= 0 then
						For counter  = 0 to UBound(RefCat) Step 1
						Refcls.RefTitle = RefTitle
							if counter > 0 then Refcls.ParentSN = trim(RefCat(counter-1))							
							Set RS = Refcls.GetRefCat_NLevelCategory()
							if not RS.eof then
				%>
            	<tr class="TableColName">
            		<td>
						<%							
								Set wcRefCat.RS = RS
								NextCatSN = RS("SN")
								wcRefCat.SelectName = "RefCat"
								wcRefCat.SelectedItem = trim(RefCat(counter))
								wcRefCat.SelTextField = "RefName"
								wcRefCat.AttachEvent = "OnChange=""document.all['LastLevel'].value=this.options[this.options.selectedIndex].value;this.form.submit();"""
								wcRefCat.SelValueField = "SN"
								wcRefCat.Style = "Select-Type01"
								wcRefCat.Fill							
						%>
						&nbsp;
				  </td>
       		    </tr> 
			  <% 
			  	end if			  	
			  		if trim(LastLevel) = trim(RefCat(counter)) then
						NextCatSN = LastLevel					
						Exit For
					end if
			  		Next
				end if          	
			  	While flag = true
			  	'Find Sub Category
					Refcls.RefTitle = RefTitle
					Refcls.ParentSN = NextCatSN
					Set RS = Refcls.GetRefCat_NLevelCategory()
					if not RS.eof then
			  %>
			  		<tr class="TableColName">
            				<td>
								<%		
										NextCatSN = RS("SN")						
										Set wcRefCat.RS = RS
										wcRefCat.SelectName = "RefCat"
										'wcRefCat.SelectedItem = LastLevel
										wcRefCat.SelTextField = "RefName"
										wcRefCat.AttachEvent = "OnChange=""document.all['LastLevel'].value=this.options[this.options.selectedIndex].value;this.form.submit();"""
										wcRefCat.SelValueField = "SN"
										wcRefCat.Style = "Select-Type01"
										wcRefCat.Fill
										'RS.close														
								%>
								&nbsp;
					  </td>
			  </tr>
					<%  
						else
							flag = false
						end if
					%>			
				<% Wend %>
				<tr class="TableColName">
            	  <td>
				  <input name="btnAdd" type="button" class="Button-Type01" id="btnAdd" value="選取" onClick="RefCat_Pick();">
				  </td>
           	    </tr>           	
				<input type="hidden" name="RefTitle" value="<%=RefTitle%>">
				<input type="hidden" name="txtTarget" value="<%=txtTarget%>">
				<input type="hidden" name="valTarget" value="<%=valTarget%>">
				<input type="hidden" name="RefName" value="">
				<input type="hidden" name="LastLevel" value="">
       	  </table>
       	</form>        </td>
    </tr>
  </table>
  <div align="center">
    <p>&nbsp;</p>
  </div>
  <p></p>
</div>
</body>
</html>
<%
	Set Refcls = nothing
	Set wcRefCat = nothing
%>