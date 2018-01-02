function getZip(area)
{
	var tmp = area.indexOf(' ',0);
	var zip;
	if(tmp != -1)zip = area.substring(0,tmp);
	else zip = 0;
	return zip;
}
function getArea(area)
{
	var tmp = area.indexOf(' ',0);
	var areaname;
	if(tmp != -1)areaname = area.substring(tmp+1,area.length);
	else areaname = '請選擇';
	return areaname;
}
var AryCityMenu = new Array('請選擇', '台北市', '基隆市', '台北縣', '宜蘭縣', '新竹市', '新竹縣', '桃園縣', '苗栗縣', '台中市', '台中縣', '彰化縣', '南投縣', '嘉義市', '嘉義縣', '雲林縣', '臺南市' ,'臺南縣', '高雄市', '高雄縣', '澎湖縣', '屏東縣', '臺東縣', '花蓮縣', '金門縣', '連江縣', '南海諸島', '其他地區');
var AryArea1 = new Array('請選擇','100 中正區', '103 大同區', '104 中山區', '105 松山區',  '106 大安區',  '108 萬華區',  '110 信義區',  '111 士林區',  '112 北投區',  '114 內湖區',  '115 南港區',  '116 文山區');
var AryArea2 = new Array('請選擇','200 仁愛區',  '201 信義區',  '202 中正區',  '203 中山區',  '204 安樂區',  '205 暖暖區',  '206 七堵區');
var AryArea3 = new Array('請選擇','207 萬里鄉',  '208 金山鄉',  '220 板橋市',  '221 汐止市',  '222 深坑鄉',  '223 石碇鄉',  '224 瑞芳鎮',  '226 平溪鄉',  '227 雙溪鄉',  '228 貢寮鄉',  '231 新店市',  '232 坪林鄉',  '233 烏來鄉',  '234 永和市',  '235 中和市',  '236 土城市',  '237 三峽鎮',  '238 樹林市',  '239 鶯歌鎮',  '241 三重市',  '242 新莊市',  '243 泰山鄉',  '244 林口鄉',  '247 蘆洲市',  '248 五股鄉',  '249 八里鄉',  '251 淡水鎮',  '252 三芝鄉',  '253 石門鄉');
var AryArea4 = new Array('請選擇','260 宜蘭市',  '261 頭城鎮',  '262 礁溪鄉',  '263 壯圍鄉',  '264 員山鄉',  '265 羅東鎮',  '266 三星鄉',  '267 大同鄉',  '268 五結鄉',  '269 冬山鄉',  '270 蘇澳鎮',  '272 南澳鄉');
var AryArea5 = new Array('請選擇','300 新竹市',  '300 東區',  '300 南區',  '300 西區',  '300 北區');
var AryArea6 = new Array('請選擇','302 竹北市',  '303 湖口鄉',  '304 新豐鄉',  '305 新埔鄉',  '306 關西鎮',  '307 芎林鄉',  '308 寶山鄉',  '310 竹東鎮',  '311 五峰鄉',  '312 橫山鄉',  '313 尖石鄉',  '314 北埔鄉',  '315 峨眉鄉');
var AryArea7 = new Array('請選擇','320 中壢市',  '324 平鎮市',  '325 龍潭鄉',  '326 楊梅鎮',  '327 新屋鄉',  '328 觀音鄉',  '330 桃園市',  '333 龜山鄉',  '334 八德市',  '335 大溪鎮',  '336 復興鄉',  '337 大園鄉',  '338 蘆竹鄉');
var AryArea8 = new Array('請選擇','350 竹南鎮',  '351 頭份鎮',  '352 三灣鄉',  '353 南庄鄉',  '354 獅潭鄉',  '356 後龍鎮',  '357 通霄鎮',  '358 苑裡鎮',  '360 苗栗市',  '361 造橋鄉',  '362 頭屋鄉',  '363 公館鄉',  '364 大湖鄉',  '365 泰安鄉',  '366 銅鑼鄉',  '367 三義鄉',  '368 西湖鄉',  '369 卓蘭鎮');
var AryArea9 = new Array('請選擇','400 中區',  '401 東區',  '402 南區',  '403 西區',  '404 北區',  '406 北屯區', '407 西屯區',  '408 南屯區');
var AryArea10 = new Array('請選擇','411 太平市',  '412 大里市',  '413 霧峰鄉',  '414 烏日鄉',  '420 豐原市',  '421 后里鄉',  '422 石岡鄉',  '423 東勢鎮',  '424 和平鄉',  '426 新社鄉',  '427 潭子鄉',  '428 大雅鄉',  '429 神岡鄉',  '432 大肚鄉',  '433 沙鹿鎮',  '434 龍井鄉',  '435 梧棲鎮',  '436 清水鎮',  '437 大甲鎮',  '438 外埔鄉',  '439 大安鄉');
var AryArea11 = new Array('請選擇','500 彰化市',  '502 芬園鄉',  '503 花壇鄉',  '504 秀水鄉',  '505 鹿港鎮',  '506 福興鄉',  '507 線西鄉',  '508 和美鎮',  '509 伸港鄉',  '510 員林鎮',  '511 社頭鄉',  '512 永靖鄉',  '513 埔心鄉',  '514 溪湖鎮',  '515 大村鄉',  '516 埔鹽鄉',  '520 田中鎮',  '521 北斗鎮',  '522 田尾鄉',  '523 埤頭鄉',  '524 溪洲鄉',  '525 竹塘鄉',  '526 二林鎮',  '527 大城鄉',  '528 芳苑鄉',  '530 二水鄉');
var AryArea12 = new Array('請選擇','540 南投市',  '541 中寮鄉',  '542 草屯鎮',  '544 國姓鄉',  '545 埔里鎮',  '546 仁愛鄉',  '551 名間鄉',  '552 集集鎮',  '553 水里鄉',  '555 魚池鄉',  '556 信義鄉',  '557 竹山鎮',  '558 鹿谷鄉');
var AryArea13 = new Array('請選擇','600 嘉義市');
var AryArea14 = new Array('請選擇','602 番路鄉',  '603 梅山鄉',  '604 竹崎鄉',  '605 阿里山鄉', '606 中埔鄉',  '607 大埔鄉',  '608 水上鄉',  '611 鹿草鄉',  '612 太保市',  '613 朴子市',  '614 東石鄉',  '615 六腳鄉',  '616 新港鄉',  '621 民雄鄉',  '622 大林鎮',  '623 溪口鄉',  '624 義竹鄉',  '625 布袋鎮');
var AryArea15 = new Array('請選擇','630 斗南鎮',  '631 大埤鄉',  '632 虎尾鎮',  '633 土庫鎮',  '634 褒忠鄉',  '635 東勢鄉',  '636 臺西鄉',  '637 崙背鄉',  '638 麥寮鄉',  '640 斗六市',  '643 林內鄉',  '646 古坑鄉',  '647 莿桐鄉',  '648 西螺鎮',  '649 二崙鄉',  '651 北港鎮',  '652 水林鄉',  '653 口湖鄉',  '654 四湖鄉',  '655 元長鄉');
var AryArea16 = new Array('請選擇','700 中區',  '701 東區',  '702 南區',  '703 西區',  '704 北區',  '708 安平區', '709 安南區');
var AryArea17 = new Array('請選擇','710 永康市',  '711 歸仁鄉',  '712 新化鎮',  '713 左鎮鄉',  '714 玉井鄉',  '715 楠西鄉',  '716 南化鄉',  '717 仁德鄉',  '718 關廟鄉',  '719 龍崎鄉',  '720 官田鄉',  '721 麻豆鎮',  '722 佳里鎮',  '723 西港鄉',  '724 七股鄉',  '725 將軍鄉',  '726 學甲鎮',  '727 北門鄉',  '730 新營市',  '731 後壁鄉',  '732 白河鎮',  '733 東山鄉',  '734 六甲鄉',  '735 下營鄉',  '736 柳營鄉',  '737 鹽水鎮',  '741 善化鎮',  '742 大內鄉',  '743 山上鄉',  '744 新市鄉',  '745 安定鄉');
var AryArea18 = new Array('請選擇','800 新興區',  '801 前金區',  '802 苓雅區',  '803 鹽埕區',  '804 鼓山區',  '805 旗津區',  '806 前鎮區',  '807 三民區',  '811 楠梓區',  '812 小港區',  '813 左營區');
var AryArea19 = new Array('請選擇','814 仁武鄉',  '815 大社鄉',  '820 岡山鎮',  '821 路竹鄉',  '822 阿蓮鄉',  '823 田寮鄉',  '824 燕巢鄉',  '825 橋頭鄉',  '826 梓官鄉',  '827 彌陀鄉',  '828 永安鄉',  '829 湖內鄉',  '830 鳳山市',  '831 大寮鄉',  '832 林園鄉',  '833 鳥松鄉',  '840 大樹鄉',  '842 旗山鎮',  '843 美濃鎮',  '844 六龜鄉',  '845 內門鄉',  '846 杉林鄉',  '847 甲仙鄉',  '848 桃源鄉',  '849 三民鄉',  '851 茂林鄉',  '852 茄萣鄉');
var AryArea20 = new Array('請選擇','880 馬公市',  '881 西嶼鄉',  '882 望安鄉',  '883 七美鄉',  '884 白沙鄉',  '885 湖西鄉');
var AryArea21 = new Array('請選擇','900 屏東市',  '901 三地鄉',  '902 霧臺鄉',  '903 瑪家鄉',  '904 九如鄉',  '905 里港鄉',  '906 高樹鄉',  '907 鹽埔鄉',  '908 長治鄉',  '909 麟洛鄉',  '911 竹田鄉',  '912 內埔鄉',  '913 萬丹鄉',  '920 潮州鎮',  '921 泰武鄉',  '922 來義鄉',  '923 萬巒鄉',  '924 嵌頂鄉',  '925 新埤鄉',  '926 南州鄉',  '927 林邊鄉',  '928 東港鎮',  '929 琉球鄉',  '931 佳冬鄉',  '932 新園鄉',  '940 枋寮鄉',  '941 枋山鄉',  '942 春日鄉',  '943 獅子鄉',  '944 車城鄉',  '945 牡丹鄉',  '946 �甯K鎮',  '947 滿洲鄉');
var AryArea22 = new Array('請選擇','950 臺東市',  '951 綠島鄉',  '952 蘭嶼鄉',  '953 延平鄉',  '954 卑南鄉',  '955 鹿野鄉',  '956 關山鎮',  '957 海端鄉',  '958 池上鄉',  '959 東河鄉',  '961 成功鎮',  '962 長濱鄉',  '963 太麻里鄉', '964 金峰鄉',  '965 大武鄉',  '966 達仁鄉');
var AryArea23 = new Array('請選擇','970 花蓮市',  '971 新城鄉',  '972 秀林鄉',  '973 吉安鄉',  '974 壽豐鄉',  '975 鳳林鎮',  '976 光復鄉',  '977 豐濱鄉',  '978 瑞穗鄉',  '979 萬榮鄉',  '981 玉里鎮',  '982 卓溪鄉',  '983 富里鄉');
var AryArea24 = new Array('請選擇','890 金沙鎮',  '891 金湖鎮',  '892 金寧鄉',  '893 金城鎮',  '894 烈嶼鄉',  '896 烏坵鄉');
var AryArea25 = new Array('請選擇','209 南竿鄉',  '210 北竿鄉',  '211 莒光鄉',  '212 東引鄉');
var AryArea26 = new Array('請選擇','817 東沙',  '819 南沙',  '290 釣魚台列嶼');
var AryArea27 = new Array('000 不用選擇');
var AryArea28 = new Array('請選擇');

