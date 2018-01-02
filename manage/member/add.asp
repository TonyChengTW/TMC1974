<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%HasPermission("admin")%>
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
<script language="JavaScript" src="/JSfiles/address.js"></script>
<script language="JavaScript" src="/JSFiles/datapost.js"></script>
<script language="JavaScript" src="/JSFiles/showimage.js"></script>
<script language="JavaScript" >
<!--
function datapost(){
   rt=isEmpty(document.form1.uid,'請輸入帳號！');
      if(rt==false) return rt;

   if(document.form1.email.value==''){
      rt=isEmail(document.form1.email,'抱歉您輸入的E-mail格式不正確歐！');
   	if(rt==false) return rt;
   }

   rt=isEmpty(document.form1.pwd,'請輸入密碼！');
      if(rt==false) return rt;
   rt=isEnglish(document.form1.pwd,'密碼請輸入小寫英文字母、數字!');
      if(rt==false) return rt;
      
//   if(document.form1.pwd.value==document.form1.email.value)
//{
//   	alert('帳號密碼請不要相同!!');
//	document.form1.pwd.focus();
//   	return false;
//   }

   rt=isEmpty(document.form1.cpwd,'請再次輸入密碼！');
      if(rt==false) return rt;
   if(document.form1.cpwd.value!=document.form1.pwd.value){
   	alert('請確認密碼是否正確!!');
	document.form1.cpwd.focus();
   	return false;
   }    
   rt=isEmpty(document.form1.username,'請輸入姓名！');
   if(rt==false) return rt;
   document.form1.submit();
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
              <td width="56%"><p><font size="2"><a href="/manage/index.asp">管理系統</a> &gt; <font color="#FF0000"></font> <font size="2"><a href="admin.asp">會員管理列表</a> &gt; <font color="#FF0000"></font> <font color="#FF0000"></font></font><font color="#FF0000">新增頁面</font></font></p></td>
              <td width="26%" align="right" class="TableColValue">Date：</td>
              <td width="18%"><span class="Desc-Type01"><%=GetToday()%></span> </td>
            </tr>
        </table></td>
      </tr>
      <tr align="center">
        <td class="copyfont"><form action="add_proc.asp" method="post" name="form1">
            <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolordark="#FFFFFF" bordercolorlight="#666666">
              <tr>
                <td colspan="2" height="25" align="center" bgcolor="#999999"><p><font color="#FFFFFF"><b>新增頁面</b></font></p></td>
              </tr>
              <tr>
                <td align="right" class="copyfont"><span class="bred13">*</span>帳號</td>
                <td class="copyfont"><input name="uid" type="text" class="TextBox-Type01" id="uid" value="" size="20" maxlength="20">
                  <span class="gray11"></span></td>
              </tr>
              <tr>
                <td width="18%" align="right" class="copyfont"><span class="bred13">*</span>密碼</td>
                <td width="82%" class="copyfont"><input name="pwd" type="text" class="TextBox-Type01" id="pwd" value="" size="20" maxlength="20">
                  <span class="gray11">(請輸入10個字元以內英數)</span></td>
              </tr>
              <tr>
                <td align="right" class="copyfont"><span class="bred13">*</span>確認密碼</td>
                <td class="copyfont"><input name="cpwd" type="text" class="TextBox-Type01" id="cpwd" value="" size="20" maxlength="20"></td>
              </tr>
              <tr>
                <td align="right" class="copyfont">Email</td>
                <td class="copyfont"><input name="email" type="text" class="TextBox-Type01" id="email" value="" size="20" maxlength="20">
                  <span class="gray11"></span></td>
              </tr>
              <tr>
                <td align="right" class="copyfont"><span class="bred13">*</span>姓名</td>
                <td class="copyfont"><input name="username" type="text" class="TextBox-Type01" id="username" value="" size="20" maxlength="20" ></td>
              </tr>
            </table>
          <br>
            <input name="Button2" type="button" class="Button-Type01" value="新增" onClick="datapost();">
            <input name="Submit22" type="reset" class="Button-Type01" value="重填">
        </form></td>
      </tr>
    </table>
    <p>&nbsp;</p></td>
  </tr>
<!--#include virtual="/manage/footer.asp" -->
</table>
</body>
</html>
