<% Option Explicit %>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
'�v���޲z
HasPermission("news")
Dim sn,RS,img
Set img = new ImageControl
sn=filter_data_normal(Request("sn"))
if sn ="" then PopMessage "Back","�L�����!!",""
Set RS = GetDataByWhereString("[new]","*","where sn="&sn) 
if RS.eof then PopMessage "Back","�L�����!!",""
Dim pic1,pic2,pic3,nfile
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
		rt = isEmpty(form.title,'�п�J���D');
		if(rt==false)return rt;
		rt = isEmpty(form.startdate,'�п�ܤW�Z�ɶ�');
		if(rt==false)return rt;
		rt = isEmpty(form.enddate,'�п�ܤU�Z�ɶ�');
		if(rt==false)return rt;
		form.submit();
	}
	function forever(){
	    document.form1.startdate.value='2000/1/1';
		document.form1.enddate.value='2200/1/1';
	}
	function del(form){
		rt = confirm('�z�T�w�n�R���ܡH');
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
              <td width="56%"><p><font size="2"><a href="/manage/index.asp">�޲z�t��</a> &gt; <font color="#FF0000"></font> <font size="2"><a href="admin.asp">�̷s�����C��</a> &gt; <font color="#FF0000"></font> <font color="#FF0000"></font></font><font color="#FF0000">Detial</font></font></p></td>
              <td width="26%" align="right" class="TableColValue">Date�G</td>
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
                <td align="right" class="TableColName"><font class="Comment12font">*</font>���O�W��</td>
                <td class="TableColValue">
				<span class="Desc-Type01" id="cname1"><%if RS("category")<>"" then Response.write GatCategoryStr(RS("category"))%></span>
                <input name="Button32" type="button" class="Button-Type02" value="���" onClick="openRefCat_Picker('new','cname1','category');">
                <input name="category" type="hidden" id="category" value="<%=RS("category")%>">				
				</td>
              </tr>
              <tr>
                <td width="14%" align="right" class="TableColName"><font class="Comment12font">*</font>���D</td>
                <td width="86%" class="TableColValue"><input name="title" type="text" class="TextBox-Type01" id="title" value="<%=RS("title")%>" size="50" maxlength="200"></td>
              </tr>
              <tr>
                <td width="14%" align="right" class="TableColName">���}</td>
                <td width="86%" class="TableColValue"><input name="nfile" type="text" class="TextBox-Type01" id="nfile" value="<%=RS("nfile")%>" size="50" maxlength="200"></td>
              </tr>
<tr>
                <td width="14%" align="right" class="TableColName">pic���}</td>
                <td width="86%" class="TableColValue"><input name="content2" type="text" class="TextBox-Type01" id="content2" value="<%=RS("content2")%>" size="50" maxlength="200"></td>
              </tr>
              <tr>
                <td align="right" class="TableColName">�o�G���<BR>(�ƧǱ���1)</td>
                <td class="TableColValue"><input name="releasedate" type="text" class="TextBox-Type01" id="releasedate" value="<%=RS("releasedate")%>" size="20" maxlength="20" readonly="true" onClick="window.open('/include/date.asp?col=window.opener.document.all.releasedate','CalendaeWin','width=160,height=170')"></td>
              </tr>
              <tr>
                <td align="right" class="TableColName"><span class="Comment12font">*</span>�����W/�U�Z���</td>
                <td class="TableColValue"><input name="startdate" type="text" class="TextBox-Type01" id="startdate" value="<%=RS("startdate")%>" size="20" maxlength="20" readonly="true" onClick="window.open('/include/date.asp?col=window.opener.document.all.startdate','CalendaeWin','width=160,height=170')">
                  ��
                  <input name="enddate" type="text" class="TextBox-Type01" id="enddate" value="<%=RS("enddate")%>" size="20" maxlength="20" readonly="true" onClick="window.open('/include/date.asp?col=window.opener.document.all.enddate','CalendaeWin','width=160,height=170')">
			 <span onClick="forever();" onMouseOver="this.style.cursor='hand';" class="TableColValue">�û��W�Z</span> </td>
              </tr>
             <!-- <tr>
                <td align="right" class="TableColName">���n�Х�</td>
                <td class="TableColValue">
				<input name="hintpic" type="radio" value="no" <%=CheckData("no",cstr(RS("hintpic")),"checked")%>>�L
                <input name="hintpic" type="radio" value="new" <%=CheckData("new",cstr(RS("hintpic")),"checked")%>>NEW
                <input name="hintpic" type="radio" value="hot" <%=CheckData("hot",cstr(RS("hintpic")),"checked")%>>HOT</td>
              </tr>-->
              <tr>
                <td align="right" class="TableColName">����</td>
                <td class="TableColValue"><textarea name="content1" cols="80" rows="10"><%=Content_Filter(RS("content1"))%></textarea>
				<BR>�d�ҡG<BR>
				��r����y�k�G &lt;b&gt;����&lt;/b&gt;
				<BR>
				�t�}�����y�k�G &lt;a href=&quot;�e�����}&quot; target=&quot;_blank&quot;&gt;��ܤ�r&lt;/a&gt;
				<BR>
				 
				�୶���y�k�G &lt;a href=&quot;�e�����}&quot; &gt;��ܤ�r&lt;/a&gt;</td>
              </tr>
			  <!--<tr>
                <td align="right" class="TableColName">����1</td>
                <td class="TableColName"><input type="file" name="pic1">
				<%
				 pic1=RS("pic1")
				 if pic1 <> null or pic1 <> "" then
				%>
                <input name="delpic1" type="checkbox" id="delpic1" value="yes">
                �R�� 
                <%
						img.Name = pic1
						img.FillOrigin2
				end if
				%></td>
              </tr>
			  <tr>
                <td align="right" class="TableColName">����2</td>
                <td class="TableColName"><input type="file" name="pic2">
				<%
				 pic2=RS("pic2")
				 if pic2 <> null or pic2 <> "" then
				%>
                <input name="delpic2" type="checkbox" id="delpic2" value="yes">
                �R�� 
                <%
						img.Name = pic2
						img.FillOrigin2
				end if
				%></td>
              </tr>
              <tr>
                <td align="right" class="TableColName">����3</td>
                <td class="TableColName"><input type="file" name="pic3">
				<%
				 pic3=RS("pic3")
				 if pic3 <> null or pic3 <> "" then
				%>
                <input name="delpic3" type="checkbox" id="delpic3" value="yes">
                �R�� 
                <%
						img.Name = pic3
						img.FillOrigin2
				end if
				%></td>
              </tr>
               <tr>
                <td align="right" class="TableColName">�����ɮ�</td>
                <td class="TableColName"><input type="file" name="nfile">
				<%
				 nfile=RS("nfile")
				 if nfile <> null or nfile <> "" then
				%>
				<span onMouseOver="this.style.cursor='hand';" onClick="MM_openBrWindow('../../upload/<%=nfile%>','','scrollbars=yes,width=720,height=500')" class="TableColName">�w�������ɮ�</span>
                <input name="delnfile" type="checkbox" id="delnfile" value="yes">
                �R�� 
                <%
				end if
				%></td>
              </tr>-->
            </table>
          <br><input name="sn" type="hidden" value="<%=sn%>">
            <input name="Button2" type="button" class="Button-Type01" value="�ק�" onClick="datapost(this.form);">
			<input name="Button2" type="button" class="Button-Type01" value="�R��" onClick="del(this.form);">
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