function show_city_menu(FormName, showValue)
{
	var strSelect = 0;
	strFormName = eval(FormName);
	for (i = 0; i < AryCityMenu.length; i ++)
	{
		if (AryCityMenu[i] == showValue)
			strSelect = i;
		strFormName.options[i] = new Option(AryCityMenu[i], AryCityMenu[i]);
	}
	if ((showValue == '其他地') || (showValue == '其他地區'))
		strSelect = i - 1;
	if (showValue == '請選擇')
	{
		strFormName.options[0] = new Option('請選擇');
		strSelect = 0;
	}
	strFormName.selectedIndex = strSelect ;
}

function show_area_menu(FormName, CityName, showValue)
{
	objName = eval(FormName);
	objName.options.length = 1;
	var areaName='' //鄉,鎮,縣,市,區
	var strSelect = 0;
	var AryName = new Array();

	if (CityName == '台北市')
		AryName = eval('AryArea1');

	if (CityName == '基隆市')
		AryName = eval('AryArea2');

	if (CityName == '台北縣')
		AryName = eval('AryArea3');

	if (CityName == '宜蘭縣')
		AryName = eval('AryArea4');

	if (CityName == '新竹市')
		AryName = eval('AryArea5');

	if (CityName == '新竹縣')
		AryName = eval('AryArea6');

	if (CityName == '桃園縣')
		AryName = eval('AryArea7');

	if (CityName == '苗栗縣')
		AryName = eval('AryArea8');

	if (CityName == '台中市')
		AryName = eval('AryArea9');

	if (CityName == '台中縣')
		AryName = eval('AryArea10');

	if (CityName == '彰化縣')
		AryName = eval('AryArea11');

	if (CityName == '南投縣')
		AryName = eval('AryArea12');

	if (CityName == '嘉義市')
		AryName = eval('AryArea13');

	if (CityName == '嘉義縣')
		AryName = eval('AryArea14');

	if (CityName == '雲林縣')
		AryName = eval('AryArea15');

	if (CityName == '臺南市')
		AryName = eval('AryArea16');

	if (CityName == '臺南縣')
		AryName = eval('AryArea17');

	if (CityName == '高雄市')
		AryName = eval('AryArea18');

	if (CityName == '高雄縣')
		AryName = eval('AryArea19');

	if (CityName == '澎湖縣')
		AryName = eval('AryArea20');

	if (CityName == '屏東縣')
		AryName = eval('AryArea21');

	if (CityName == '臺東縣')
		AryName = eval('AryArea22');

	if (CityName == '花蓮縣')
		AryName = eval('AryArea23');

	if (CityName == '金門縣')
		AryName = eval('AryArea24');

	if (CityName == '連江縣')
		AryName = eval('AryArea25');

	if (CityName == '南海諸島')
		AryName = eval('AryArea26');

	if ((CityName == '其他地') || (CityName == '其他地區'))
		AryName = eval('AryArea27');

	if (CityName == '請選擇')
		AryName = eval('AryArea28');

	for (i = 0; i < AryName.length; i ++)
	{
		areaName = getArea(AryName[i])
		if (AryName[i].indexOf(showValue) >= 0)
			strSelect = i;
		objName.options[i] = new Option(areaName, AryName[i]);
	}
	objName.selectedIndex = strSelect ;
}