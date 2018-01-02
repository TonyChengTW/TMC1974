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
	else areaname = '�п��';
	return areaname;
}
var AryCityMenu = new Array('�п��', '�x�_��', '�򶩥�', '�x�_��', '�y����', '�s�˥�', '�s�˿�', '��鿤', '�]�߿�', '�x����', '�x����', '���ƿ�', '�n�뿤', '�Ÿq��', '�Ÿq��', '���L��', '�O�n��' ,'�O�n��', '������', '������', '���', '�̪F��', '�O�F��', '�Ὤ��', '������', '�s����', '�n���Ѯq', '��L�a��');
var AryArea1 = new Array('�п��','100 ������', '103 �j�P��', '104 ���s��', '105 �Q�s��',  '106 �j�w��',  '108 �U�ذ�',  '110 �H�q��',  '111 �h�L��',  '112 �_���',  '114 �����',  '115 �n���',  '116 ��s��');
var AryArea2 = new Array('�п��','200 ���R��',  '201 �H�q��',  '202 ������',  '203 ���s��',  '204 �w�ְ�',  '205 �x�x��',  '206 �C����');
var AryArea3 = new Array('�п��','207 �U���m',  '208 ���s�m',  '220 �O����',  '221 ���',  '222 �`�|�m',  '223 ����m',  '224 �����',  '226 ���˶m',  '227 ���˶m',  '228 �^�d�m',  '231 �s����',  '232 �W�L�m',  '233 �Q�Ӷm',  '234 �éM��',  '235 ���M��',  '236 �g����',  '237 �T�l��',  '238 ��L��',  '239 �a�q��',  '241 �T����',  '242 �s����',  '243 ���s�m',  '244 �L�f�m',  '247 Ī�w��',  '248 ���Ѷm',  '249 �K���m',  '251 �H����',  '252 �T�۶m',  '253 �۪��m');
var AryArea4 = new Array('�п��','260 �y����',  '261 �Y����',  '262 �G�˶m',  '263 ����m',  '264 ���s�m',  '265 ù�F��',  '266 �T�P�m',  '267 �j�P�m',  '268 �����m',  '269 �V�s�m',  '270 Ĭ�D��',  '272 �n�D�m');
var AryArea5 = new Array('�п��','300 �s�˥�',  '300 �F��',  '300 �n��',  '300 ���',  '300 �_��');
var AryArea6 = new Array('�п��','302 �˥_��',  '303 ��f�m',  '304 �s�׶m',  '305 �s�H�m',  '306 ������',  '307 �|�L�m',  '308 �_�s�m',  '310 �˪F��',  '311 ���p�m',  '312 ��s�m',  '313 �y�۶m',  '314 �_�H�m',  '315 �o�ܶm');
var AryArea7 = new Array('�п��','320 ���c��',  '324 ����',  '325 �s��m',  '326 ������',  '327 �s�ζm',  '328 �[���m',  '330 ��饫',  '333 �t�s�m',  '334 �K�w��',  '335 �j����',  '336 �_���m',  '337 �j��m',  '338 Ī�˶m');
var AryArea8 = new Array('�п��','350 �˫n��',  '351 �Y����',  '352 �T�W�m',  '353 �n�ܶm',  '354 ���m',  '356 ���s��',  '357 �q�]��',  '358 �b����',  '360 �]�ߥ�',  '361 �y���m',  '362 �Y�ζm',  '363 ���]�m',  '364 �j��m',  '365 ���w�m',  '366 ���r�m',  '367 �T�q�m',  '368 ���m',  '369 ������');
var AryArea9 = new Array('�п��','400 ����',  '401 �F��',  '402 �n��',  '403 ���',  '404 �_��',  '406 �_�ٰ�', '407 ��ٰ�',  '408 �n�ٰ�');
var AryArea10 = new Array('�п��','411 �ӥ���',  '412 �j����',  '413 ���p�m',  '414 �Q��m',  '420 �׭쥫',  '421 �Z���m',  '422 �۩��m',  '423 �F����',  '424 �M���m',  '426 �s���m',  '427 ��l�m',  '428 �j���m',  '429 �����m',  '432 �j�{�m',  '433 �F����',  '434 �s���m',  '435 �����',  '436 �M����',  '437 �j����',  '438 �~�H�m',  '439 �j�w�m');
var AryArea11 = new Array('�п��','500 ���ƥ�',  '502 ���m',  '503 ��¶m',  '504 �q���m',  '505 ������',  '506 �ֿ��m',  '507 �u��m',  '508 �M����',  '509 ����m',  '510 ���L��',  '511 ���Y�m',  '512 �ùt�m',  '513 �H�߶m',  '514 �˴���',  '515 �j���m',  '516 �H�Q�m',  '520 �Ф���',  '521 �_����',  '522 �Ч��m',  '523 ���Y�m',  '524 �ˬw�m',  '525 �˶�m',  '526 �G�L��',  '527 �j���m',  '528 �ڭb�m',  '530 �G���m');
var AryArea12 = new Array('�п��','540 �n�륫',  '541 ���d�m',  '542 �����',  '544 ��m�m',  '545 �H����',  '546 ���R�m',  '551 �W���m',  '552 ������',  '553 �����m',  '555 �����m',  '556 �H�q�m',  '557 �ˤs��',  '558 �����m');
var AryArea13 = new Array('�п��','600 �Ÿq��');
var AryArea14 = new Array('�п��','602 �f���m',  '603 ���s�m',  '604 �˱T�m',  '605 �����s�m', '606 ���H�m',  '607 �j�H�m',  '608 ���W�m',  '611 ����m',  '612 �ӫO��',  '613 ���l��',  '614 �F�۶m',  '615 ���}�m',  '616 �s��m',  '621 �����m',  '622 �j�L��',  '623 �ˤf�m',  '624 �q�˶m',  '625 ���U��');
var AryArea15 = new Array('�п��','630 ��n��',  '631 �j��m',  '632 �����',  '633 �g�w��',  '634 �ǩ��m',  '635 �F�նm',  '636 �O��m',  '637 �[�I�m',  '638 ���d�m',  '640 �椻��',  '643 �L���m',  '646 �j�|�m',  '647 �l��m',  '648 ������',  '649 �G�[�m',  '651 �_����',  '652 ���L�m',  '653 �f��m',  '654 �|��m',  '655 �����m');
var AryArea16 = new Array('�п��','700 ����',  '701 �F��',  '702 �n��',  '703 ���',  '704 �_��',  '708 �w����', '709 �w�n��');
var AryArea17 = new Array('�п��','710 �ñd��',  '711 �k���m',  '712 �s����',  '713 ����m',  '714 �ɤ��m',  '715 ����m',  '716 �n�ƶm',  '717 ���w�m',  '718 ���q�m',  '719 �s�T�m',  '720 �x�жm',  '721 �¨���',  '722 �Ψ���',  '723 ���m',  '724 �C�Ѷm',  '725 �N�x�m',  '726 �ǥ���',  '727 �_���m',  '730 �s�祫',  '731 ����m',  '732 �ժe��',  '733 �F�s�m',  '734 ���Ҷm',  '735 �U��m',  '736 �h��m',  '737 �Q����',  '741 ������',  '742 �j���m',  '743 �s�W�m',  '744 �s���m',  '745 �w�w�m');
var AryArea18 = new Array('�п��','800 �s����',  '801 �e����',  '802 �d����',  '803 �Q�L��',  '804 ���s��',  '805 �X�z��',  '806 �e���',  '807 �T����',  '811 �����',  '812 �p���',  '813 �����');
var AryArea19 = new Array('�п��','814 ���Z�m',  '815 �j���m',  '820 ���s��',  '821 ���˶m',  '822 �����m',  '823 �мd�m',  '824 �P�_�m',  '825 ���Y�m',  '826 ��x�m',  '827 �����m',  '828 �æw�m',  '829 �򤺶m',  '830 ��s��',  '831 �j�d�m',  '832 �L��m',  '833 ���Q�m',  '840 �j��m',  '842 �X�s��',  '843 ���@��',  '844 ���t�m',  '845 �����m',  '846 ���L�m',  '847 �ҥP�m',  '848 �緽�m',  '849 �T���m',  '851 �Z�L�m',  '852 �X�_�m');
var AryArea20 = new Array('�п��','880 ������',  '881 �����m',  '882 ��w�m',  '883 �C���m',  '884 �ըF�m',  '885 ���m');
var AryArea21 = new Array('�п��','900 �̪F��',  '901 �T�a�m',  '902 ���O�m',  '903 ���a�m',  '904 �E�p�m',  '905 ����m',  '906 ����m',  '907 �Q�H�m',  '908 ���v�m',  '909 �ﬥ�m',  '911 �˥жm',  '912 ���H�m',  '913 �U���m',  '920 ��{��',  '921 ���Z�m',  '922 �Ӹq�m',  '923 �U�r�m',  '924 �O���m',  '925 �s��m',  '926 �n�{�m',  '927 �L��m',  '928 �F����',  '929 �[�y�m',  '931 �ΥV�m',  '932 �s��m',  '940 �D�d�m',  '941 �D�s�m',  '942 �K��m',  '943 ��l�m',  '944 �����m',  '945 �d���m',  '946 �ڬK��',  '947 ���w�m');
var AryArea22 = new Array('�п��','950 �O�F��',  '951 ��q�m',  '952 �����m',  '953 �����m',  '954 ���n�m',  '955 �����m',  '956 ���s��',  '957 ���ݶm',  '958 ���W�m',  '959 �F�e�m',  '961 ���\��',  '962 ���ضm',  '963 �ӳ¨��m', '964 ���p�m',  '965 �j�Z�m',  '966 �F���m');
var AryArea23 = new Array('�п��','970 �Ὤ��',  '971 �s���m',  '972 �q�L�m',  '973 �N�w�m',  '974 ���׶m',  '975 ��L��',  '976 ���_�m',  '977 ���ضm',  '978 ���J�m',  '979 �U�a�m',  '981 �ɨ���',  '982 ���˶m',  '983 �I���m');
var AryArea24 = new Array('�п��','890 ���F��',  '891 ������',  '892 ����m',  '893 ������',  '894 �P���m',  '896 �Q���m');
var AryArea25 = new Array('�п��','209 �n��m',  '210 �_��m',  '211 �����m',  '212 �F�޶m');
var AryArea26 = new Array('�п��','817 �F�F',  '819 �n�F',  '290 �����x�C��');
var AryArea27 = new Array('000 ���ο��');
var AryArea28 = new Array('�п��');

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
	if ((showValue == '��L�a') || (showValue == '��L�a��'))
		strSelect = i - 1;
	if (showValue == '�п��')
	{
		strFormName.options[0] = new Option('�п��');
		strSelect = 0;
	}
	strFormName.selectedIndex = strSelect ;
}

