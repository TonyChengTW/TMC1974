<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("news")
Dim RefTitle,ParentSN
RefTitle = filter_data_normal(Request.form("RefTitle"))
ParentSN = filter_data_normal(Request.form("ParentSN"))
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
<script language="JavaScript" src="/JSFiles/datapost.js"></script>
<script language="JavaScript" src="/JSFiles/showimage.js"></script>
<script language="JavaScript" >
<!--
	function datapost(form){
		var rt;
		rt = isEmpty(form.cname,'請輸入名稱!!');
		if(rt==false)return rt;
		/*rt = isEmpty(form.cimg,'請選擇類別圖檔!!');
		if(rt==false)return rt;
		rt = isEmpty(form.titleimg,'請選擇類別title圖檔!!');
		if(rt==false)return rt;		*/
		form.submit();
	}
-->
</script>
<style type="text/css">
<!--
.copyfont {font-size: 10pt; line-height: 20px}
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
			  <font color="#FF0000">新增類別</font></font></td>
              <td width="26%" align="right" class="TableColValue">Date：</td>
              <td width="18%"><span class="Desc-Type01"><%=GetToday()%></span> </td>
            </tr>
        </table></td>
      </tr>
      <tr align="center">
        <td class="copyfont"><form action="add_proc.asp" method="post" enctype="multipart/form-data" name="form1">
            <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolordark="#FFFFFF" bordercolorlight="#666666">
              <tr>
                <td colspan="2" height="25" align="center" bgcolor="#999999"><p><font color="#FFFFFF"><b>新 增 類 別</b></font></p></td>
              </tr>
              <tr>
                <td align="right" class="TableColName"><font class="Comment12font">*</font>類別名稱</td>
                <td class="TableColValue"><input name="cname" type="text" id="cname" value="" size="50" maxlength="25">
                  <span class="Comment12font">(最多20字)</span></td>
              </tr>
              <!--<tr>
                <td width="14%" align="right" class="TableColName"><span class="TableColValue">類別圖檔</span></td>
                <td width="86%" class="TableColValue"><input name="cimg" type="file" id="cimg"></td>
              </tr>
              <tr>
                <td align="right" class="TableColName">類別title圖檔</td>
                <td class="TableColValue"><input name="titleimg" type="file" id="iconon"></td>
              </tr>-->
            </table>
          <br>
            <input name="Button2" type="button" class="Button-Type01" value="新增" onClick="datapost(this.form);">
            <input name="Submit22" type="reset" class="Button-Type01" value="重填">
			<input type="hidden" name="RefTitle" value="<%=RefTitle%>">
			<input type="hidden" name="ParentSN" value="<%=ParentSN%>">
        </form></td>
      </tr>
    </table>
    <p>&nbsp;</p></td>
  </tr>
<!--#include virtual="/manage/footer.asp" -->
</table>
</body>
</html>
