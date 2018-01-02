var num_of_album=1;
var user_id="tmc1974119";
var album_id= new Array()
album_id[1]="6337946"
var album_name= new Array()
album_name[1]=" 第124期幹部訓練及籌備會"
var num=num_of_album-1;
var random=Math.round(num*Math.random())+1;
document.write("<center>");
document.write('<iframe frameborder="0" marginheight="0" marginwidth="0" height="142" src="http://photo.xuite.net/' + user_id + '/' + album_id[random] + '.show?0/" scrolling="no" width="118" allowtransparency="true"  Target="_blank"></iframe>');
document.write("<br/>" + album_name[random] + "</center>");