function show_area_menu(FormName, CityName, showValue)
{
	objName = eval(FormName);
	objName.options.length = 1;
	var areaName='' //�m,��,��,��,��
	var strSelect = 0;
	var AryName = new Array();

	if (CityName == '�x�_��')
		AryName = eval('AryArea1');

	if (CityName == '�򶩥�')
		AryName = eval('AryArea2');

	if (CityName == '�x�_��')
		AryName = eval('AryArea3');

	if (CityName == '�y����')
		AryName = eval('AryArea4');

	if (CityName == '�s�˥�')
		AryName = eval('AryArea5');

	if (CityName == '�s�˿�')
		AryName = eval('AryArea6');

	if (CityName == '��鿤')
		AryName = eval('AryArea7');

	if (CityName == '�]�߿�')
		AryName = eval('AryArea8');

	if (CityName == '�x����')
		AryName = eval('AryArea9');

	if (CityName == '�x����')
		AryName = eval('AryArea10');

	if (CityName == '���ƿ�')
		AryName = eval('AryArea11');

	if (CityName == '�n�뿤')
		AryName = eval('AryArea12');

	if (CityName == '�Ÿq��')
		AryName = eval('AryArea13');

	if (CityName == '�Ÿq��')
		AryName = eval('AryArea14');

	if (CityName == '���L��')
		AryName = eval('AryArea15');

	if (CityName == '�O�n��')
		AryName = eval('AryArea16');

	if (CityName == '�O�n��')
		AryName = eval('AryArea17');

	if (CityName == '������')
		AryName = eval('AryArea18');

	if (CityName == '������')
		AryName = eval('AryArea19');

	if (CityName == '���')
		AryName = eval('AryArea20');

	if (CityName == '�̪F��')
		AryName = eval('AryArea21');

	if (CityName == '�O�F��')
		AryName = eval('AryArea22');

	if (CityName == '�Ὤ��')
		AryName = eval('AryArea23');

	if (CityName == '������')
		AryName = eval('AryArea24');

	if (CityName == '�s����')
		AryName = eval('AryArea25');

	if (CityName == '�n���Ѯq')
		AryName = eval('AryArea26');

	if ((CityName == '��L�a') || (CityName == '��L�a��'))
		AryName = eval('AryArea27');

	if (CityName == '�п��')
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