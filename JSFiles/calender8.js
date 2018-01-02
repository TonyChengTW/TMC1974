var ax,ay
function sDrag(){
	ax = event.clientX - Layer1.style.posLeft;
	ay = event.clientY - Layer1.style.posTop;
}
function fDrag(){	
	Layer1.style.left=event.clientX-ax+'px';
	Layer1.style.top=event.clientY-ay+'px';
}
//產生萬年曆html程式
var one=''
var oneyear,onemonth
var monthday=new Array(12)
  monthday[0]=31;
  monthday[1]=28;
  monthday[2]=31;
  monthday[3]=30;
  monthday[4]=31;
  monthday[5]=30;
  monthday[6]=31;
  monthday[7]=31;
  monthday[8]=30;
  monthday[9]=31;
  monthday[10]=30;
  monthday[11]=31;
var monthname=new Array(12)
  monthname[0]='1'
  monthname[1]='2'
  monthname[2]='3'
  monthname[3]='4'
  monthname[4]='5'
  monthname[5]='6'
  monthname[6]='7'
  monthname[7]='8'
  monthname[8]='9'
  monthname[9]='10'
  monthname[10]='11'
  monthname[11]='12'
function check(yyyy,mm,iname,showname){
  
  if(yyyy !=null && mm !=null )
    {
     openning(yyyy,mm,iname,showname);
	} 
    else{
     var newdate=new Date();
	 var yyyy2 = newdate.getFullYear();
     var mm2= newdate.getMonth();
	 openning(yyyy2,mm2,iname,showname);
    }
}
//產生日曆主程式
function openning(yyyy,mm,iname,showname){
	//alert('document.all[iname].value='+document.all[iname].value);
   		//var olddate=new Date(document.all[iname].value);
		//var defday=olddate.getDate();
	//alert('defday='+defday);
   if(document.all[iname].value!='')
   		var olddate=new Date(document.all[iname].value);
   else
   {
   		var olddate=new Date();
   }
   var defday=olddate.getDate();
   var newdate=new Date(yyyy,mm,1);
   var weekday=newdate.getDay();
   var printnum=1;
   if(yyyy % 4==0 || yyyy % 100==0 || yyyy % 400==0)
   {
       monthday[1]=29; 
   }
	one+='<table  border="0" width="210" id="table1" bgcolor="#C0C0C0" cellspacing="1" cellpadding="3" style="font-size:9pt" id=cela>\r';
	one+='<tr><td colspan="7" bgcolor="#E8F7FD" width="210" align="center"><div align=center><font size=2>'+yyyy+'年'+monthname[mm]+'月</font></div><div align=right><font color="#FF0000" onMouseOver="this.style.cursor=\'hand\';" onclick=closecalender()>關閉</font></div></td></tr>\r';
	one+='<tr><td bgcolor="#FFFFFF" width=30 height=20 align=center><strong><font color=red size=2>日</font></strong></td>\r';
	one+='<td bgcolor="#FFFFFF" width=30 height=20 align=center><font color="#666666">一</font></td>\r';
	one+='<td bgcolor="#FFFFFF" width=30 height=20 align=center><font color="#666666">二</font></td>\r';
	one+='<td bgcolor="#FFFFFF" width=30 height=20 align=center><font color="#666666">三</font></td>\r';
	one+='<td bgcolor="#FFFFFF" width=30 height=20 align=center><font color="#666666">四</font></td>\r';
	one+='<td bgcolor="#FFFFFF" width=30 height=20 align=center><font color="#666666">五</font></td>\r';
	one+='<td bgcolor="#FFFFFF" width=30 height=20 align=center><font color=green size=2>六</font></td></tr>\r';
	for (j=0;j<6;j++)
	{
		if( printnum > monthday[mm])
			break;
			
		one+='<tr>\r';
		//補空白 Begin//
		for(i=0;i<=6;i++)
		{
			if( printnum > monthday[mm]){
				for (k=i;k<=6;k++)
				{one+='<td bgcolor="#FFFFFF" width=30 height=25>　</td>\r' ;}
				break;
		}

		if(j==0 && i< weekday)//補開始不列印日期的空格
		{		
			one+='<td bgcolor="#FFFFFF" width=30 height=25>　</td>';
		}
		else
		{
			if(printnum==defday){
				one+='<td bgcolor="#FFCC66" width=30 height=25 align=center onClick="returnvalue('+yyyy+','+mm+','+printnum+',\''+iname+'\');" onMouseOver="this.style.cursor=\'hand\';this.style.backgroundColor=\'#CCCCCC\'" onMouseOut="this.style.backgroundColor=\'#FFFFFF\';">';
			}else
			{
				one+='<td bgcolor="#FFFFFF" width=30 height=25 align=center onClick="returnvalue('+yyyy+','+mm+','+printnum+',\''+iname+'\');" onMouseOver="this.style.cursor=\'hand\';this.style.backgroundColor=\'#CCCCCC\'" onMouseOut="this.style.backgroundColor=\'#FFFFFF\';">';
			}		
			if(i==0)//星期日顏色為紅色
				{one+='<font color=red>';}
			if(i==6)//星期六顏色為綠色
				{one+='<font color=green>';}
				//iname變數因為字串在傳值時須用".."或\'..\'包住
				one+=printnum+'</font></td>\r';
				printnum=printnum+1;
			}   	  
		 }
		 one+='</tr>\r'
	}
	one+='<tr>\r'
	one+='<td bgcolor="#E8F7FD" width="210" align="center" colspan="7">\r'
	one+='<form name="datecform"><table border="0" width="100%" cellspacing="0" cellpadding="2" id="table3" style="font-size:9pt">\r'
	one+='<tr><td><font onMouseOver="this.style.cursor=\'hand\';" onclick=upmonth('+yyyy+','+mm+',"'+iname+'","'+showname+'");>上個月</font></td>\r'
	one+='<td align="right"><font onMouseOver="this.style.cursor=\'hand\';" onclick=nextmonth('+yyyy+','+mm+',"'+iname+'","'+showname+'");>下個月</font></td></tr>\r'
	one+='<tr><td>西元年：<input name="goyaer" size="4" maxlength="4"> '
	one+='<font onMouseOver="this.style.cursor=\'hand\';" onclick=if(document.datecform.goyaer.value!=\'\'){check(document.datecform.goyaer.value,'+mm+',"'+iname+'","'+showname+'")}>前往</font></td></tr>'	
	one+='</table></form></td>'
	one+='</tr>\r'
	one+='</table>'
	monthday[1]=28;
	//document.write(one);one='';
document.all[showname].innerHTML=one;one='';
}
//將月份數值減1及判斷是否跨年
function upmonth(yyyy,mm,iname,showname){
  mm = mm-1;
  if (mm < 0){
  mm=11;
  yyyy=yyyy-1;
  check(yyyy,mm,iname,showname);
  }
  else{check(yyyy,mm,iname,showname)}
}
//將月份數值加1及判斷是否跨年
function nextmonth(yyyy,mm,iname,showname){
	mm = mm + 1;
  if (mm == 12){
  mm=0;
  yyyy=yyyy+1;
  check(yyyy,mm,iname,showname);
  }
  else{check(yyyy,mm,iname,showname)}
}
function returnvalue(yyyy,mm,day,iname){
	ans=yyyy+'/'+monthname[mm]+'/'+day;
	document.all[iname].value=ans;
	document.all['Layer1'].style.display='none';
}
function getdaystring(txt){
	alert('txt='+txt.toString.length);
	var temp;
	if(txt.toString.length==1)
		txt = '0'+txt.toString();
	//alert('txt='+txt);
	return txt;
}
function opencalender(){
	document.all['Layer1'].style.display='';
}
function closecalender(){
	document.all['Layer1'].style.display='none';
}
function getlocation(){
	//alert('document.body.scrollTop='+document.body.scrollTop+',event.clientY='+event.clientY);
	Layer1.style.left=event.clientX+'px';Layer1.style.top=event.clientY+document.body.scrollTop+'px';
}