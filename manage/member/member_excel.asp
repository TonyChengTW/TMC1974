<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("admin")
Dim ORS
Set ORS = GetDataByWhereString("member","*","") 
if ORS.eof then
	PopMessage "Back","No Data!",""
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>管理後端</title>
</head>
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="black">
    <tr> 
      <td> 
        <table width="100%" border="1" cellpadding="0" cellspacing="1" bordercolor="#c1c1c1" class="black">
    <tr align="center">
      <td width="10%" height="30" bgcolor="#e7e7f7"><font color="#003366">會員編號</font></td> 
      <td width="5%" bgcolor="#e7e7f7"><font color="#003366">帳號</font></td>
      <td width="5%" bgcolor="#e7e7f7"><font color="#003366">密碼</font></td>
      <td width="5%" bgcolor="#e7e7f7"><font color="#003366">姓名</font></td>
       <td width="5%" bgcolor="#e7e7f7"><font color="#003366">性別</font></td>
       <td width="6%" bgcolor="#e7e7f7"><font color="#003366">Email</font></td>
	  <td width="10%" bgcolor="#e7e7f7"><font color="#003366">聯絡電話</font></td>
     <td width="12%" bgcolor="#e7e7f7"><font color="#003366">地址</font></td>
      <td width="9%" bgcolor="#e7e7f7"><font color="#003366">是否訂閱電子報</font></td>
      <td width="8%" bgcolor="#e7e7f7"><font color="#003366">狀態</font></td>
	  <td width="10%" bgcolor="#e7e7f7"><font color="#003366">新增日期</font></td>
	  <td width="15%" bgcolor="#e7e7f7"><font color="#003366">上次修改日期</font></td>
      </tr>
		<%	dim i
			i=1
			while not ORS.eof
		%>
    <tr align="center">
      <td height="26" ><%=ORS("sn")%></td> 
      <td><font color="#006600"><%=ORS("uid")%></font></td>
      <td><font color="#006600"><%=ORS("pwd")%></font></td>
      <td><font color="#006600"><%=ORS("name")%>&nbsp;</font></td>
      <td><font color="#006600"><%=ORS("gender") %></font></td>
      <td><font color="#006600"><%=ORS("email") %>&nbsp;</font></td>
      <td><font color="#006600"><%=ORS("phone") %></font>&nbsp;</td>
      <td><font color="#006600"><%=ORS("zip")&ORS("city")&replace(ORS("district"),ORS("zip"),"")&ORS("address") %>&nbsp;</font></td>
      <td><font color="#006600"><%=Replace(Replace(ORS("subscribe"),1,"訂閱"),0,"不訂閱")%>&nbsp;</font></td>
      <td><font color="#006600"><%=Replace(Replace(ORS("status"),1,"可登入"),0,"不可登入")%>&nbsp;</font></td>
	  <td><font color="#006600"><%=ORS("cdate")%>&nbsp;</font></td>
	  <td><font color="#006600"><%=ORS("mdate")%>&nbsp;</font></td>
	  </tr> 
		<%
			i=i+1:ORS.movenext:wend:Set ORS = nothing
		%>
  </table>
      </td>
    </tr>
  </table>
<p align="center">
  <input type="button" name="Button" value="回上一頁" onClick="history.go(-1);">
</p>
</body>
</html>
<script language="JavaScript">
document.execCommand('SaveAs', true, 'MemberList.xls');
</script>
