<!-- 分頁與show提示-->
function PageList(flag,form){
	
		switch(flag){
			
			case "order":
				var orderby,orderseq;
				orderby = document.getElementById(arguments[2]);
				orderseq = document.getElementById(arguments[3]);
				orderseq.value = (orderby.value==arguments[4])?orderseq.value=='DESC'?'ASC':'DESC':orderseq.value;
				orderby.value = arguments[4];
				break;
			case "pgchange":
				var PSize;
				PSize = document.getElementById(arguments[2]);
				PSize.value = arguments[3];
			case "pgsize":
				var PSize;
				PSize = document.getElementById(arguments[2]);
				PSize.value = arguments[3];
			case "search":
			case "detail":
			//default :
		}		
		form.submit();
}
var wOBJ = window.createPopup();
function pop(width,height,msg){
	var popOBJ = wOBJ.document.body;
	//popOBJ.style.border = "solid blue 2px";
	popOBJ.style.filter = "progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=Pink, EndColorStr=#FFFFFF);"
	popOBJ.innerHTML = msg;
	wOBJ.show(15,15,width,height,event.srcElement);
}