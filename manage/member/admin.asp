<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("admin")
'-------------------------PageSetting----------------------------------------------
Dim CookieName,clearsearch
Dim uid,Clear,SearchString
Dim PSize,PCount,AbsPage
Dim OrderBy,OrderSeq,OrderIcon
CookieName = "member"
'clearsearch = filter_data_normal(Request("clear"))
uid = filter_data_normal(trim(Request("uid")))			'-----To Cookies-----
PSize = filter_data_normal(Request("PSize"))    			'-----To Cookies-----
AbsPage =filter_data_normal(Request("AbsPage")) 			'-----To Cookies-----
OrderBy = filter_data_normal(Request("OrderBy"))  			'-----To Cookies-----
OrderSeq = filter_data_normal(Request("OrderSeq"))  		'-----To Cookies-----
'--------------------Set Value-------------------------

'if clearsearch = "ok" then	'-----Clear Search Cookies-----						
'	uid = ""
'else
'	if uid = "" then uid = Request.Cookies(CookieName)("uid")
'end if
if PSize = "" then PSize = Request.Cookies(CookieName)("PSize")
if AbsPage = "" then AbsPage = Request.Cookies(CookieName)("AbsPage")
if OrderBy = "" then OrderBy = Request.Cookies(CookieName)("OrderBy")
if OrderSeq = "" then OrderSeq = Request.Cookies(CookieName)("OrderSeq")
'-------------------------Default Value---------------------------------------------
if PSize = "" or isNull(PSize)=true then PSize = 10
if AbsPage = "" then AbsPage = 1
if OrderBy = "" then OrderBy = "mdate"
if OrderSeq = "" then OrderSeq = "DESC"
'------------------------------------------------------------------------------------------
if OrderSeq = "ASC" then OrderIcon="▲"
if OrderSeq = "DESC" then OrderIcon="▼"
'-----------------------------------------Command & RecordSet--------------------------------------
'Response.write "PSize="& PSize &"<BR>"
Dim RS,pagecls			'RS:for Mags RS2:for Products of Mags
Set pagecls = new page_Class
pagecls.ListOrderBy = OrderBy
pagecls.ListOrderSeq = OrderSeq
pagecls.ListPSize = CInt(PSize)
pagecls.ListAbsPage = CInt(AbsPage)
'組合搜尋字串
SearchString = ""
if uid <> "" then SearchString = " Where ([email] like '%"& uid &"%')"
if SearchString <> "" then 
	Set RS = pagecls.GetListBySearch("[users]","sn",SearchString)
else
	Set RS = pagecls.GetList("[users]","sn")
