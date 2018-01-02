//變數Speed為設定捲軸的速度用 越小越快
var Speed = 20;
//接受setInterval所回傳的值
var timer;
//取得myDiv的參考用的變數
var myDiv = document.getElementById("myDiv");
//取得pic2的參考用的變數
var pic2 = document.getElementById("pic2");
//讓pic2的innerHTML等於pic1的innerHTML
pic2.innerHTML = document.getElementById("pic1").innerHTML;
//用來捲動myDiv捲軸用的主程式
function picMarquee() {
    //若pic2的寬小於myDiv的scrollLeft，表示捲軸已經過了第一行
    //所以讓Div的scrollLeft再回到原來的位置；反之 則繼續往右跑
    if (pic2.offsetWidth - myDiv.scrollLeft <= 0) {
        myDiv.scrollLeft = 0;
    } else {
        myDiv.scrollLeft++;
    }
}
//每Speed毫秒就執行一次pciMarquee()
timer = setInterval(picMarquee, Speed);
//當滑鼠在myDiv上時 就停止捲動
myDiv.onmouseover = function () {
    clearInterval(timer);
}
//當滑鼠離開myDiv上時 就繼續往右捲動
myDiv.onmouseout = function () {
    timer = setInterval(picMarquee, Speed);
}