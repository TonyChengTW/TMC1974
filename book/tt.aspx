<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="tt.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="~\FCKeditor\">
    </FCKeditorV2:FCKeditor>
    </form>
</body>
</html>
