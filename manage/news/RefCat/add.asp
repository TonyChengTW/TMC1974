<%	Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission("news")
Dim RefTitle,ParentSN
RefTitle = filter_data_normal(Request.form("RefTitle"))
ParentSN = filter_data_normal(Request.form("ParentSN"))
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
<script language="JavaScript" src="/JSFiles/datapost.js"></script>
<script language="JavaScript" src="/JSFiles/showimage.js"></script>
<script language="JavaScript" >
<!--
	function datapost(form){
		var rt;
		rt = isEmpty(form.cname,'�п�J�W��!!');
		if(rt==false)return rt;
		/*rt = isEmpty(form.cimg,'�п�����O����!!');
		if(rt==false)return rt;
		rt = isEmpty(form.titleimg,'�п�����Otitle����!!');
		if(rt==false)return rt;		*/
		form.submit();
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
              <td width="56%"><p><a href="/manage/index.asp"><font size="2">�޲z�t��</font></a>
			  <font size="2">&gt; <a href="../admin.asp">�̷s�����޲z</a> &gt;<a href="admin.asp">�̷s�������O�޲z</a> &gt;
			  <font color="#FF0000">�s�W���O</font></font></td>
              <td width="26%" align="right" class="TableColValue">Date�G</td>
              <td width="18%"><span class="Desc-Type01"><%=GetToday()%></span> </td>
            </tr>
        </table></td>
      </tr>
      <tr align="center">
        <td class="copyfont"><form action="add_proc.asp" method="post" enctype="multipart/form-data" name="form1">
            <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolordark="#FFFFFF" bordercolorlight="#666666">
              <tr>
                <td colspan="2" height="25" align="center" bgcolor="#999999"><p><font color="#FFFFFF"><b>�s �W �� �O</b></font></p></td>
              </tr>
              <tr>
                <td align="right" class="TableColName"><font class="Comment12font">*</font>���O�W��</td>
                <td class="TableColValue"><input name="cname" type="text" id="cname" value="" size="50" maxlength="25">
                  <span class="Comment12font">(�̦h20�r)</span></td>
              </tr>
              <!--<tr>
                <td width="14%" align="right" class="TableColName"><span class="TableColValue">���O����</span></td>
                <td width="86%" class="TableColValue"><input name="cimg" type="file" id="cimg"></td>
              </tr>
              <tr>
                <td align="right" class="TableColName">���Otitle����</td>
                <td class="TableColValue"><input name="titleimg" type="file" id="iconon"></td>
              </tr>-->
            </table>
          <br>
            <input name="Button2" type="button" class="Button-Type01" value="�s�W" onClick="datapost(this.form);">
            <input name="Submit22" type="reset" class="Button-Type01" value="����">
			<input type="hidden" name="RefTitle" value="<%=RefTitle%>">
			<input type="hidden" name="ParentSN" value="<%=ParentSN%>">
        </form></td>
      </tr>
    </table>
    <p>&nbsp;</p></td>
  </tr>
<!--#include virtual="/manage/footer.asp" -->
</table>
</body>
</html>
