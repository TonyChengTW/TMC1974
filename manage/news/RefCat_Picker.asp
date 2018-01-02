<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission3("news")
Dim ctype,txtTarget,valTarget,cname
txtTarget = filter_data_normal(Request("txtTarget"))
valTarget = filter_data_normal(Request("valTarget"))
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>管理後端</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="../../toto.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.copyfont {font-size: 10pt; line-height: 20px}
.style1 {line-height: 20px}
-->
</style>
<script src="/JSFiles/datapost.js"></script>
<link href="../../toto.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {font-family: Arial, Helvetica, sans-serif; background-color: #DEDFDE;}
-->
</style>
<script>
<!--	
function getcategory(indx,txt,ptxt){
	var txtTarget = opener.document.getElementById('<%=txtTarget%>');
	var valTarget = opener.document.getElementById('<%=valTarget%>');
	
	if(ptxt=='')
		txtTarget.innerText = txt;
	else 
		txtTarget.innerText = ptxt+' / '+txt;
		
	valTarget.value = indx;
	window.close();
}
function RefCat_Pick(){
	var txtTarget = opener.document.getElementById('<%=txtTarget%>');
	var valTarget = opener.document.getElementById('<%=valTarget%>');
	var RefCats = document.getElementsByName('RefCat');
	var RefCat = RefCats[RefCats.length-1];
	//txtTarget.innerText = RefCat.options[RefCat.options.selectedIndex].text;
	txtTarget.innerText = document.form1.cn1.value+'/'+document.form1.cn2.value;
	valTarget.value = RefCat.options[RefCat.options.selectedIndex].value.replace(' ','');
	//window.close();
}
-->
</script>
<script src="/JSFiles/mng_pagelist.js"></script>
</head>
<body>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center">
	<table border="0">
      <form name="form1" method="post" action="">
	  <tr align="center">
        <td class="copyfont">
            <table width="100%" border="1" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#666666" cellpadding="2">
              <tr>
                <td colspan="2" align="center" bgcolor="#EEEEEE" class="TableColName">類　別　選　擇</td>
              </tr>
			<%
			Dim RS,RS2
			Set RS = GetDataByWhereString("category","*","where psn=0 and ctype='new' and status = 1 order by osn")
			while not RS.eof 
			%>
            <tr class="TableColName">
            <td align="center" valign="middle">
			<a href="#" onClick="getcategory('<%=RS("sn")%>','<%=RS("cname")%>','');" onMouseOut="wOBJ.hide();" onMouseOver="pop(60,22,'<b>選取</b>');return false;">
			<%=RS("cname")%></a>&nbsp;</td>
            </tr>
				<%
				RS.movenext
			 wend 	
			 Set RS=nothing	  	
			%>
			<input type="hidden" name="RefTitle" value="">
			<input type="hidden" name="ParentSN" value="">
			<input type="hidden" name="SN" value="">
            </table>
			</td>
      </tr>
	 </form>
    </table>
	<p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>