<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<%
	Dim LoginConfirm,UID,PWD,LoginType,CAuthor
	LoginConfirm = filter_data_normal(Request("LoginConfirm"))
	UID = Ucase(filter_data_normal(Request("id")))
	PWD = Ucase(filter_data_normal(Request("password")))
	if LoginConfirm = "yes" then
		Call Admin_Validate_Login(UID,PWD)		
	end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>後端管理系統</title>
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
<link href="../toto.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.copyfont {font-size: 10pt; line-height: 20px}
-->
</style>
<script src="/JSFiles/datapost.js"></script>
<script>
<!--
function datapost(obj){
	var rt;
	var form = obj.form;
	rt = isEmpty(form.id,'請輸入帳號');
	if(rt==false)return rt;
	rt = isEmpty(form.password,'請輸入密碼');
	if(rt==false)return rt;
	form.LoginConfirm.value='yes';
	form.submit();	
}
-->
</script>
</head>
<body>

<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><p><span class="copyfont">您好!!歡迎光臨 台北市健言社 網站後端管理系統<br>
      請您先輸入您管理的帳號和密碼，謝謝!! </span></p>
      <form name="form1" method="post" action="login.asp">
        <table border="0" cellspacing="1" bgcolor="#999999" width="300" cellpadding="4">
          <tr>
            <td width="35%" align="right" bgcolor="#CCCCCC"><font size="2">帳號</font></td>
            <td width="65%" bgcolor="#EEEEEE" ><input name="id" type="text" value="" maxlength="20" onKeyPress="javascript:if(event.keyCode==13){datapost(this);};"></td>
          </tr>
          <tr>
            <td bgcolor="#CCCCCC" align="right"><font size="2">密碼</font></td>
            <td bgcolor="#EEEEEE" ><input name="password" type="password" value="" maxlength="20" onKeyPress="javascript:if(event.keyCode==13){datapost(this);};"></td>
          </tr>
        </table>
        <p><input name="Submit" type="button" onClick="datapost(this);" value="Login"><input type="hidden" name="LoginConfirm"></p>
    </form></td>
  </tr>
</table>
</body>
</html>
