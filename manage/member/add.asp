<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%HasPermission("admin")%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�޲z���</title>
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
   rt=isEmpty(document.form1.uid,'�п�J�b���I');
      if(rt==false) return rt;

   if(document.form1.email.value==''){
      rt=isEmail(document.form1.email,'��p�z��J��E-mail�榡�����T�ڡI');
   	if(rt==false) return rt;
   }

   rt=isEmpty(document.form1.pwd,'�п�J�K�X�I');
      if(rt==false) return rt;
   rt=isEnglish(document.form1.pwd,'�K�X�п�J�p�g�^��r���B�Ʀr!');
      if(rt==false) return rt;
      
//   if(document.form1.pwd.value==document.form1.email.value)
//{
//   	alert('�b���K�X�Ф��n�ۦP!!');
//	document.form1.pwd.focus();
//   	return false;
//   }

   rt=isEmpty(document.form1.cpwd,'�ЦA����J�K�X�I');
      if(rt==false) return rt;
   if(document.form1.cpwd.value!=document.form1.pwd.value){
   	alert('�нT�{�K�X�O�_���T!!');
	document.form1.cpwd.focus();
   	return false;
   }    
   rt=isEmpty(document.form1.username,'�п�J�m�W�I');
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
              <td width="56%"><p><font size="2"><a href="/manage/index.asp">�޲z�t��</a> &gt; <font color="#FF0000"></font> <font size="2"><a href="admin.asp">�|���޲z�C��</a> &gt; <font color="#FF0000"></font> <font color="#FF0000"></font></font><font color="#FF0000">�s�W����</font></font></p></td>
              <td width="26%" align="right" class="TableColValue">Date�G</td>
              <td width="18%"><span class="Desc-Type01"><%=GetToday()%></span> </td>
            </tr>
        </table></td>
      </tr>
      <tr align="center">
        <td class="copyfont"><form action="add_proc.asp" method="post" name="form1">
            <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolordark="#FFFFFF" bordercolorlight="#666666">
              <tr>
                <td colspan="2" height="25" align="center" bgcolor="#999999"><p><font color="#FFFFFF"><b>�s�W����</b></font></p></td>
              </tr>
              <tr>
                <td align="right" class="copyfont"><span class="bred13">*</span>�b��</td>
                <td class="copyfont"><input name="uid" type="text" class="TextBox-Type01" id="uid" value="" size="20" maxlength="20">
                  <span class="gray11"></span></td>
              </tr>
              <tr>
                <td width="18%" align="right" class="copyfont"><span class="bred13">*</span>�K�X</td>
                <td width="82%" class="copyfont"><input name="pwd" type="text" class="TextBox-Type01" id="pwd" value="" size="20" maxlength="20">
                  <span class="gray11">(�п�J10�Ӧr���H���^��)</span></td>
              </tr>
              <tr>
                <td align="right" class="copyfont"><span class="bred13">*</span>�T�{�K�X</td>
                <td class="copyfont"><input name="cpwd" type="text" class="TextBox-Type01" id="cpwd" value="" size="20" maxlength="20"></td>
              </tr>
              <tr>
                <td align="right" class="copyfont">Email</td>
                <td class="copyfont"><input name="email" type="text" class="TextBox-Type01" id="email" value="" size="20" maxlength="20">
                  <span class="gray11"></span></td>
              </tr>
              <tr>
                <td align="right" class="copyfont"><span class="bred13">*</span>�m�W</td>
                <td class="copyfont"><input name="username" type="text" class="TextBox-Type01" id="username" value="" size="20" maxlength="20" ></td>
              </tr>
            </table>
          <br>
            <input name="Button2" type="button" class="Button-Type01" value="�s�W" onClick="datapost();">
            <input name="Submit22" type="reset" class="Button-Type01" value="����">
        </form></td>
      </tr>
    </table>
    <p>&nbsp;</p></td>
  </tr>
<!--#include virtual="/manage/footer.asp" -->
</table>
</body>
</html>
