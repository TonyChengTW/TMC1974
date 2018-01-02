function doFBlikeButton() {
    document.getElementById('myFBlikeArea').innerHTML = "<iframe src='http://www.facebook.com/plugins/like.php?href="
   + top.location.toString()
 + "&layout=standard&show_faces=true&width=200&action=like&font=arial&colorscheme=light&height=80'"
 + " scrolling='no' frameborder='0' style='border:none; overflow:hidden; width:200px; height:80px;' allowTransparency='true'></iframe>";
}
doFBlikeButton();