<%
h1=request("h1")
col=request("col")
date2=request("date1")
p=request("p")
addr=request("name1")
qqq=request("qqq")
yyyy=request("yyyy")
mm=request("mm")
dd=request("dd")
date1=date()
ww=date()

if h1="1" then
    mm=mm+1
    if mm=13 then
    mm=1
    yyyy=yyyy+1
    end if
else if h1="2" then
    mm=mm-1
    if mm=0 then
    mm=12
    yyyy=yyyy-1
    end if
end if
end if

'判斷年份
if yyyy<>"" then
else
yyyy=datepart("yyyy",ww)
yyyy=trim(yyyy)
end if

'判斷月份


if mm<>"" then
else
mm=datepart("m",ww)
end if
mm=trim(mm)
'          window.opener.document.TheForm.col.focus();window.close();


%>

<html>
<head>
<title>日曆</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style type="text/css">
<!--
a:link {  text-decoration: none}
a:hover {  text-decoration: underline; color: #FF0000}
.text {  text-decoration: none}
-->
</style></head>
<script language="JavaScript1.2">
<!--
<% col=request("col") %>
function Send_Date(Date_String,col)
{
  if (window.opener && !window.opener.closed)
        {
col.value= Date_String;
col.focus();
        }
 window.close();
}
function datapost(){
	document.q1.submit()
	}
function datapost1(){
document.q1.h1.value=1;
	document.q1.submit();
	}
function datapost2(){
document.q1.h1.value=2;
	document.q1.submit();
	}
//-->
</script>
<body bgcolor="#CEE7FF" link="#0066CC" vlink="#0066CC" alink="#FF6666" topmargin=0 marginheight=0 leftmargin=0>
<form method="post" action="date.asp?col=<%=col%>" name="q1">
  <div align="center"></div>
  <table border="0" cellpadding="0" cellspacing="0" align="center" height="74">
    <tr> 
      <td height="16" bgcolor="#0066CC"> 
        <div align="center"><font size="2"><a href=""  onclick="datapost2();return false;"><font color="#FFFFCC" class="text">＜</font></a></font><font size="2" color="#CEE7FF">　<%=yyyy & " 年" & mm & " 月"%> 
          　</font><font size="2"><a href="" onClick="datapost1();return false;"><font color="#FFFFCC"><span class="text"><span class="text"><span class="text"><span class="text">＞</span></span></span></span></font></a> 
          </font></div>
      </td>
    </tr>
    <tr> 
      <td height="30"><font size="2" color="#999999"><font color="#CC0099"><font color="#330099"><font color="#990099"> 
        </font></font></font></font> 
        <table border="1" cellspacing="0" cellpadding="0" width="156" height="21">
          <tr bgcolor="#0066CC" align="center"> 
            <td width="22" ><font color="#CEE7FF" size="2">日</font></td>
            <td width="22"><font color="#CEE7FF" size="2">一</font></td>
            <td width="22"><font color="#CEE7FF" size="2">二</font></td>
            <td width="22"><font color="#CEE7FF" size="2">三</font></td>
            <td width="22"><font color="#CEE7FF" size="2">四</font></td>
            <td width="22"><font color="#CEE7FF" size="2">五</font></td>
            <td width="22"><font color="#CEE7FF" size="2">六</font></td>
          </tr>
          <tr  align="center"> <%
q=1
now1=yyyy&"/"&mm&"/"& q
now3=now1
for q=1 to 31

now2=dateserial(yyyy,mm,q)
if datepart("m",now2)=datepart("m",now3) then
if now2=date() then
bb=1
else
end if
t="<td>.</td>"
day1=datepart("w",now2) 
'第一週非當月空白數量
if q=1 then
aa=day1-1
for b=1 to aa
response.write "<td>　</td>"
next
end if

if bb="1" then
bb="#FFFFC1"
else
bb="#CEE7FF"
end if

if day1=7 then
response.write "<td bgcolor=" & bb & "><font size=2 >" %><a href="javascript:Send_Date('<%= now2 %>',<%=col%>)"><% response.write datepart("d",now2) & "</a></font></td></tr><tr align=center>"
else
response.write "<td bgcolor=" & bb & "><font size=2 >"%></a><a href="javascript:Send_Date('<%= now2 %>',<%=col%>)"><% response.write datepart("d",now2) & "</a></font></td>"
end if

bb=""
dd=""

now3=now2
else
now2=now2-1
exit for
end if

next

daya=datepart("w",now2) 

ee=7-daya
if ee<>0 then
for bb=1 to ee
response.write "<td bgcolor=#CEE7FF>　</td>"
next
else
end if

%></a></tr>
        </table>
        <font size="2" color="#999999"><font color="#CC0099"><font color="#330099"><font color="#990099"> 
        <select name="yyyy">
<%
for ddd=(cint(yyyy)-10) to (cint(yyyy)+10)
	if  ddd=cint(trim(yyyy)) then
		d1="selected"
	else
		d1=""
	end if
	response.write "<option value=" & ddd & " " & d1 & ">" & ddd & "</option>"
next
%> 
        </select>
        </font></font></font> <font color="#990099"> <font color="#0066CC">年</font> 
        <select name="mm">
          <%
for a3=1 to 12
if  trim(a3)=mm then
d5="selected"
else
d5=""
end if
response.write "<option value=" & a3 & " " & d5 & ">" & a3 & "</option>"
next
%> 
        </select>
        </font> </font> <font size="2" color="#0066CC">月 <a href="" onClick="datapost();return false;">GO</a></font><font size="2" color="#990099"> 
        </font> <font size="2" color="#999999"><font color="#CC0099"><font color="#330099"><font color="#990099"> 
        </font></font></font></font><font size="2" color="#999999"></font> 
        <input type="hidden" name="date2" value="<%=date2%>">
        <input type="hidden" name="h1">
      </td>
    </tr>
    <tr> 
      <td height="1"> 
        <hr>
      </td>
    </tr>
  </table>
  </form>
  <font size="2" color="#999999"><font color="#CC0099"><font color="#330099"><font color="#990099"> 
  </font></font></font></font> 

<p>&nbsp;</p>
<p>&nbsp; </p>

</body>
</html>
