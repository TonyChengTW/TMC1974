<%@ Page Language="VB" AutoEventWireup="false" CodeFile="boardnew.aspx.vb" Inherits="Test" MaintainScrollPositionOnPostback="true" %>

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

<link rel="stylesheet" href="css/styleNew2.css" type="text/css" media="all" />
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
<!-- START PAGE SOURCE -->
<div id="header">
  <div class="shell">
    <h1 id="logo" class="notext"><a href="#">PlainPlan - Keep your website simple</a></h1>
    <div id="navigation">
    
      <ul>
        <li><a href="#" class="active">本社簡介</a></li>
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
        <li><a href="boardnew.aspx">留言板</a></li>
        <li><a href="#">常見問題</a></li>
        <li><a href="#">連絡我們</a></li>
      </ul>
    </div>
  </div>
</div>





<div id="slider">
  <div class="shell">
   
    <div class="slider-right">
      <div class="slider-content">
     
        <asp:Label ID="Label1" runat="server" Text="累計人數(2009/10/26)"></asp:Label>
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
  <p>     
搜尋姓名<asp:TextBox ID="Txt_name" runat="server"></asp:TextBox>
                    <asp:TextBox ID="Txt_subject" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="搜尋請按我" />&nbsp;
                    <asp:Button ID="Btn_clearsubject" runat="server" Text="清除搜尋" /><asp:Button ID="Btn_Add" runat="server" Text="新增主題" OnClick="Btn_Add_Click" />
                     <asp:Button ID="Btn2_Add" runat="server" Text="多媒體留言" OnClick="Btn2_Add_Click" />  </p>
 <asp:Label ID="Label20" runat="server" Text="Label" Visible="False"></asp:Label>        
<asp:Label ID="Label21" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label22" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT * FROM [talk] WHERE ([top]=0)  ORDER BY [top] DESC, [newdcreate] DESC">
          
        </asp:AccessDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="uid"
            DataSourceID="AccessDataSource1" Width="100%" AllowPaging="True" CellPadding="4" ForeColor="#333333" 
GridLines="None" PageSize="50" ShowFooter="True">
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
            <PagerSettings PageButtonCount="10" Position="TopAndBottom" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>



      </div>
    </div>

 <div class="slider-left">
      <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<div class="fb-like-box" data-href="http://www.facebook.com/pages/%E5%8F%B0%E5%8C%97%E5%B8%82%E5%81%A5%E8%A8%80%E7%A4%BE/205558406154076" data-width="210" data-show-faces="true" data-stream="true" data-header="true"></div>
    

  </div>
</div>







<!-- END PAGE SOURCE -->
 </form>
</body>
</html>