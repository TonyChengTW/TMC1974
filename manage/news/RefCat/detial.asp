<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("news")
Dim sn,RS,img
Set img = new ImageControl
sn=filter_data_normal(Request("sn"))
if sn ="" then PopMessage "Back","無此資料!!",""
Set RS = GetDataByWhereString("category","*","where sn="&sn) 
if RS.eof then PopMessage "Back","無此資料!!",""
Dim titleimg,cimg
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
<script src="/Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script language="JavaScript" src="/JSFiles/datapost.js"></script>
<script language="JavaScript" src="/JSFiles/showimage.js"></script>
<script language="JavaScript" >
<!--
	function datapost(){
		var rt;
		rt = isEmpty(document.form1.cname,'請輸入名稱!!');
		if(rt==false)return rt;
		/*
		if(document.form1.cimg.value=='' && document.form1.oldcimg.value==''){
			alert('請選擇類別圖檔!!');		
			return false;
		}
		if(document.form1.cimg.value=='' && document.form1.oldcimg.value!='' && document.form1.delcimg.checked){
			alert('請選擇類別圖檔才能刪除原有檔案!!');		
			return false;
		}
		if(document.form1.titleimg.value=='' && document.form1.oldtitleimg.value==''){
			alert('請選擇類別title圖檔!!');		
			return false;
		}
		if(document.form1.titleimg.value=='' && document.form1.oldtitleimg.value!='' && document.form1.deltitleimg.checked){
			alert('請選擇類別title圖檔才能刪除原有檔案!!');		
			return false;
		}*/
		else{
			document.form1.submit();
		}
	}
	function upstatus(){
		rt = confirm('您確定要刪除嗎？');
		if(rt==false){return false;}
		else{
			document.form1.action = 'modifystatus_proc.asp';
			document.form1.encoding = 'application/x-www-form-urlencoded';
			document.form1.submit();
		}
	}
-->
</script>
<style type="text/css">
<!--
.copyfont {font-size: 10pt; line-height: 20px}
.style1 {color: #54B3D3}
-->
</style>
</head>
<body>
<!-- #include virtual="/manage/top.asp" -->
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0">
      <tr>
        <td><table width="100%" border="0">
            <tr>
              <td width="56%"><p><a href="/manage/index.asp"><font size="2">管理系統</font></a>
			  <font size="2">&gt; <a href="../admin.asp">最新消息管理</a> &gt;<a href="admin.asp">最新消息類別管理</a> &gt;
			  <font color="#FF0000">Detial</font></font></td>
              <td width="26%" align="right" class="TableColValue">Date：</td>
              <td width="18%"><span class="Desc-Type01"><%=GetToday()%></span> </td>
            </tr>
        </table></td>
      </tr>
      <tr align="center">
        <td class="copyfont"><form action="modify_proc.asp" method="post" enctype="multipart/form-data" name="form1">
            <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolordark="#FFFFFF" bordercolorlight="#666666">
              <tr>
                <td colspan="2" height="25" align="center" bgcolor="#999999"><p><font color="#FFFFFF"><b>Detial</b></font></p></td>
              </tr>
              <tr>
                <td align="right" class="TableColName"><font class="Comment12font">*</font>類別名稱</td>
                <td class="TableColValue"><input name="cname" type="text" id="cname" value="<%=RS("cname")%>" size="50" maxlength="25">
                  <span class="Comment12font">(最多20字)</span></td>
              </tr>
				<!--<tr>
								<td width="14%" align="right" class="TableColName"><span class="TableColValue">類別title圖檔</span></td>
								<td width="86%" class="TableColValue"><input name="titleimg" type="file" id="titleimg">
								<%
								 titleimg=RS("titleimg")
								 if titleimg <> null or titleimg <> "" then
								%>
								<input name="deltitleimg" type="checkbox" id="titleimg" value="yes">
								刪除 
								<%
										img.Name = titleimg
										img.FillOrigin2
								end if
								%><input name="oldtitleimg" type="hidden" value="<%=RS("titleimg")%>">
								</td>
							  </tr>	-->		  
            </table>
          <br>
            <input name="Button2" type="button" class="Button-Type01" value="修改" onClick="datapost();">
            <input name="btnDel3" type="button" class="Button-Type01" id="btnDel3" value="刪除" onClick="upstatus();">
			<input name="sn" type="hidden" value="<%=RS("sn")%>">
        </form></td>
      </tr>
    </table>
    <p>&nbsp;</p></td>
  </tr>
<!--#include virtual="/manage/footer.asp" -->
</table>
</body>
</html>
<%
Set img = nothing
Set RS = nothing
%>