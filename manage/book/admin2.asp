<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("book")
'-------------------------PageSetting----------------------------------------------
Dim CookieName,clearsearch
Dim title,Clear,SearchString
Dim PSize,PCount,AbsPage
Dim OrderBy,OrderSeq,OrderIcon,sn
CookieName = "book2"
'clearsearch = filter_data_normal(Request("clear"))
sn=filter_data_normal(Request("sn"))
title = filter_data_normal(trim(Request("title")))			'-----To Cookies-----
PSize = filter_data_normal(Request("PSize"))    			'-----To Cookies-----
AbsPage =filter_data_normal(Request("AbsPage")) 			'-----To Cookies-----
OrderBy = filter_data_normal(Request("OrderBy"))  			'-----To Cookies-----
OrderSeq = filter_data_normal(Request("OrderSeq"))  		'-----To Cookies-----
'--------------------Set Value-------------------------

'if clearsearch = "ok" then	'-----Clear Search Cookies-----						
'	title = ""
'else
'	if title = "" then title = Request.Cookies(CookieName)("title")
'end if
if PSize = "" then PSize = Request.Cookies(CookieName)("PSize")
if AbsPage = "" then AbsPage = Request.Cookies(CookieName)("AbsPage")
if OrderBy = "" then OrderBy = Request.Cookies(CookieName)("OrderBy")
if OrderSeq = "" then OrderSeq = Request.Cookies(CookieName)("OrderSeq")
'-------------------------Default Value---------------------------------------------
if PSize = "" or isNull(PSize)=true then PSize = 10
if AbsPage = "" then AbsPage = 1
if OrderBy = "" then OrderBy = "uid"
if OrderSeq = "" then OrderSeq = "DESC"
'------------------------------------------------------------------------------------------
if OrderSeq = "ASC" then OrderIcon="��"
if OrderSeq = "DESC" then OrderIcon="��"
'-----------------------------------------Command & RecordSet--------------------------------------
'Response.write "PSize="& PSize &"<BR>"
Dim RS,pagecls			'RS:for Mags RS2:for Products of Mags
Set pagecls = new Page_Class2
pagecls.ListOrderBy = OrderBy
pagecls.ListOrderSeq = OrderSeq
pagecls.ListPSize = CInt(PSize)
pagecls.ListAbsPage = CInt(AbsPage)
'�զX�j�M�r��
SearchString = "where uid="& sn
if title <> "" then SearchString = SearchString & " and re_msg like '%"& title &"%'"
Set RS = pagecls.GetListBySearch("talkRe","uid",SearchString)

'-----------------------------Response.Cookies-------------------------------------------
'Response.Cookies(CookieName)("title") = title
Response.Cookies(CookieName)("PSize") = PSize
Response.Cookies(CookieName)("AbsPage") = AbsPage
Response.Cookies(CookieName)("OrderBy") = OrderBy
Response.Cookies(CookieName)("OrderSeq") = OrderSeq
'---------------------------------------------------------------------------------------------------
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
<style type="text/css">
<!--
.copyfont {font-size: 10pt; line-height: 20px}
.style1 {line-height: 20px}
-->
</style>
<script src="/JSFiles/mng_pagelist.js"></script>
<script language="JavaScript" >
<!--
	function del(form,sn){
		rt = confirm('�z�T�w�n�R���ܡH');
		if(rt==false){return false;}
		else{
			form.action='del_proc2.asp';
			form.sn.value=sn;
			form.submit();
		}
	}
