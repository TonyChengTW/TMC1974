<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission3("news")
	'*******************************Login and Permission Check	******************************************************
	Response.Expires = 0
	'*******************************Request Variables from the form submit by itself**********************************
	Dim PghOrder,ParentSN,RefTitle
	ParentSN = filter_data_normal(Request("ParentSN"))
	'if ParentSN="" then ParentSN = filter_data_normal(Request.Form("ParentSN"))
	RefTitle = filter_data_normal(Request("RefTitle"))	
	if Request("strPghOrder") <> "" and isNull(Request("strPghOrder")) = false then
		PghOrder = split(Request("strPghOrder"),",")
		Call UpdateOrderSeq(PghOrder)
	end if

	
	'Response.Write "ParentSN="&ParentSN&"<BR>"
	'Response.end
	'*******************************Object and Variable	for Load Data*************************************************
	Dim RS
	'Set RS = GetDataByWhereString("new","sn,case category when 0 then '�s�D�ᵶ�G'+title+'(�o������G'+releasedate+')' when 1 then '���n���i�G'+title+'(�o������G'+releasedate+')' when 2 then '�s�i�s���G'+title+'(�o������G'+releasedate+')' when 3 then '�ӫ~�T���G'+title+'(�o������G'+releasedate+')'  end as title","order by osn")
	Set RS = GetDataByWhereString("v_new2","sn,cname+'�G'+title+'(�o������G'+releasedate+')'  as title","where category="& ParentSN &" order by osn")
	if RS.eof then PopMessage "Close","�L�i�ƧǸ��",""
	'*******************************Implement Select Control**********************************************************
	Dim wcOrder
	Set wcOrder = new SelectControl
	Set wcOrder.RS = RS
	wcOrder.SelTextField = "title"
	wcOrder.SelValueField = "sn"
	wcOrder.SelectName = "osn"
	wcOrder.SelectSize = 20	'----------Decide By number of items
	

	'*******************************Update Order Sequence*************************************************************
	Sub UpdateOrderSeq(ByRef OrderItems)
		Dim USQL,i,OrderItem
		i = 1
		For Each OrderItem in OrderItems
			USQL = "Update new Set osn="&i&" where category="& ParentSN &" and sn="& OrderItem
			'Response.write "USQL="&USQL&"<BR>"
			'Response.end
			CONN.execute(USQL)
			i = i + 1
		Next
	End Sub
%>
<html>
<head>
<title>�޲z���</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<link href="/manage/manage.css" rel="stylesheet" type="text/css">
<script>
function SetOrder(strOrder,obj,dir){
	var i = obj.selectedIndex;
	if(i>=0){
		if(dir=='up'){
			if(i==0){alert('�I��');return false;}
			obj.options[i].swapNode(obj.options[i-1]);
		}
		if(dir=='down'){
			if(i==obj.options.length-1){alert('����');return false;}
			obj.options[i].swapNode(obj.options[i+1]);
		}
		var j;
		strOrder.value='';
		for(j=0;j<obj.options.length;j++){
			if(j==0)strOrder.value += obj.options[j].value; 
			else strOrder.value += ','+obj.options[j].value; 
		}
	}
	else alert('�Х���ܭn���ʪ��ﶵ');
}
</script>
</head>
<body onBlur="document.focus();">
<form name="form1" method="post" action="">
  <table width="100%"  border="1" cellspacing="0">
    <tr align="center">
      <td colspan="2" class="TableHeader">&nbsp;</td>
    </tr>
    <tr>
      <td width="96%" align="center"><%=wcOrder.Fill%></td>
      <td width="4%">
	  <input name="Button" type="button" class="Button-Type02" onClick="SetOrder(document.form1.strPghOrder,document.form1.osn,'up')" value="��">
      <input name="Button2" type="button" class="Button-Type02" onClick="SetOrder(document.form1.strPghOrder,document.form1.osn,'down')" value="��">
	  </td>
    </tr>
    <tr align="center">
      <td colspan="2" class="TableColName">
	  <input type="button" name="Button3" value="��s�Ƨ�" onClick="document.form1.submit();">      
      <input type="button" name="Button" value="��������" onClick="window.close();opener.location.reload();">
      <input name="strPghOrder" type="hidden" id="strPghOrder">
	  <input name="ParentSN" type="hidden" id="ParentSN" value="<%=ParentSN%>">
	        </td>
    </tr>
  </table>
</form>
</body>