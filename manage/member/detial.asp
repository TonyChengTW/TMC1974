<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("admin")
Dim sn,RS
sn=filter_data_normal(Request("sn"))
if sn ="" then PopMessage "Back","�L�����!!",""
Set RS = GetDataByWhereString("users","*","where sn="&sn) 
if RS.eof then PopMessage "Back","�L�����!!",""
%>
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
//   rt=isEmpty(document.form1.uid,'�п�J�b���I');
//      if(rt==false) return rt;

   if(document.form1.email.value==''){
      rt=isEmail(document.form1.email,'��p�z��J��E-mail�榡�����T�ڡI');
   	if(rt==false) return rt;
   }

   rt=isEmpty(document.form1.pwd,'�п�J�K�X�I');
      if(rt==false) return rt;
   rt=isEnglish(document.form1.pwd,'�K�X�п�J�p�g�^��r���B�Ʀr!');
      if(rt==false) return rt;    
   rt=isEmpty(document.form1.username,'�п�J�m�W�I');
      if(rt==false) return rt;
   rt=RadioCheck('csn','�п�ܺ޲z�\��')
      if(rt==false) return rt;
	document.form1.submit();
}

function updatestatus(){
	rt = confirm('�z�T�w�n�ק窱�A�H');
	if(rt==false){return false;}
	else{
		document.form1.action='modifystatus_proc.asp';
		document.form1.submit();
	}
}
function del(){
	rt = confirm('�z�T�w�n�R���H');
	if(rt==false){return false;}
	else{
		document.form1.action='del_proc.asp';
		document.form1.submit();
	}}
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
              <td width="56%"><p><font size="2"><a href="/manage/index.asp">�޲z�t��</a> &gt; <font color="#FF0000"></font> <font size="2"><a href="admin.asp">�|���޲z�C��</a> &gt; <font color="#FF0000"></font> <font color="#FF0000"></font></font><font color="#FF0000">Detial</font></font></p></td>
              <td width="26%" align="right" class="TableColValue">Date�G</td>
              <td width="18%"><span class="Desc-Type01"><%=GetToday()%></span> </td>
            </tr>
        </table></td>
      </tr>
      <tr align="center">
        <td class="copyfont"><form action="modify_proc.asp" method="post" name="form1">
            <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolordark="#FFFFFF" bordercolorlight="#666666">
              <tr>
                <td colspan="2" height="25" align="center" bgcolor="#999999"><p><font color="#FFFFFF"><b>Detial</b></font></p></td>
              </tr>
              <tr>
                <td align="right" class="copyfont"><font class="Comment12font"></font>�b��</td>
                <td class="copyfont"><%=RS("uid")%>&nbsp;</td>
              </tr>
              <tr>
                <td width="17%" align="right" class="copyfont"><font class="Comment12font">*</font>�K�X</td>
                <td width="83%" class="copyfont">
				<input name="pwd" type="text" class="TextBox-Type01" id="pwd" value="<%=RS("pwd")%>" size="20" maxlength="20"></td>
              </tr>
              <tr>
                <td align="right" class="copyfont"><font class="Comment12font">*</font>�T�{�K�X</td>
                <td class="copyfont"><input name="cpwd" type="password" class="TextBox-Type01" id="cpwd" value="<%=RS("pwd")%>" size="20" maxlength="20"></td>
              </tr>
               <tr>
                <td align="right" class="copyfont">Email</td>
                <td class="copyfont"><input name="email" type="text" class="TextBox-Type01" id="email" value="<%=RS("email")%>" size="20" maxlength="20">
                  <span class="gray11"></span></td>
              </tr>
              <tr>
              <tr>
                <td align="right" class="copyfont"><font class="Comment12font">*</font>�m�W</td>
                <td class="copyfont"><input name="username" type="text" class="TextBox-Type01" id="username" value="<%=RS("username")%>" size="20" maxlength="20" ></td>
              </tr>
              <tr>
                <td align="right" class="copyfont"><font class="Comment12font">*</font>�i�ާ@�\��</td>
                <td class="copyfont">
                <input name="csn" type="checkbox" id="csn" value="news" <%=CheckDataInstr(RS("csn"),"news","checked")%>>�̷s����
                <input name="csn" type="checkbox" id="csn" value="book" <%=CheckDataInstr(RS("csn"),"book","checked")%>>�d���O
                <!--
                <input name="csn" type="checkbox" id="csn" value="products" <%=CheckDataInstr(RS("csn"),"products","checked")%>>���~�޲z
                <input name="csn" type="checkbox" id="csn" value="services" <%=CheckDataInstr(RS("csn"),"services","checked")%>>�u�W�ȪA
                <input name="csn" type="checkbox" id="csn" value="stores" <%=CheckDataInstr(RS("csn"),"stores","checked")%>>�g�P���I
                -->
                </td>
              </tr>
            </table>
          <br>
            <input name="Button1" type="button" class="Button-Type01" value="�ק�" onClick="datapost();">
            <input name="Button1" type="button" class="Button-Type01" value="�R��" onClick="del();">
			   <input name="sn" type="hidden" value="<%=sn%>">
        </form></td>
      </tr>
    </table>
    <p>&nbsp;</p></td>
  </tr>
<!--#include virtual="/manage/footer.asp" -->
</table>
</body>
</html>
<%Set RS = nothing%>