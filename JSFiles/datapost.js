function isDate(year, month, day){  
   var dateStr;  
   if (!month || !day) {  
       if (month == '') {  
           dateStr = year + "/1/1"  
       }else if (day == '') {  
           dateStr = year + '/' + month + '/1';  
       }  
       else {  
           dateStr = year.replace(/[.-]/g, '/');  
       }  
   }  
   else {  
       dateStr = year + '/' + month + '/' + day;  
   }  
   dateStr = dateStr.replace(/\/0+/g, '/');  
  
   var accDate = new Date(dateStr);  
   var tempDate = accDate.getFullYear() + "/";  
   tempDate += (accDate.getMonth() + 1) + "/";  
   tempDate += accDate.getDate();  
  
   if (dateStr == tempDate) {  
       return true;  
   }  
   return false;  
} 
function chkObjIndex(sobj,sourceindex)  //�d�X�������P�W����index
	{
		var index=0;
		var obj=document.getElementsByName(sobj);
		var iobj;
		for(i=0;i<obj.length;i++)
		{
			if(obj[i].sourceIndex==sourceindex){index=i;}
		}
		return index;
	}
function getSelectString(oSelect){// get all options value to string seprated by "," in the select object
	var i;
	var strSelect = '';
	if(oSelect.length<0)return false;
	for(i=0;i<oSelect.length;i++){
		if(i==0)strSelect = oSelect.options[i].value;
		else strSelect += ','+oSelect.options[i].value;
	}
	return strSelect;
}
function chkRepeatSelection(value,oSelect){//check if the value is repeated in the select object
		var i;
		for(i=0;i<oSelect.length;i++){
			if(value==oSelect.options[i].value){alert('�z�w�g���"'+oSelect.options[i].text+'"�F');return false;}
		}
		return true;
}
function RadioCheck(objname,msg)
{
  var oname = document.getElementsByName(objname);//�j�M���W�٪��Ҧ��Ȩæs��oname�}�C��
  var vtype1 = oname.length;
  var vtype=0;
  for (var i=0;i<vtype1;i++)
     {
     if(oname[i].checked == true){
        vtype = vtype + 1;
        }
     }
  if(vtype == 0 ){alert(msg);return false;}
	else
     return true;
}
function isSelected(obj){ //�P�_Select Control�O�_��������
	if(obj.selectedIndex<0){
		if(arguments.length>1) alert(arguments[1]);
		return false;
	}
	else return true;
}
function isEmpty(obj,msg)
{
	if(obj.value=='' || obj.value==null)
	{
		if(msg!='')
		{
			alert(msg);
			if(obj.type!='hidden')obj.focus();
		}
	return false;
	}
	else 
	{return true;}
}

function isEmail(obj,msg)
{
	if (obj.value!="" && (obj.value.indexOf("@") == "-1" || obj.value.indexOf(".") == "-1" ))
		{alert(msg);obj.value="";obj.focus();return false}
	else return true;
}

function TwoValuesEmpty(obj1,obj2,msg){  //---  ������O���S����� ---
	if(obj1.value == "" && obj2.value == ""){alert(msg);obj1.focus();return false;}
}

function OnlyOne(obj1,obj2,msg){  //---  �u���ܤ@�����O ---
	if(obj1.value !="" && obj2.value != ""){alert(msg);obj1.focus();return false;}
}

function OverWrite(obj,Num,msg){   //--- �P�_��J�r�� ---
   if (obj.value!="" && obj.value.length < Num){alert(msg);obj.focus();return false;}
}

function isTheSame(obj1,obj2,msg)
{
	if(obj1.value==obj2.value){return true;}
	else {alert(msg);obj1.focus();return false;}
}

function isInt(obj,msg)   //---- �P�O�Ʀr -----
{
    var len = obj.value.length;
    var No_Number = 0;
	for( i = 0; i < len; i++ )
	{
	   strValue = obj.value;
	   intAscii = strValue.charCodeAt(i);
       if(intAscii>57 || intAscii<48)	
          {
		  	alert(msg);//obj.value='';
		  	obj.focus();
			return false;
		  }
    }
	return true;
}
function isStrEng(obj,msg)   //---- �P�O�Ĥ@�Ӧ줸�O�_���p�g�^��
{
var intAscii
intAscii = obj.value.charCodeAt(0)
  if(intAscii< 123 && intAscii > 96)
    return true;
  else 
	  {alert(msg);//obj.value='';
	   obj.focus();obj.select();
	   return false;
	  }
}
function isEnglish(obj,msg)   //---- �P�O�O�_���p�g�^��μƦr��'_'-----
{
    var len = obj.value.length;
    var No_Number = 0;
	for( i = 0; i < len; i++ )
	{
	  strValue = obj.value;
	  intAscii = strValue.charCodeAt(i);
	if((intAscii< 123 && intAscii > 96) || (intAscii<57 && intAscii>48))
	  return true;
	else 
	  {alert(msg);//obj.value='';
	   obj.focus();obj.select();
	   return false;
	  }
   }
}function isChinese(obj,msg)  //---- �P�O����r 
{
	var index = obj.value.length;   
    countE_Ur=0;
    for( i = 0; i < index; i++ )
    {
      strValue=obj.value;
      intAscii = strValue.charCodeAt(i); 
      if( intAscii>=32 && intAscii<=255)	
      	{alert(msg);//obj.value='';
		obj.focus();return false;}
	}
}

function isZero(obj,msg)
{
	if(obj.value==0)
		{alert(msg);return false;}
}

//---------------�����Ҧr���ˬd
function ids() {
  this.A=1;this.B=0;this.C=9;this.D=8;this.E=7;
  this.F=6;this.G=5;this.H=4;this.J=3;this.K=2;
  this.L=2;this.M=1;this.N=0;this.P=9;this.Q=8;
  this.R=7;this.S=6;this.T=5;this.U=4;this.V=3;
  this.X=3;this.Y=2;this.W=1;this.Z=0;this.I=9;this.O=8;
}

function isNationalId(obj)
{
	var id=new ids;
	if (obj.value=='')
	{
	    alert('�п�J�z�������Ҧr��!!');obj.focus();return false;}
    	else if (!obj.value=='')
		{
     		if (obj.value.length != 10) 
			{alert("�����Ҧr���榡����");obj.focus(); obj.select();return false;}
		}
        obj.value=(obj.value.charAt(0)).toUpperCase()+obj.value.substring(1,10);
        var cs=id[obj.value.charAt(0)];
        for (var i=1;i<10;i++)
		{
                var c=obj.value.charAt(i);
                cs=cs+c*(9-i);
                if (c<"0" || c>"9")
				{
                	alert("�����Ҧr���榡����");
	                obj.focus();
					obj.select();
    	            return(false);
                }
        }
        cs=cs+c*1;
        if ((cs % 10) != 0) 
		{
             alert("�����Ҧr���ˬd�X����");
             obj.focus();
			 obj.select();
             return(false);	
		}
		else return true;
}
//-------------------------------------�����Ҧr���ˬd