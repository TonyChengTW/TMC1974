<%Option Explicit%>
<!-- #include virtual="/include/manage.asp" -->
<!-- #include virtual="/manage/checksecurity.asp" -->
<%
HasPermission3("news")
	'*******************************Login and Permission Check	******************************************************
	Response.Expires = 0
	'*******************************Request Variables from the form submit by itself**********************************
	Dim PghOrder,ParentSN,RefTitle
	if Request("strPghOrder") <> "" and isNull(Request("strPghOrder")) = false then
		PghOrder = split(Request("strPghOrder"),",")
		Call UpdateOrderSeq(PghOrder)
	end if
	ParentSN = filter_data_normal(Request("ParentSN"))
	RefTitle = filter_data_normal(Request("RefTitle"))
	'*******************************Object and Variable	for Load Data*************************************************
	Dim RS
	Set RS = GetDataByWhereString("category","*","where psn="&ParentSN &" and ctype='"&RefTitle&"' and status=1 order by osn")
	
	if RS.eof then PopMessage "Close","無可排序資料",""
	'*******************************Implement Select Control**********************************************************
	Dim wcOrder
	Set wcOrder = new SelectControl
	Set wcOrder.RS = RS
	wcOrder.SelTextField = "cname"
	wcOrder.SelValueField = "sn"
	wcOrder.SelectName = "osn"
	wcOrder.SelectSize = 10	'----------Decide By number of items
	
	
	'*******************************Update Order Sequence*************************************************************
	Sub UpdateOrderSeq(ByRef OrderItems)
		Dim USQL,i,OrderItem
		i = 1
		For Each OrderItem in OrderItems
			USQL = "Update category Set osn="&i&" where sn="&OrderItem
			'Response.write "USQL="&USQL&"<BR>"
			CONN.execute(USQL)
			i = i + 1
		Next
	End Sub
%>
<html>
<head>
<title>管理後端</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<link href="/manage/manage.css" rel="stylesheet" type="text/css">
<script>
function SetOrder(strOrder,obj,dir){
	var i = obj.selectedIndex;
	if(i>=0){
		if(dir=='up'){
			if(i==0){alert('碰頂');return false;}
			obj.options[i].swapNode(obj.options[i-1]);
		}
		if(dir=='down'){
			if(i==obj.options.length-1){alert('撞底');return false;}
			obj.options[i].swapNode(obj.options[i+1]);
		}
		var j;
		strOrder.value='';
		for(j=0;j<obj.options.length;j++){
			if(j==0)strOrder.value += obj.options[j].value; 
			else strOrder.value += ','+obj.options[j].value; 
		}
	}
	else alert('請先選擇要移動的選項');
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
	  <input name="Button" type="button" class="Button-Type02" onClick="SetOrder(document.form1.strPghOrder,document.form1.osn,'up')" value="▲">
      <input name="Button2" type="button" class="Button-Type02" onClick="SetOrder(document.form1.strPghOrder,document.form1.osn,'down')" value="▼">
	  </td>
    </tr>
    <tr align="center">
      <td colspan="2" class="TableColName">
	  <input type="button" name="Button3" value="更新排序" onClick="document.form1.submit();">      
      <input type="button" name="Button" value="關閉視窗" onClick="window.close();opener.location.reload();">
      <input name="strPghOrder" type="hidden" id="strPghOrder">      </td>
    </tr>
  </table>
</form>
</body>