-->
</script>
</head>
<body>
<!-- #include virtual="/manage/top.asp" -->
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center">
	<table width="950" border="0">
      <tr>
        <td>
		<table width="100%" border="0">
            <tr>
              <td width="56%"><p><font size="2"><a href="/manage/index.asp">�޲z�t��</a> &gt; <font color="#FF0000">�̷s�����޲z</font></font></p></td>
              <td align="right">Date�G<font face="Arial, Helvetica, sans-serif" size="2" color="#0066CC"><b><%=GetToday()%></b></font> </td>
              </tr>
        </table>
		</td>
      </tr>
      <form name="searchform" action="admin.asp" method="post">
        <tr align="center">
          <td class="copyfont"><font size="2">
            ���D����r�G<input name="title" type="text" size="15"  value="<%=Request.Cookies(CookieName)("title")%>"maxlength="10">
            <input name="secach2" type="button" value="Search" onClick="javascript:this.form.submit();">
           <!-- <input name="secach2" type="button" value="Cancel" onClick="javascript:document.searchform.clear.value='ok';this.form.submit();">
			<input name="clear" type="hidden">-->
          </font> </td>
        </tr>
      </form>
      <tr align="center">
        <td class="copyfont"><form name="form1" method="post" action="">
            <table width="100%" border="1" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#666666" cellpadding="4">
              <tr>
                <td colspan="5" bgcolor="#EEEEEE" class="TableColName"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="80%" class="TableColName"><font size="2">�@<font color="#FF0000"><%=pagecls.ListAtlCount%></font>��  �@ <font color="#FF0000"><%=pagecls.ListPageCount%></font> ���@ �ثe�b�� <font color="#FF0000"><%=pagecls.ListAbsPage%></font> �� �@ �e��
                        <%'response.write "pagecls.ListPageCount="&pagecls.ListPageCount
									Dim wcPages
									Set wcPages = new SelectControl
									wcPages.SelectName = "Pages"
									wcPages.SelectedItem = pagecls.ListAbsPage
									wcPages.AttachEvent = "onchange=""PageList('pgchange',this.form,'abspage',this.options[this.selectedIndex].value)"""
									wcPages.FillSeries 1,pagecls.ListPageCount,1
								%>
                        �� �@�C��
                        <select name="PageSize" onChange="PageList('pgsize',this.form,'psize',this.options[this.selectedIndex].value);">
                          <option value="10" <% if CInt(pagecls.ListPSize) = 10 then Response.Write "selected"%>>10</option>
                          <option value="20" <% if CInt(pagecls.ListPSize) = 20 then Response.Write "selected"%>>20</option>
                          <option value="30" <% if CInt(pagecls.ListPSize) = 30 then Response.Write "selected"%>>30</option>
                          <option value="40" <% if CInt(pagecls.ListPSize) = 40 then Response.Write "selected"%>>40</option>
                          <option value="50" <% if CInt(pagecls.ListPSize) = 50 then Response.Write "selected"%>>50</option>
                          <option value="100" <% if CInt(pagecls.ListPSize) = 100 then Response.Write "selected"%>>100</option>
                          <option value="200" <% if CInt(pagecls.ListPSize) = 200 then Response.Write "selected"%>>200</option>
                          <option value="300" <% if CInt(pagecls.ListPSize) = 300 then Response.Write "selected"%>>300</option>
                        </select>
                        �����
                        <% if CInt(pagecls.ListAbsPage) - 1 > 0 then %>
                        <a href="#" onClick="PageList('pgchange',self.form1,'abspage',<%=CInt(pagecls.ListAbsPage)-1%>);return false;">�W�@��</a>
                        <% end if %>
                        <%if CInt(pagecls.ListAbsPage) - 1 > 0 and CInt(pagecls.ListAbsPage) + 1 <=CInt(pagecls.ListPageCount) then Response.Write"�U"%>
                        <% if CInt(pagecls.ListAbsPage) + 1 <=CInt(pagecls.ListPageCount) then %>
                        <a href="#" onClick="PageList('pgchange',self.form1,'abspage',<%=CInt(pagecls.ListAbsPage)+1%>);return false;">�U�@��</a>
                        <% end if %>
                      </font> </td>
                      <td width="20%" align="right" class="TableColName">
					  <!--<a href="/manage/news/RefCat/admin.asp">���O�޲z</a>�x
					  <a href="#" onClick="document.open('AdjustOrderSeq.asp','Reorder','width=650,height=400,menubar=no,scrollbars=yes,resizable=yes')">�̷s�����Ƨ�</a>�x<a href="add.asp">�s�W</a>-->
					  <!--�x<a href="#" >�Ƨ�</a>--> </td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td height="25" colspan="5" align="center" class="TableHeader">�@�Q�װϦC��@</td>
              </tr>
              <tr class="TableColName">
                <td align="center"><span class="menu2">
				<a href="#" onClick="PageList('order',self.form1,'orderby','orderseq','re_who');return false;">�m�W</a>
				<% if OrderBy = "re_who" then Response.Write OrderIcon  %></span></td>
                <td align="center"><span class="menu2">
				<a href="#" onClick="PageList('order',self.form1,'orderby','orderseq','re_msg');return false;">�D�D</a>
				<% if OrderBy = "re_msg" then Response.Write OrderIcon  %></span></td>
                <td align="center"><span class="menu2">
				<a href="#" onClick="PageList('order',self.form1,'orderby','orderseq','dcreate');return false;">�إߤ��</a>
				<% if OrderBy = "dcreate" then Response.Write OrderIcon  %></span></td>
            <td align="center">&nbsp;</td>
				<td align="center">&nbsp;</td>
              </tr>
              <% 
				Dim strCategoryArray
				While not RS.eof 
			%>
              <tr class="copyfont">
                <td align="center"><%=RS("re_who")%></td>
                <td align="center"><%=RS("re_msg")%></a></td>
                <td align="center"><%=RS("dcreate")%>&nbsp;</td>
                <td align="center">&nbsp;</td>
			<td align="center">
			  <input name="Button31" type="button" class="Button-Type01" value="�R��" onClick="del(this.form,<%=RS("re_uid")%>);">
			</td>
            </tr>
              <% RS.MoveNext :Wend : RS.close : Set RS = nothing%>
			     <input name="sn" type="hidden" value="">
              <input type="hidden" name="orderby" id="orderby" value="<%=pagecls.ListOrderBy%>">
              <input type="hidden" name="orderseq" id="orderseq" value="<%=pagecls.ListOrderSeq%>">
              <input type="hidden" name="psize" id="psize" value="<%=pagecls.ListPSize%>">
              <input type="hidden" name="abspage" id="abspage" value="<%=pagecls.ListAbsPage%>">
            </table>
        </form></td>
      </tr>
    </table><p>&nbsp;</p></td>
  </tr>
<!--#include virtual="/manage/footer.asp" -->
</table>
</body>
</html>
<%
Set pagecls = nothing
Set RS = nothing
Set wcPages = nothing
%>