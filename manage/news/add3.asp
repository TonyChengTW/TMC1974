<% Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("news")
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
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0">
      <tr>
        <td><table width="100%" border="0">
            <tr>
              <td width="56%"><p><font size="2"><a href="/manage/index.asp">管理系統</a> &gt; <font color="#FF0000"></font> <font size="2"><a href="admin.asp">最新消息列表</a> &gt; <font color="#FF0000"></font> <font color="#FF0000"></font></font><font color="#FF0000">新增頁面</font></font></p></td>
              <td width="26%" align="right" class="TableColValue">Date：</td>
              <td width="18%"><span class="Desc-Type01"><%=GetToday()%></span> </td>
            </tr>
        </table></td>
      </tr>
      <tr align="center">
        <td class="copyfont"><form action="add_proc3.asp" method="post" name="form1">
            <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolordark="#FFFFFF" bordercolorlight="#666666">
              <tr>
                <td colspan="2" height="25" align="center" bgcolor="#999999"><p><font color="#FFFFFF"><b>新增頁面</b></font></p></td>
              </tr>
              <tr>
                <td align="right" class="TableColName">類別名稱</td>
                <td class="TableColValue">
				<span class="Desc-Type01" id="cname1"></span>
                <input name="Button32" type="button" class="Button-Type02" value="選取" onClick="openRefCat_Picker('new','cname1','category');">
                <input name="category" type="hidden" id="category">				
				</td>
              </tr>
              <tr>
                <td width="14%" align="right" class="TableColName"><font class="Comment12font">*</font>標題</td>
                <td width="86%" class="TableColValue"><input name="title" type="text" class="TextBox-Type01" id="title" value="" size="50" maxlength="200"></td>
              </tr>
                <tr>
                <td width="14%" align="right" class="TableColName">網址</td>
                <td width="86%" class="TableColValue"><input name="nfile" type="text" class="TextBox-Type01" id="nfile" value="" size="50" maxlength="200"></td>
              </tr>

             <tr>
                <td width="14%" align="right" class="TableColName">照片封面</td>
                <td width="86%" class="TableColValue"><input name="coverLink" type="text" class="TextBox-Type01" id="coverLink" value="" size="50" maxlength="200"></td>
              </tr>


              <tr>
                <td width="14%" align="right" class="TableColName">熱力學堂</td>
                <td width="86%" class="TableColValue"><input name="content2" type="text" class="TextBox-Type01" id="content2" value="" size="50" maxlength="200">主持人<input name="head2" type="text" class="TextBox-Type01" id="head2" value="" size="10" maxlength="200">職位<input name="htitle1" type="text" class="TextBox-Type01" id="htitle1" value="" size="10" maxlength="200"></td>
              </tr>
<tr>
                <td width="14%" align="right" class="TableColName">T.M.訓練</td>
                <td width="86%" class="TableColValue"><input name="content3" type="text" class="TextBox-Type01" id="content3" value="" size="50" maxlength="200">主持人<input name="head3" type="text" class="TextBox-Type01" id="head3" value="" size="10" maxlength="200">職位<input name="htitle2" type="text" class="TextBox-Type01" id="htitle2" value="" size="10" maxlength="200"></td>
              </tr>
<tr>
                <td width="14%" align="right" class="TableColName">教育訓練</td>
                <td width="86%" class="TableColValue"><input name="content4" type="text" class="TextBox-Type01" id="content4" value="" size="50" maxlength="200">主持人<input name="head4" type="text" class="TextBox-Type01" id="head4" value="" size="10" maxlength="200">職位<input name="htitle3" type="text" class="TextBox-Type01" id="htitle3" value="" size="10" maxlength="200"></td>
              </tr>
<tr>
             <td width="14%" align="right" class="TableColName">上課日期</td>
                <td width="86%" class="TableColValue"><input name="sdate" type="text" class="TextBox-Type01" id="sdate" value="<%=FormatDateTime(now(),2)%>" size="20" maxlength="20" readonly="true" onClick="window.open('/include/date.asp?col=window.opener.document.all.releasedate','CalendaeWin','width=160,height=170')"></td>
              </tr>


              <tr>
                <td align="right" class="TableColName">發佈日期<BR>(排序條件1)</td>
                <td class="TableColValue"><input name="releasedate" type="text" class="TextBox-Type01" id="releasedate" value="<%=FormatDateTime(now(),2)%>" size="20" maxlength="20" readonly="true" onClick="window.open('/include/date.asp?col=window.opener.document.all.releasedate','CalendaeWin','width=160,height=170')"></td>
              </tr>
              <tr>
                <td align="right" class="TableColName"><span class="Comment12font">*</span>首頁上/下稿日期</td>
                <td class="TableColValue"><input name="startdate" type="text" class="TextBox-Type01" id="startdate" value="" size="20" maxlength="20" readonly="true" onClick="window.open('/include/date.asp?col=window.opener.document.all.startdate','CalendaeWin','width=160,height=170')">
                  ～
                  <input name="enddate" type="text" class="TextBox-Type01" id="enddate" value="" size="20" maxlength="20" readonly="true" onClick="window.open('/include/date.asp?col=window.opener.document.all.enddate','CalendaeWin','width=160,height=170')">
			 <span onClick="forever();" onMouseOver="this.style.cursor='hand';" class="TableColValue">永遠上稿</span> </td>
              </tr>
             <!-- <tr>
                <td align="right" class="TableColName">重要標示</td>
                <td class="TableColValue">
				    <input name="hintpic" type="radio" value="no" checked>無
                <input name="hintpic" type="radio" value="new">NEW
                <input name="hintpic" type="radio" value="hot">HOT</td>
              </tr>-->
              <tr>
                <td align="right" class="TableColName">內文</td>
                <td class="TableColValue"><textarea name="content1" cols="80" rows="10"></textarea> 
				<BR>
				範例：<BR>
文字粗體語法： &lt;b&gt;粗體&lt;/b&gt; <BR>
另開視窗語法： &lt;a href=&quot;前往網址&quot; target=&quot;_blank&quot;&gt;顯示文字&lt;/a&gt; <BR>
轉頁面語法： &lt;a href=&quot;前往網址&quot; &gt;顯示文字&lt;/a&gt;				</td>
              </tr>
			  <!--<tr>
                <td align="right" class="TableColName">圖檔1</td>
                <td class="TableColName"><input type="file" name="pic1"></td>
              </tr>
			  <tr>
                <td align="right" class="TableColName">圖檔2</td>
                <td class="TableColName"><input type="file" name="pic2"></td>
              </tr>
              <tr>
                <td align="right" class="TableColName">圖檔3</td>
                <td class="TableColName"><input type="file" name="pic3"></td>
              </tr>
              <tr>
                <td align="right" class="TableColName">相關檔案</td>
                <td class="TableColName"><input type="file" name="nfile"></td>
              </tr>-->			  
            </table>
          <br>
            <input name="Button2" type="button" class="Button-Type01" value="新增" onClick="datapost(this.form);">
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
