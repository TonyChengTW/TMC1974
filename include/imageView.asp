<%@LANGUAGE="VBSCRIPT" CODEPAGE="950"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�j���s��</title>
</head>
<body onLoad="self.resizeTo(document.all.image.width+30,document.all.image.height+50);">
<div align="left">
<img id="image" src="<%=request("file")%>" onClick="self.close();" onMouseOver="this.style.cursor='hand';" alt="���ƹ�������������">
</div>
</body>
</html>
