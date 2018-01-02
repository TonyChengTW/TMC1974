<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
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
<link href="../elee.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.copyfont {font-size: 10pt; line-height: 20px}
.style1 {line-height: 20px}
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
    <td align="center"><p>&nbsp;</p>
      <p>&nbsp;</p>
      <p><span class="copyfont"><font color="#FF0000" size="3"><strong><%=Session("user_name")%> 您好!!歡迎光臨 </strong></font></span><span class="style1"><font color="#FF0000" size="3"><strong>台北市健言社</strong><span class="copyfont"><font color="#FF0000" size="3"><strong> 後端管理系統<br>
        請您選擇您要管理的項目</strong></font></span> <br>
        <br>
		<!--今日首頁瀏覽人次：<font color="#0000CC"><b><font color="#CC0000"><%'=GetCounter("index_today.cnt")%></font></b></font>人次<br>
      累計首頁瀏覽人次：<font color="#0000CC"><b><font color="#CC0000"><%'=GetCounter("index.cnt")%></font></b></font>人次    </p>
      --><p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td align="right">台北市健言社 Copyright 2012 All Rights Reserved. </td>
  </tr>
</table>
</body>
</html>