end if
'-----------------------------Response.Cookies-------------------------------------------
'Response.Cookies(CookieName)("uid") = uid
Response.Cookies(CookieName)("PSize") = PSize
Response.Cookies(CookieName)("AbsPage") = AbsPage
Response.Cookies(CookieName)("OrderBy") = OrderBy
Response.Cookies(CookieName)("OrderSeq") = OrderSeq
'---------------------------------------------------------------------------------------------------
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
<style type="text/css">
<!--
.copyfont {font-size: 10pt; line-height: 20px}
.style1 {line-height: 20px}
-->
</style>
<script src="/JSFiles/mng_pagelist.js"></script>
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
              <td width="56%"><p><font size="2"><a href="/manage/index.asp">管理系統</a> &gt; <font color="#FF0000">使用者管理</font></font></p></td>
              <td align="right">Date：<font face="Arial, Helvetica, sans-serif" size="2" color="#0066CC"><b><%=GetToday()%></b></font> </td>
              </tr>
        </table>
		</td>
      </tr>
      <form name="searchform" action="admin.asp" method="post">
        <tr align="center">
          <td class="copyfont"><font size="2">
            帳號關鍵字：<input name="uid" type="text" size="15"  value="<%'=Request.Cookies(CookieName)("uid")%>"maxlength="10">
            <input name="secach2" type="button" value="Search" onClick="javascript:this.form.submit();">
            <!--<input name="secach2" type="button" value="Cancel" onClick="javascript:document.searchform.clear.value='ok';this.form.submit();">
			<input name="clear" type="hidden">-->
          </font> </td>
        </tr>
      </form>
      <tr align="center">
        <td class="copyfont"><form name="form1" method="post" action="">
            <table width="100%" border="1" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#666666" cellpadding="4">
              <tr>
                <td colspan="8" bgcolor="#EEEEEE" class="TableColName"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="80%" class="TableColName"><font size="2">共<font color="#FF0000"><%=pagecls.ListAtlCount%></font>筆  共 <font color="#FF0000"><%=pagecls.ListPageCount%></font> 頁　 目前在第 <font color="#FF0000"><%=pagecls.ListAbsPage%></font> 頁 　 前往
                        <%'response.write "pagecls.ListPageCount="&pagecls.ListPageCount
									Dim wcPages
									Set wcPages = new SelectControl
									wcPages.SelectName = "Pages"
									wcPages.SelectedItem = pagecls.ListAbsPage
									wcPages.AttachEvent = "onchange=""PageList('pgchange',this.form,'abspage',this.options[this.selectedIndex].value)"""
									wcPages.FillSeries 1,pagecls.ListPageCount,1
								%>
                        頁 　每頁
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
                        筆顯示
                        <% if CInt(pagecls.ListAbsPage) - 1 > 0 then %>
                        <a href="#" onClick="PageList('pgchange',self.form1,'abspage',<%=CInt(pagecls.ListAbsPage)-1%>);return false;">上一頁</a>
                        <% end if %>
                        <%if CInt(pagecls.ListAbsPage) - 1 > 0 and CInt(pagecls.ListAbsPage) + 1 <=CInt(pagecls.ListPageCount) then Response.Write"｜"%>
                        <% if CInt(pagecls.ListAbsPage) + 1 <=CInt(pagecls.ListPageCount) then %>
                        <a href="#" onClick="PageList('pgchange',self.form1,'abspage',<%=CInt(pagecls.ListAbsPage)+1%>);return false;">下一頁</a>
                        <% end if %>
                      </font> </td>
                      <td width="20%" align="right" class="TableColName"><font size="2"> <a href="add.asp">新增</a> <!--| <a href="member_excel.asp">匯出</a>-->
					  <!--│<a href="#" >排序</a>--> </font> </td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td height="25" colspan="8" align="center" class="TableHeader">　列表　</td>
              </tr>
              <tr class="TableColName">
                <!--<td width="15%" align="center">會員類別</td>
                <td width="13%" align="center">型錄索取</td>-->
                <td width="17%" align="center"><span class="menu2">
				<a href="#" onClick="PageList('order',self.form1,'orderby','orderseq','username');return false;">姓名</a>
				<% if OrderBy = "username" then Response.Write OrderIcon  %>
                </span></td>
                <td width="14%" align="center"><span class="menu2">
				<a href="#" onClick="PageList('order',self.form1,'orderby','orderseq','email');return false;">email</a>
				<% if OrderBy = "email" then Response.Write OrderIcon  %></span></td>
                <!--<td width="14%" align="center"><a href="#" onClick="PageList('order',self.form1,'orderby','orderseq','status');return false;">審核狀態</a>
				<% if OrderBy = "status" then Response.Write OrderIcon  %></span></td>-->
                <!--<td width="14%" align="center"><span class="menu2">
				<a href="#" onClick="PageList('order',self.form1,'orderby','orderseq','status');return false;">狀態</a>
				<% if OrderBy = "status" then Response.Write OrderIcon  %></span></td>-->
                <td width="27%" align="center"><span class="menu2"><a href="#" onClick="PageList('order',self.form1,'orderby','orderseq','mdate');return false;">最後修改日期</a>
				<% if OrderBy = "mdate" then Response.Write OrderIcon  %></span></td>
              </tr>
              <% 
				Dim strCategoryArray,getcatalog,gcStatus,membertype
				While not RS.eof 
					'getcatalog = RS("getcatalog")
					'gcStatus = RS("getcatalogstatus")
					'membertype = GetMemberType(RS("job"))
			%>
              <tr class="copyfont">
             <!--   <td align="center"><%=membertype%></td>
                <td align="center">
				<%
					'if membertype = "一般會員" then
					'	Response.write "否"
					'else
					'	if getcatalog = 1 then 
					'		if gcStatus = 1 then
					'			Response.write "是(已處理)"
					'		else
					'			Response.write "是(未處理)"
					'		end if
					'	else
					'		Response.write "否"
					'	end if
					'end if
				%>				</td>-->
                <td align="center"><a href="detial.asp?sn=<%=RS("sn")%>" onClick="PageList('',self.form1);" > <%=RS("username")%></a>&nbsp;</td>
                <td align="center"><a href="detial.asp?sn=<%=RS("sn")%>" onClick="PageList('',self.form1);" > <%=RS("email")%> </a> &nbsp;</td>
<!--                <td align="center"><%'=Replace(Replace(RS("chcekstatus"),1,"通過"),0,"不通過")%></td>
                <td align="center"><%'=Replace(Replace(RS("status"),1,"可登入"),0,"不可登入")%>&nbsp;</td>-->
                <td align="center"><%=RS("mdate")%>&nbsp;</td>
              </tr>
              <% RS.MoveNext :Wend : RS.close : Set RS = nothing%>
              <input type="hidden" name="orderby" value="<%=pagecls.ListOrderBy%>">
              <input type="hidden" name="orderseq" value="<%=pagecls.ListOrderSeq%>">
              <input type="hidden" name="psize" value="<%=pagecls.ListPSize%>">
              <input type="hidden" name="abspage" value="<%=pagecls.ListAbsPage%>">
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