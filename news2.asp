<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/pages.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>台北市健言社-口才訓練課程,口才訓練班,演講技巧,演講技巧訓練,人際關係</title>
<!-- InstanceEndEditable -->
<meta name="keywords" content="公眾演講,聆聽溝通,判斷包容,領導才能,人際關係,擔當回饋,口才訓練,TM訓練,描述能力,聯想能力,邏輯推理訓練,語言表達訓練,腦力激盪訓練,語調能力訓練,一分鐘自我推銷術,奧瑞岡辯論法,如何講笑話,談判能力訓練,溝通能力訓練,方言之美,訓練口才,口才訓練課程,口才訓練班,演講技巧,演講技巧訓練">

<link href="css/basic.css" rel="stylesheet" type="text/css" />
<link href="js/nivoslider/banner_slider.css" rel="stylesheet" type="text/css" />
<link href="js/nivoslider/themes/default/default.css" rel="stylesheet" type="text/css" />

<!-- 大圖輪撥 -->

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/easySlider1.7.js"></script>
<script type="text/javascript">
		$(document).ready(function(){	
			$("#slider").easySlider({
				continuous: true,
				url: true
			});
		});	
	</script>
<!-- 選單 -->
<script type='text/javascript' src='js/superfish.js?ver=1.4.8'></script>
  <script type="text/javascript">
  	// initialise plugins
		jQuery(function(){
			// main navigation init
			jQuery('ul.sf-menu').superfish({
				delay:       1000, 		// one second delay on mouseout 
				animation:   {opacity:'show',height:'show'}, // fade-in and slide-down animation 
				speed:       'normal',  // faster animation speed 
				autoArrows:  true,   // generation of arrow mark-up (for submenu) 
				dropShadows: false   // drop shadows (for submenu)
			});
			
			// prettyphoto init
			jQuery("a[rel^='prettyPhoto']").prettyPhoto({
				animation_speed:'normal',
				slideshow:5000,
				autoplay_slideshow: false
			});
			
			// easyTooltip init
			jQuery("a.tooltip").easyTooltip();
			
			jQuery('#widget-footer .grid_3, #widget-footer .grid_4').equalHeightColumns();
			
			
			jQuery('.post_list.services li:nth-child(odd)').addClass("odd");
			jQuery('.post_list.services li:nth-child(2)').addClass("second-child");
			jQuery('.recent-posts.team li:nth-child(3n)').addClass("nomargin");
			
			
		});
		
		// Init for audiojs
		audiojs.events.ready(function() {
			var as = audiojs.createAll();
		});
  </script>
  <!-- InstanceBeginEditable name="head" -->
  <!-- InstanceEndEditable -->
</head>

<body class="bg">
<div id="header">
<div class="topframe">
<div class="slogan"> 口才靠訓練，學習是關鍵，歡迎加入口才訓練行列！台北市健言社，讓您展開不一樣的人生！<img src="images/toopbar_icon.png" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader
(src='images/sample.png', sizingMethod='scale',enabled=FALSE);" width="48" height="26" /></div>
    <a href="index.asp" style="float:left"><img src="images/logo.png" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader
(src='images/sample.png', sizingMethod='scale',enabled=FALSE);" alt="台北市健言社" width="380" /></a>
<div style=" float:right; margin-top:80px; margin-right:20px;">
<form style="margin:0;" method="get" name="searchform" action="http://www.google.com/search" target="_blank" class="searchbox">

<font color="#FF0000"><input type="hidden" name="sitesearch" value="http://www.tmc1974.com/" />
</font>

<input alt="search" type="text" style="border:0;width:140px; margin-top:5px; margin-left:15px" name="as_q" size="20" value="請輸入關鍵字..." />

<input style="width:40px; border:0;cursor:pointer;" type="submit" value="" class="but"/>

</form>

</div><!--/搜尋 -->
</div>

 <!--/主選單 開始 -->
  <div id="topnavBg">
    <div class="navframe">
      <ul id="topnav" class="sf-menu">
        <li class="menu-item1"><a href="aboutus.html"></a>
          <ul class="sub-menu">
<li id="menu-item-40"><a href="about/societies.html">社團架構</a></li>
            <li id="menu-item-40"><a href="about/council.html">理監事會</a></li>
            <li id="menu-item-40"><a href="about/core_member.html">當期幹部</a></li>
            <li id="menu-item-40"><a href="about/leaders.html"><span style=" letter-spacing:-1px;">歷任理事長及社長</span></a></li>
            <li id="menu-item-40"><a href="about/faculty.html">師資介紹</a></li>
          </ul>
          <!--/sub-menu -->
        </li>
        <!--/本社簡介 -->
        <li class="menu-item2"><a href="news.asp"></a>
