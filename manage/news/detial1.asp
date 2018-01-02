<% Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
'權限管理
HasPermission("news")
Dim sn,RS,img
Set img = new ImageControl
sn=filter_data_normal(Request("sn"))
if sn ="" then PopMessage "Back","無此資料!!",""
Set RS = GetDataByWhereString("[new]","*","where sn="&sn) 
if RS.eof then PopMessage "Back","無此資料!!",""
Dim pic1,pic2,pic3,nfile
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
<script language="JavaScript" src="/JSFiles/datapost.js"></script>
<script language="JavaScript" src="/JSFiles/showimage.js"></script>
<script language="JavaScript" >
<!--
	function datapost(form){
		var rt;
		rt = isEmpty(form.title,'請輸入標題');
		if(rt==false)return rt;
		rt = isEmpty(form.startdate,'請選擇上稿時間');
		if(rt==false)return rt;
		rt = isEmpty(form.enddate,'請選擇下稿時間');
		if(rt==false)return rt;
		form.submit();
	}
	function forever(){
	    document.form1.startdate.value='2000/1/1';
		document.form1.enddate.value='2200/1/1';
	}
	function del(form){
		rt = confirm('您確定要刪除嗎？');
		if(rt==false){return false;}
		else{
			form.action='del_proc.asp';
			form.encoding = 'application/x-www-form-urlencoded';
			form.submit();
		}
	}
	function openRefCat_Picker(RefTitle,txtTarget,valTarget){
		var path = 'RefCat_Picker.asp';
		path+='?RefTitle='+RefTitle;
		path+='&txtTarget='+txtTarget;
		path+='&valTarget='+valTarget;
		window.open(path,'RefCatPicker','width=300,height=500,menubar=no,scrollbars=yes,resizable=yes')
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
    <td>&nbsp;<%'=GetSNFile("pic1","new","pic1",3)&".gif"%></td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0">
      <tr>
        <td><table width="100%" border="0">
            <tr>
              <td width="56%"><p><font size="2"><a href="/manage/index.asp">管理系統</a> &gt; <font color="#FF0000"></font> <font size="2"><a href="admin.asp">最新消息列表</a> &gt; <font color="#FF0000"></font> <font color="#FF0000"></font></font><font color="#FF0000">Detial</font></font></p></td>
              <td width="26%" align="right" class="TableColValue">Date：</td>
              <td width="18%"><span class="Desc-Type01"><%=GetToday()%></span> </td>
            </tr>
        </table></td>
      </tr>
      <tr align="center">
        <td class="copyfont"><form action="modify_proc1.asp" method="post" name="form1">
            <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolordark="#FFFFFF" bordercolorlight="#666666">
              <tr>
                <td colspan="2" height="25" align="center" bgcolor="#999999"><p><font color="#FFFFFF"><b>Detial</b></font></p></td>
              </tr>
              <tr>
                <td align="right" class="TableColName"><font class="Comment12font">*</font>類別名稱</td>
                <td class="TableColValue">
				<span class="Desc-Type01" id="cname1"><%if RS("category")<>"" then Response.write GatCategoryStr(RS("category"))%></span>
                <input name="Button32" type="button" class="Button-Type02" value="選取" onClick="openRefCat_Picker('new','cname1','category');">
                <input name="category" type="hidden" id="category" value="<%=RS("category")%>">				
				</td>
              </tr>
              <tr>
                <td width="14%" align="right" class="TableColName"><font class="Comment12font">*</font>標題</td>
                <td width="86%" class="TableColValue"><input name="title" type="text" class="TextBox-Type01" id="title" value="<%=RS("title")%>" size="50" maxlength="200"></td>
              </tr>
              <tr>
                <td width="14%" align="right" class="TableColName">網址</td>
                <td width="86%" class="TableColValue"><input name="nfile" type="text" class="TextBox-Type01" id="nfile" value="<%=RS("nfile")%>" size="50" maxlength="200"></td>
              </tr>
<tr>
                <td width="14%" align="right" class="TableColName">pic網址</td>
                <td width="86%" class="TableColValue"><input name="content2" type="text" class="TextBox-Type01" id="content2" value="<%=RS("content2")%>" size="50" maxlength="200"></td>
              </tr>
              <tr>
                <td align="right" class="TableColName">發佈日期<BR>(排序條件1)</td>
                <td class="TableColValue"><input name="releasedate" type="text" class="TextBox-Type01" id="releasedate" value="<%=RS("releasedate")%>" size="20" maxlength="20" readonly="true" onClick="window.open('/include/date.asp?col=window.opener.document.all.releasedate','CalendaeWin','width=160,height=170')"></td>
              </tr>
              <tr>
                <td align="right" class="TableColName"><span class="Comment12font">*</span>首頁上/下稿日期</td>
                <td class="TableColValue"><input name="startdate" type="text" class="TextBox-Type01" id="startdate" value="<%=RS("startdate")%>" size="20" maxlength="20" readonly="true" onClick="window.open('/include/date.asp?col=window.opener.document.all.startdate','CalendaeWin','width=160,height=170')">
                  ～
                  <input name="enddate" type="text" class="TextBox-Type01" id="enddate" value="<%=RS("enddate")%>" size="20" maxlength="20" readonly="true" onClick="window.open('/include/date.asp?col=window.opener.document.all.enddate','CalendaeWin','width=160,height=170')">
			 <span onClick="forever();" onMouseOver="this.style.cursor='hand';" class="TableColValue">永遠上稿</span> </td>
              </tr>
             <!-- <tr>
                <td align="right" class="TableColName">重要標示</td>
                <td class="TableColValue">
				<input name="hintpic" type="radio" value="no" <%=CheckData("no",cstr(RS("hintpic")),"checked")%>>無
                <input name="hintpic" type="radio" value="new" <%=CheckData("new",cstr(RS("hintpic")),"checked")%>>NEW
                <input name="hintpic" type="radio" value="hot" <%=CheckData("hot",cstr(RS("hintpic")),"checked")%>>HOT</td>
              </tr>-->
              <tr>
                <td align="right" class="TableColName">內文</td>
                <td class="TableColValue"><textarea name="content1" cols="80" rows="10"><%=Content_Filter(RS("content1"))%></textarea>
				<BR>範例：<BR>
				文字粗體語法： &lt;b&gt;粗體&lt;/b&gt;
				<BR>
				另開視窗語法： &lt;a href=&quot;前往網址&quot; target=&quot;_blank&quot;&gt;顯示文字&lt;/a&gt;
				<BR>
				 
				轉頁面語法： &lt;a href=&quot;前往網址&quot; &gt;顯示文字&lt;/a&gt;</td>
              </tr>
			  <!--<tr>
                <td align="right" class="TableColName">圖檔1</td>
                <td class="TableColName"><input type="file" name="pic1">
				<%
				 pic1=RS("pic1")
				 if pic1 <> null or pic1 <> "" then
				%>
                <input name="delpic1" type="checkbox" id="delpic1" value="yes">
                刪除 
                <%
						img.Name = pic1
						img.FillOrigin2
				end if
				%></td>
              </tr>
			  <tr>
                <td align="right" class="TableColName">圖檔2</td>
                <td class="TableColName"><input type="file" name="pic2">
				<%
				 pic2=RS("pic2")
				 if pic2 <> null or pic2 <> "" then
				%>
                <input name="delpic2" type="checkbox" id="delpic2" value="yes">
                刪除 
                <%
						img.Name = pic2
						img.FillOrigin2
				end if
				%></td>
              </tr>
              <tr>
                <td align="right" class="TableColName">圖檔3</td>
                <td class="TableColName"><input type="file" name="pic3">
				<%
				 pic3=RS("pic3")
				 if pic3 <> null or pic3 <> "" then
				%>
                <input name="delpic3" type="checkbox" id="delpic3" value="yes">
                刪除 
                <%
						img.Name = pic3
						img.FillOrigin2
				end if
				%></td>
              </tr>
               <tr>
                <td align="right" class="TableColName">相關檔案</td>
                <td class="TableColName"><input type="file" name="nfile">
				<%
				 nfile=RS("nfile")
				 if nfile <> null or nfile <> "" then
				%>
				<span onMouseOver="this.style.cursor='hand';" onClick="MM_openBrWindow('../../upload/<%=nfile%>','','scrollbars=yes,width=720,height=500')" class="TableColName">預覽相關檔案</span>
                <input name="delnfile" type="checkbox" id="delnfile" value="yes">
                刪除 
                <%
				end if
				%></td>
              </tr>-->
            </table>
          <br><input name="sn" type="hidden" value="<%=sn%>">
            <input name="Button2" type="button" class="Button-Type01" value="修改" onClick="datapost(this.form);">
			<input name="Button2" type="button" class="Button-Type01" value="刪除" onClick="del(this.form);">
        </form></td>
      </tr>
    </table>
    <p>&nbsp;</p></td>
  </tr>
<!--#include virtual="/manage/footer.asp" -->
</table>
</body>
</html>
<%
Set img = nothing
Set RS = nothing
%>