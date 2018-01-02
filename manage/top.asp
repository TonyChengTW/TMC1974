<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>無標題文件</title>
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
<link href="/elee.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.copyfont {font-size: 10pt; line-height: 20px}
-->
</style>
<script type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
//-->
</script>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#B3B3B3"><table width="100%" height="70" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="3%" rowspan="3">&nbsp;</td>
        <td width="79%" rowspan="3">後端管理系統&nbsp;</td>
        <td width="18%"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('global','','../images/globalon.gif',1)"></a> <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('sitemap','','../images/sitemapon.gif',1)"></a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#E6E6E6">
   <%if HasPermission2("news")  then%>
	<a href="/manage/news/admin.asp" class="menu2">最新消息管理</a>│<a href="/login/login.aspx" class="menu2">留言版管理</a>│<a href="/manage/SetPeriod.aspx" class="menu2">留言版期數設定</a>
	<%
	end if
   '  if HasPermission2("products")  then
	%>
	<!--<a href="/manage/member/admin.asp" class="menu2">會員管理</a>│
	<a href="/manage/product/admin.asp" class="menu2">產品上稿管理</a>│
	<%
	'end if
   '  if HasPermission2("services")  then
	%>
	<a href="/manage/service/admin.asp" class="menu2">線上客服務</a>│
	<%
	'end if
   '  if HasPermission2("store")  then
	%>
	<a href="/manage/store/admin.asp" class="menu2">營銷據點管理</a>│
	<%
	'end if
	%>                                                         -->
	<a href="/manage/logout.asp" class="menu2">登出</a>	</td>
  </tr>
</table>
</body>
</html>