<ul class="sub-menu">
<li id="menu-item-40"> <a href="news.asp">課程公告</a></li>
<li id="menu-item-40"> <a href="event.asp">活動公告</a></li>
<li id="menu-item-40"><a href="gallery3.asp">活動剪影</a></li>
          </ul>
        </li>
        <!--/最新消息 -->
        <li class="menu-item3"><a href="calendar.html"></a>
          <ul class="sub-menu">
            <li id="menu-item-40"> <a href="calendar.html">會內會課程</a></li>
            <li id="menu-item-40"> <a href="calendar/training_teacher.html">講師培訓課程</a></li>
            <li id="menu-item-40"><a href="calendar/OGA.html">奧瑞岡辯論課程</a></li>
            <li id="menu-item-40"><a href="calendar/50planning.html">50種課程規劃</a></li>
          </ul>
        </li>
        <!--/課程一欄表 -->
        <li class="menu-item4"><a href="courseInfo.html"></a>
          <ul class="sub-menu">
            <li id="menu-item-40"> <a href="courseInfo.html">會內會流程</a></li>
            <li id="menu-item-40"> <a href="gallery2.asp">會內會照片</a></li>
            <li id="menu-item-40"> <a href="demotm.html">T.M.訓練影片</a></li>
          </ul>
        </li>
        <!--/週四會內會 -->
        <li class="menu-item5"><a href="trains.html"></a>
          <ul class="sub-menu">
            <li id="menu-item-40"> <a href="trains.html">T.M.訓練</a></li>
            <li id="menu-item-40"> <a href="response/leader_trains.html">領導統御訓練</a></li>
            <li id="menu-item-40"> <a href="response/member_response.html">社友學習心得</a></li>
            <li id="menu-item-40"> <a href="response/download.html">課程講義</a></li>
          </ul>
        </li>
        <!--/學習資源 -->
        <li class="menu-item6"><a href="join.html"></a>
          <ul class="sub-menu">
            <li id="menu-item-40"> <a href="join.html">加入健言社</a></li>
            <li id="menu-item-40"> <a href="QA.html">Q&A</a></li>
          </ul>
        </li>
        <!--/加入健言社 -->
        <li class="menu-item7"><a href="/book/board.aspx" target="_blank"></a> </li>
        <!--/留言版-->
      </ul>
      <div style=" padding:8px 20px; text-align:right"> <a href="http://www.youtube.com/user/tmc1974m" target="_blank"><img src="images/icon_yt.png" style="background-image: none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='./images/test.png', sizingMethod='scale');"/></a> <a href="https://www.facebook.com/tmc1974" target="_blank"><img src="images/icon_fb.png" style="background-image: none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='./images/test.png', sizingMethod='scale');"/></a></div>
    </div>
  </div>
  <!--/TopnavBg 主選單END-->
  
 <!-- InstanceBeginEditable name="EditRegion3" --> 
  

<!--/內容編輯開始-->
<%
Set conn = Server.CreateObject("ADODB.Connection")
DBPath = Server.MapPath("\tmc2013.mdb")
conn.Open "driver={Microsoft Access Driver (*.mdb)};dbq=" & DBPath
 Set rs = Server.CreateObject("ADODB.Recordset")

sql=" select top 5 * from new where category =7 and (startdate<=now()) And (enddate>=now()) order by CDate(releasedate) desc,cdate desc"
 rs.Open Sql,conn
%>
<div class="maintop">
<div class="breadcrumb">
<a href="index.html">Home</a>   >    <span>課程公告</span>
</div>
</div>
<div class="clear"></div>
<div id="mainframe">

<div class="page_title">課程公告</div>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" style=" padding-left:10px;">
  <tr>
<td align="left" valign="top">

<!-- 新聞版塊開始-->
<% while not rs.eof   %>
<% sn=rs(0) %>
<% aa=rs(2) %>
<% ab=rs(3)%>
<% ac=rs(4)%>
<table width="95%" border="0" cellspacing="0" cellpadding="0" class="newslist">
<tr><td width="195" rowspan="3" align="left" valign="top"><a href="news/news_info.asp?sn=<% response.write sn %>"><img src="update/news/list_195x150_1.jpg" width="195" height="150" /></a></td>
<td><h3><a href="news/news_info.asp?sn=<% response.write sn %>"><% response.write aa%></a></h3></td></tr><tr><td>
<p><span>【課程公告】<% response.write  aa%></span></td>
</tr><tr><td valign="top">
<p><% response.write  ab %><br />
<% response.write  ac %></p></td>
</tr></table><!-- 2013 08 17-->
<% rs.movenext %>
<% wend %>






    <td align="left" valign="top" class="new_Rightnav">
    <table border="0" align="right" cellpadding="0" cellspacing="0">
  <tr>
<td class="titbg">課程月份</td>
  </tr>
  <tr><td>
<ul id=menu>
<li><a href="#">2013 年 8 月份課程( 10 )</a></li>
<li><a href="#">2013 年 7 月份課程( 10 )</a></li>
<li><a href="#">2013 年 6 月份課程( 10 )</a></li>
<li><a href="#">2013 年 5 月份課程( 10 )</a></li>
      </ul></td>
  </tr>
  </table>

</td>
  </tr>
  </table>


<br />
<br />

<div class="clear"></div>


</div>

<!--/mainframe內容END-->
<!-- InstanceEndEditable -->
<div id="footer"><!-- InstanceBeginEditable name="FooterBg" -->
  <div class="footerframe" style="background:url(file:///D|/Case/20130418_台北市健言社/tmc1974_web/images/footer_bg_02.jpg) center no-repeat"> 
<!-- InstanceEndEditable -->
<a href="index.asp" style="float:left"><img src="images/Toast_footer.png" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader
(src='images/sample.png', sizingMethod='scale',enabled=FALSE);" alt="台北市健言社"/></a>
  <p> E-mail：<a href="mailto: toastmaster1974@gmail.com">toastmaster1974@gmail.com</a></b><br />
      會社地址：台北市中山區中山北路2段59巷21號2樓D室<br />
      <span style="color:#957343">Copyright © 2013 TOAST MASTERS CLUB . All Rights Reserved.</span></p>
  </div>
</div>
</body>
<!-- InstanceEnd --></html>
