<%@ Page Language="VB" AutoEventWireup="false" CodeFile="addForum.aspx.vb" Inherits="addForum" %>

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
     
     <h2 align="center">健言社四不：不談商業(廣告)、色情、宗教、政治<h2>
  
  <table border="1" cellpadding="0" cellspacing="0" style="font-size: 12pt; width: 100%;
            font-family: Times New Roman; background-color: #ffffcc">
            <tr>
                <td style="width: 110px; color:#black ; background-color:#F0F8FF; text-align: left">
                    <span>姓名</span></td>
                <td colspan="3" style="background-color: white; text-align: left">
                    <asp:TextBox ID="Txt_who" runat="server" Width="250px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                        ID="Requir_name" runat="server" ControlToValidate="Txt_who" ErrorMessage="請輸入姓名"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="Requir_msg" runat="server" ControlToValidate="Txt_msg"
                        ErrorMessage="請輸入內容"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 49px; color:#black; background-color:#F0F8FF; text-align: left">
                    <span>標題</span></td>
                <td colspan="3" style="background-color: white; text-align: left">
                    <asp:TextBox ID="Txt_subject" runat="server" MaxLength="30" Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Requir_subject" runat="server" ControlToValidate="Txt_subject"
                        ErrorMessage="請輸入標題不可超過三十個字"></asp:RequiredFieldValidator><span
                        style="color: #ff0066"></span></td>
            </tr>
            <tr>
                <td style="width: 49px; color: #black; background-color:#F0F8FF; text-align: left">
                    <span>表情</span></td>
                <td colspan="3" style="background-color: white; text-align: left">
                    <asp:Panel ID="Panel1" runat="server" BackColor="white" Height="57px" Width="489px">
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 49px; color: #black; background-color:#F0F8FF; text-align: left">
                    <span>內容<br />
                    </span>
                </td>
                <td colspan="3" rowspan="2" style="background-color: white; text-align: left">
                    <asp:TextBox ID="Txt_msg" runat="server" AutoCompleteType="Disabled" Height="300px"
                        TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td style="width: 49px; color: #black; background-color:#F0F8FF; text-align: left">
                    <span>郵件</span></td>
                <td colspan="3" style="background-color: white; text-align: left">
                    <asp:TextBox ID="Txt_email" runat="server" Width="400px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txt_email"
                        ErrorMessage="您的E-Mail格式不對" ValidationExpression="[\w]+@[\w]+\.(com|ent|edu|org)[\w\.]*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 49px; color: #black; background-color:#F0F8FF; text-align: left">
                    <span>電話</span></td>
                <td colspan="3" rowspan="2" style="background-color: white; text-align: left">
                    <asp:TextBox ID="Txt_tel" runat="server" Width="250px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txt_tel"
                        ErrorMessage="您輸入電話格式不對" ValidationExpression="[0][1-9]\d{7,8}"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td rowspan="1" style="width: 49px; color: #black; background-color:#F0F8FF; text-align: left">
                    網站</td>
                <td colspan="3" rowspan="1" style="background-color: white; text-align: left">
                    <asp:TextBox ID="Txt_web" runat="server" Width="397px"></asp:TextBox><asp:RegularExpressionValidator
                        ID="RegularExpressionValidator3" runat="server" ControlToValidate="Txt_web" ErrorMessage="您輸網址格式不對"
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td rowspan="1" style="width: 49px; color: #black; background-color:#F0F8FF; text-align: left; height: 26px;">
                </td>
                <td colspan="3" rowspan="1" style="background-color: white; text-align: center; height: 26px;">
                    <asp:Button ID="Button1" runat="server" OnClick="AddData" Text="送出" />
                    <asp:Button ID="Btn_Clear" runat="server" OnClick="Button2_Click" Text="清除" />
                    <asp:Button ID="Btn_Post" runat="server" CausesValidation="False" Text="回首頁" /></td>
            </tr>
        </table>

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