﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="boardnew.aspx.vb" Inherits="Test" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

Protected Sub Btn_Add_Click(ByVal sender As Object, ByVal e As System.EventArgs)

End Sub

    Protected Sub Btn2_Add_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="css/styleNew.css" type="text/css" media="all" />
<script src="js/jquery-1.4.2.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.js" type="text/javascript"></script>
<script src="js/js-func.js" type="text/javascript">function IFRAME1_onclick() {

}

</script>
<!--[if IE 6]>
<link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" />
<script src="js/png-fix.js" type="text/javascript"></script>
<![endif]-->
</head>
<body>
<form id="form1" runat="server">
<!-- START PAGE SOURCE -->
<div id="header" style="left: 0px; top: 0px">
  <div class="shell ">
    <h1 id="logo" class="notext" style="width: 303px; height: 65px">
       </h1>
    <div id="navigation">
      <ul>
        <li><a href="indexnew.html" class="active">本社簡介</a></li>
         <li><a href="#">最新消息</a>
             <li><a href="#">訓練課程</a>
          <div class="dd-holder">
            <div class="dd-t"></div>
            <div class="dd">
              <ul>
                <li><a href="#">Sub Level 1</a></li>
                <li><a href="#">Sub Level 1</a></li>
                <li><a href="#">Sub Level 1</a></li>
                <li><a href="#">Sub Level 1</a></li>
              </ul>
            </div>
            <div class="dd-b"></div>
          </div>
        </li>
        <li><a href="#">留言板</a></li>
        <li><a href="#">常見問題</a></li>
        <li><a href="#">連絡我們</a></li>
      </ul>
    </div>
  </div>
</div>
<table width="940" border="0" align=center  >
 <tr>
    <td colspan="2"> <div> <asp:Label ID="Label1" runat="server" Text="累計人數(2009/10/26)"></asp:Label>
        <asp:Image ID="Image1" runat="server" />
        <asp:Image ID="Image2" runat="server" />
        <asp:Image ID="Image3" runat="server" />
        <asp:Image ID="Image4" runat="server" />
        <asp:Image ID="Image5" runat="server" />
        <asp:Image ID="Image6" runat="server" />
        <asp:Image ID="Image7" runat="server" />
        <asp:Image ID="Image8" runat="server" />
        <asp:Image ID="Image9" runat="server" />
        <asp:Image ID="Image10" runat="server" />
            <asp:Label ID="Label2" runat="server" Text="昨日人數"></asp:Label>
            <asp:Image ID="Image11" runat="server" />
            <asp:Image ID="Image12" runat="server" />
            <asp:Image ID="Image13" runat="server" />
            <asp:Label ID="Label3" runat="server" Text="今日人數"></asp:Label>
            <asp:Image ID="Image14" runat="server" />
            <asp:Image ID="Image15" runat="server" />
            <asp:Image ID="Image16" runat="server" />
            <asp:Label ID="Labe14" runat="server" Text="現在線上人數:"></asp:Label>
            <asp:Image ID="Image17" runat="server" />
            <asp:Image ID="Image18" runat="server" />
        </div>
  </tr>
  <tr>
    <td colspan="2" >搜尋姓名<asp:TextBox ID="Txt_name" runat="server"></asp:TextBox>
                    <asp:TextBox ID="Txt_subject" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="搜尋請按我" />&nbsp;
                    <asp:Button ID="Btn_clearsubject" runat="server" Text="清除搜尋" /><asp:Button ID="Btn_Add" runat="server" Text="新增主題" OnClick="Btn_Add_Click" />
                     <asp:Button ID="Btn2_Add" runat="server" Text="多媒體留言" OnClick="Btn2_Add_Click" />  
        <asp:Label ID="Label21" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label22" runat="server" Text="Label" Visible="False"></asp:Label></td>
  </tr>
  <tr>
    <td width="656" rowspan="2" >   <asp:AccessDataSource ID="ADS_Insertboard" runat="server" 
            DataFile="~/App_Data/Tmc.mdb" SelectCommand="SELECT         COUNT(*) AS Expr1&#13;&#10;FROM             talk&#13;&#10;WHERE         (dcreate >= #9/12/2010#)"></asp:AccessDataSource>
    <asp:AccessDataSource ID="ADS_Reboard" runat="server" 
            DataFile="~/App_Data/Tmc.mdb" 
            
            SelectCommand="SELECT COUNT(*) AS Expr1 FROM talkRe WHERE (dcreate >= #14/5/2011#)">
    </asp:AccessDataSource>
     <asp:AccessDataSource ID="ADS_boradcount" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT         count (*)&#13;&#10;FROM             talk&#13;&#10;WHERE         (dcreate > #14/5/2011#)">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ADS_totle" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT         2000 - COUNT(*) AS Expr1&#13;&#10;FROM             talk&#13;&#10;WHERE         (dcreate >= #14/5/2011#)">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT * FROM [talk] WHERE (([who] LIKE '%' + ? + '%') AND ([subject] LIKE '%' + ? + '%')) ORDER BY [top] DESC, [newdcreate] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="Txt_name" DefaultValue="%" Name="?" PropertyName="Text" />
                <asp:ControlParameter ControlID="Txt_subject" DefaultValue="%" Name="?" PropertyName="Text" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="uid"
            DataSourceID="AccessDataSource1" Width="656px" AllowPaging="True" CellPadding="3" 

GridLines="Horizontal" PageSize="50" ShowFooter="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:BoundField DataField="who" HeaderText="姓名" SortExpression="who" >
                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="uid" DataNavigateUrlFormatString="Reforum.aspx?uid={0}"
                    DataTextField="subject" HeaderText="標題">
                    <ItemStyle HorizontalAlign="Left" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="newdcreate" DataFormatString="{0:g}" HeaderText="最後回應"  SortExpression="newdcreate" />
                <asp:BoundField DataField="hits" HeaderText="點閱" SortExpression="hits" />
                <asp:BoundField DataField="re" HeaderText="回覆" SortExpression="re" />
            </Columns>
            <PagerSettings Position="TopAndBottom" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView><asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT * FROM [talk] WHERE (([who] LIKE '%' + ? + '%') AND ([subject] LIKE '%' + ? + '%')) ORDER BY [top] DESC, [newdcreate] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="Txt_name" DefaultValue="%" Name="?" PropertyName="Text" />
                <asp:ControlParameter ControlID="Txt_subject" DefaultValue="%" Name="?" PropertyName="Text" />
            </SelectParameters>
        </asp:AccessDataSource>
        &nbsp;
        
        </td>
       <td valign="top" height="60" ><iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2F%25E5%258F%25B0%25E5%258C%2597%25E5%25B8%2582%25E5%2581%25A5%25E8%25A8%2580%25E7%25A4%25BE%2F205558406154076&amp;width=284&amp;colorscheme=light&amp;show_faces=true&amp;border_color&amp;stream=true&amp;header=true&amp;height=590" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:284px; height:590px;" allowTransparency="true" id="IFRAME1" onclick="return IFRAME1_onclick()"><iframe src="//www.facebook.com/plugins/activity.php?site=www.tmc1974.com&amp;width=240&amp;height=500&amp;header=false&amp;colorscheme=light&amp;linktarget=_blank&amp;border_color=%23ffffff&amp;font&amp;recommendations=true" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:240px; height:500px;" allowTransparency="true"></iframe> </td>
      
   </tr>
  <tr>
    <td valign="top"height=90%></td>
  </tr>

</table>
    <asp:Label ID="Label20" runat="server" Text="Label" Visible="False"></asp:Label>
   

    </form>
</body>
</html>
