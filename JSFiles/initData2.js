function isDateEmpty(objYear, objMonth, objDay){

    if (objYear.options[objYear.selectedIndex].value==0 && objMonth.options[objMonth.selectedIndex].value==0 && objDay.options[objDay.selectedIndex].value==0){
		return true;
	}
	return false;
}


//	<select Name="uADY" onChange="ResetDays(this, this.form.uADM, this.form.uADD);"> 
function ResetDays(objYear, objMonth, objDay) 
{ // reset the day option according to the month been selected 
    // for Netscape, value cannot be retrieved from the select object directly 
    var oDay 
    oDay=objDay.options[objDay.selectedIndex].value; 
    var xtmp=new Date(objMonth.selectedIndex+1+'/0/'+objYear.options[objYear.selectedIndex].value); 
    var tmp=xtmp.getDate();
    objDay.length=tmp + 1; 
    for (i=1; i<=tmp; i++) 
    { 
    objDay.options[i].value=i; 
    objDay.options[i].text=i; 
    } 
    if (oDay > tmp)    objDay.selectedIndex = tmp; 

    if (objYear.options[objYear.selectedIndex].value==0){
		objMonth.selectedIndex=0;
		objDay.selectedIndex=0;
	}

    if (objYear.options[objYear.selectedIndex].value!=0 && objMonth.options[objMonth.selectedIndex].value==0 && objDay.options[objDay.selectedIndex].value==0){
		objMonth.selectedIndex=1;
		objDay.selectedIndex=1;
	}
	

    if (objMonth.options[objMonth.selectedIndex].value==0 && objYear.options[objYear.selectedIndex].value!=0 && objDay.options[objDay.selectedIndex].value!=0){
		objYear.selectedIndex=0;
		objDay.selectedIndex=0;
	}
	

    if (objDay.options[objDay.selectedIndex].value==0 && objYear.options[objYear.selectedIndex].value!=0 && objMonth.options[objMonth.selectedIndex].value!=0){
		objYear.selectedIndex=0;
		objMonth.selectedIndex=0;
	}
} 
     
     
function ListOption(start_val, end_val, inc, default_val,type_val,name) 
{ // looping for options  ListOption
   
	document.writeln('<option value=0></option>'); 
    for (var i = start_val; i <= end_val; i += inc) 
    { 
    
    if (i == default_val) 
		temp=' selected'; 
    else 
		temp=''; 
    var j = type_val;
    var k	
    if (j == 1)
          k = i-1911;
    else 
         	k =  i;
	if (name == k)	
         document.writeln('<option value=' + k + temp + ' selected>' + k + '</option>'); 
     else
         document.writeln('<option value=' + k + temp + '>' + k + '</option>');
    } 
}
