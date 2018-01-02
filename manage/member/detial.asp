<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("admin")
Dim sn,RS
sn=filter_data_normal(Request("sn"))
if sn ="" then PopMessage "Back","無此資料!!",""
Set RS = GetDataByWhereString("users","*","where sn="&sn) 
if RS.eof then PopMessage "Back","無此資料!!",""
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
<script language="JavaScript" src="/JSfiles/address.js"></script>
<script language="JavaScript" src="/JSFiles/datapost.js"></script>
<script language="JavaScript" src="/JSFiles/showimage.js"></script>
<script language="JavaScript" >
<!--
function datapost(){
//   rt=isEmpty(document.form1.uid,'請輸入帳號！');
//      if(rt==false) return rt;

   if(document.form1.email.value==''){
      rt=isEmail(document.form1.email,'抱歉您輸入的E-mail格式不正確歐！');
   	if(rt==false) return rt;
   }

   rt=isEmpty(document.form1.pwd,'請輸入密碼！');
      if(rt==false) return rt;
   rt=isEnglish(document.form1.pwd,'密碼請輸入小寫英文字母、數字!');
      if(rt==false) return rt;    
   rt=isEmpty(document.form1.username,'請輸入姓名！');
      if(rt==false) return rt;
   rt=RadioCheck('csn','請選擇管理功能')
      if(rt==false) return rt;
	document.form1.submit();
}

function updatestatus(){
	rt = confirm('您確定要修改狀態？');
	if(rt==false){return false;}
	else{
		document.form1.action='modifystatus_proc.asp';
		document.form1.submit();
	}
}
function del(){
	rt = confirm('您確定要刪除？');
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
              <td width="56%"><p><font size="2"><a href="/manage/index.asp">管理系統</a> &gt; <font color="#FF0000"></font> <font size="2"><a href="admin.asp">會員管理列表</a> &gt; <font color="#FF0000"></font> <font color="#FF0000"></font></font><font color="#FF0000">Detial</font></font></p></td>
              <td width="26%" align="right" class="TableColValue">Date：</td>
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
                <td align="right" class="copyfont"><font class="Comment12font"></font>帳號</td>
                <td class="copyfont"><%=RS("uid")%>&nbsp;</td>
              </tr>
              <tr>
                <td width="17%" align="right" class="copyfont"><font class="Comment12font">*</font>密碼</td>
                <td width="83%" class="copyfont">
				<input name="pwd" type="text" class="TextBox-Type01" id="pwd" value="<%=RS("pwd")%>" size="20" maxlength="20"></td>
              </tr>
              <tr>
                <td align="right" class="copyfont"><font class="Comment12font">*</font>確認密碼</td>
                <td class="copyfont"><input name="cpwd" type="password" class="TextBox-Type01" id="cpwd" value="<%=RS("pwd")%>" size="20" maxlength="20"></td>
              </tr>
               <tr>
                <td align="right" class="copyfont">Email</td>
                <td class="copyfont"><input name="email" type="text" class="TextBox-Type01" id="email" value="<%=RS("email")%>" size="20" maxlength="20">
                  <span class="gray11"></span></td>
              </tr>
              <tr>
              <tr>
                <td align="right" class="copyfont"><font class="Comment12font">*</font>姓名</td>
                <td class="copyfont"><input name="username" type="text" class="TextBox-Type01" id="username" value="<%=RS("username")%>" size="20" maxlength="20" ></td>
              </tr>
              <tr>
                <td align="right" class="copyfont"><font class="Comment12font">*</font>可操作功能</td>
                <td class="copyfont">
                <input name="csn" type="checkbox" id="csn" value="news" <%=CheckDataInstr(RS("csn"),"news","checked")%>>最新消息
                <input name="csn" type="checkbox" id="csn" value="book" <%=CheckDataInstr(RS("csn"),"book","checked")%>>留言板
                <!--
                <input name="csn" type="checkbox" id="csn" value="products" <%=CheckDataInstr(RS("csn"),"products","checked")%>>產品管理
                <input name="csn" type="checkbox" id="csn" value="services" <%=CheckDataInstr(RS("csn"),"services","checked")%>>線上客服
                <input name="csn" type="checkbox" id="csn" value="stores" <%=CheckDataInstr(RS("csn"),"stores","checked")%>>經銷據點
                -->
                </td>
              </tr>
            </table>
          <br>
            <input name="Button1" type="button" class="Button-Type01" value="修改" onClick="datapost();">
            <input name="Button1" type="button" class="Button-Type01" value="刪除" onClick="del();">
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