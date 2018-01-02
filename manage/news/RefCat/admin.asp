<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("news")
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
<link href="../../elee.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.copyfont {font-size: 10pt; line-height: 20px}
.style1 {line-height: 20px}
-->
</style>
<script src="/JSFiles/datapost.js"></script>
<link href="../../elee.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {font-family: Arial, Helvetica, sans-serif; background-color: #DEDFDE;}
-->
</style>
<script>
<!--	
function datapost(RefTitle,action,psn){
	switch(action){
		case 'add':
			document.form1.RefTitle.value = RefTitle;
			document.form1.ParentSN.value = psn;
			document.form1.action = 'add.asp';
			document.form1.submit();
			break;
		case 'modify':
		    rt = confirm('您確定要刪除嗎？');
			if(rt==false){return false;}
			else{
				document.form1.SN.value = psn;
				document.form1.action = 'modifystatus_proc.asp';
				document.form1.submit();
			break;
		 	}
	}
}
-->
</script>
<script src="/JSFiles/mng_pagelist.js"></script>
</head>
<body>
<!-- #include virtual="/manage/top.asp" -->
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center">
	<table width="950" border="0">
      <tr>
        <td>
		<table width="100%" border="0">
            <tr>
              <td><p><a href="/manage/index.asp"><font size="2">管理系統</font></a> <font size="2">&gt; 
                <a href="../admin.asp">最新消息管理</a> &gt; <font color="#FF0000">最新消息類別管理</font></font></p></td>
              <td align="right">Date：<font face="Arial, Helvetica, sans-serif" size="2" color="#0066CC"><b><%=GetToday()%></b></font></td>
              </tr>
        </table>
		</td>
      </tr>
      <form name="form1" method="post" action="">
	  <tr align="center">
        <td class="copyfont">
            <table width="100%" border="1" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#666666" cellpadding="4">
			<tr><td height="25" colspan="3" align="center" class="TableColName"><B>最 新 消 息 類 別 列 表</B></td>
			  <td align="center" class="TableColName"><input name="btnAdd3" type="button" class="Button-Type01" id="btnAdd3" value="新增" onClick="datapost('new','add',0);">
		      <input name="btnOdr3" type="button" class="Button-Type01" id="btnOdr3" value="排序" onClick="document.open('AdjustOrderSeq.asp?ParentSN=0&RefTitle=new','Reorder','width=350,height=280,menubar=no,scrollbars=yes,resizable=yes')"></td>
			</tr>
			<%
			Dim RS,RS2
			Set RS = GetDataByWhereString("category","*","where psn=0 AND ctype='new' and status=1 order by osn")
			while not RS.eof 
			%>
            <tr class="TableColName">
            <td align="center" valign="middle"><a href="#" onClick="javacript:document.location.href='detial.asp?sn=<%=RS("sn")%>';" onMouseOut="wOBJ.hide();" onMouseOver="pop(60,22,'<b>detial</b>');return false;"><%=RS("cname")%></a>&nbsp;<%if RS("status") = 0 then Response.write "(不顯示)"%></td>
           	<td colspan="3" align="right"><input name="btnDel3" type="button" class="Button-Type01" id="btnDel3" value="刪除" onClick="datapost('new','modify',<%=RS("sn")%>);">
           	  <input name="btnOdr32" type="button" class="Button-Type01" id="btnOdr32" value="排序" onClick="document.open('AdjustOrderSeq_new.asp?ParentSN=<%=RS("sn")%>&RefTitle=new','Reorder','width=650,height=400,menubar=no,scrollbars=yes,resizable=yes')"></td>
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
    </table><p>&nbsp;</p></td>
  </tr>
<!--#include virtual="/manage/footer.asp" -->
</table>
</body>
</html>