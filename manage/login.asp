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
<title>��ݺ޲z�t��</title>
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
	rt = isEmpty(form.id,'�п�J�b��');
	if(rt==false)return rt;
	rt = isEmpty(form.password,'�п�J�K�X');
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
    <td align="center"><p><span class="copyfont">�z�n!!�w����{ �x�_�������� ������ݺ޲z�t��<br>
      �бz����J�z�޲z���b���M�K�X�A����!! </span></p>
      <form name="form1" method="post" action="login.asp">
        <table border="0" cellspacing="1" bgcolor="#999999" width="300" cellpadding="4">
          <tr>
            <td width="35%" align="right" bgcolor="#CCCCCC"><font size="2">�b��</font></td>
            <td width="65%" bgcolor="#EEEEEE" ><input name="id" type="text" value="" maxlength="20" onKeyPress="javascript:if(event.keyCode==13){datapost(this);};"></td>
          </tr>
          <tr>
            <td bgcolor="#CCCCCC" align="right"><font size="2">�K�X</font></td>
            <td bgcolor="#EEEEEE" ><input name="password" type="password" value="" maxlength="20" onKeyPress="javascript:if(event.keyCode==13){datapost(this);};"></td>
          </tr>
        </table>
        <p><input name="Submit" type="button" onClick="datapost(this);" value="Login"><input type="hidden" name="LoginConfirm"></p>
    </form></td>
  </tr>
</table>
</body>
</html>
