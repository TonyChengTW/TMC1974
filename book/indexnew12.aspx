<%@ Page Language="VB" AutoEventWireup="false" CodeFile="reforum.aspx.vb" Inherits="_Default" %>

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
  
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="uid" DataSourceID="AccessDataSource1" Width="80%">
            <EditItemTemplate>
                uid:
                <asp:Label ID="uidLabel1" runat="server" Text='<%# Eval("uid") %>'></asp:Label><br />
               subject:
                <asp:TextBox ID="main_subjectTextBox" runat="server" Text='<%# Bind("subject") %>'>
                </asp:TextBox><br />
                msg:
                <asp:TextBox ID="main_contentTextBox" runat="server" Text='<%# Bind("msg") %>'>
                </asp:TextBox><br />
                dcreate:
                <asp:TextBox ID="main_timeTextBox" runat="server" Text='<%# Bind("dcreate") %>'>
                </asp:TextBox><br />
               who:
                <asp:TextBox ID="main_nameTextBox" runat="server" Text='<%# Bind("who") %>'>
                </asp:TextBox><br />
                email:
                <asp:TextBox ID="main_emailTextBox" runat="server" Text='<%# Bind("email") %>'>
                </asp:TextBox><br />
                url:
                <asp:TextBox ID="main_urlTextBox" runat="server" Text='<%# Bind("url") %>'>
                </asp:TextBox><br />
               tel:
                <asp:TextBox ID="main_telTextBox" runat="server" Text='<%# Bind("tel") %>'>
                </asp:TextBox><br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="更新">
                </asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="取消">
                </asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                subject:
                <asp:TextBox ID="main_subjectTextBox" runat="server" Text='<%# Bind("subject") %>'>
                </asp:TextBox><br />
                msg:
                <asp:TextBox ID="main_contentTextBox" runat="server" Text='<%# Bind("msg") %>'>
                </asp:TextBox><br />
                dcreate:
                <asp:TextBox ID="main_timeTextBox" runat="server" Text='<%# Bind("dcreate") %>'>
                </asp:TextBox><br />
               who:
                <asp:TextBox ID="main_nameTextBox" runat="server" Text='<%# Bind("who") %>'>
                </asp:TextBox><br />
                email:
                <asp:TextBox ID="main_emailTextBox" runat="server" Text='<%# Bind("email") %>'>
                </asp:TextBox><br />
                url:
                <asp:TextBox ID="main_urlTextBox" runat="server" Text='<%# Bind("url") %>'>
                </asp:TextBox><br />
                tel:
                <asp:TextBox ID="main_telTextBox" runat="server" Text='<%# Bind("tel") %>'>
                </asp:TextBox><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="插入">
                </asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="取消">
                </asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                <table border="1" cellspacing="0" style="width: 100%" cellpadding="0" FONT-SIZE: 32pt>
                    <tr>
                        <td style="width: 100px;  text-align: right; background-color: green;">
                            <span style="color: #ffffff">主題</span></td>
                        <td style=" text-align: left; background-color: #ffffcc;" colspan="3">
                            <asp:Label ID="subjectLabel" runat="server" Text='<%# Bind("subject") %>' ></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 100px; text-align: right; color: #ffffff; background-color: green;">
                            留言時間</td>
                        <td style="text-align: left; background-color: #ffffcc;" colspan="3">
                            <asp:Label ID="main_timeLabel" runat="server" Text='<%# Bind("dcreate", "{0:g}") %>' ></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 100px;text-align: right; color: #ffffff; background-color: green;">
                            姓名</td>
                        <td colspan="3" style="background-color: #ffffcc; text-align: left">
                            <asp:Label ID="main_nameLabel" runat="server" Text='<%# Bind("who") %>' ></asp:Label>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px;  text-align: right; color: #ffffff; background-color: green;">
                            留言內容</td>
                        <td colspan="3" style=" text-align: left;FONT-SIZE: 32pt; background-color: #ffffcc;">
                            <asp:Label ID="main_contentLabel" runat="server"  Font-Size="Medium" Text='<%# Replace(Eval("msg"),vbcrlf,"<br>") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 100px; color: #ffffff; background-color: green; text-align: right">
                            網站和郵件</td>
                        <td colspan="3" style="background-color: #ffffcc; text-align: left">
                            <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/images/icon-home.gif" NavigateUrl='<%# Eval("url") %>'
                                Target="_blank">個人網頁</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/images/icon-mail.gif" NavigateUrl='<%# "mailto:" & Eval("email") %>'>我的信箱</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td style="width: 100px; color: #ffffff; background-color: green; text-align: right">
                            電話</td>
                        <td colspan="3" style="background-color: #ffffcc; text-align: left">
                            <asp:Label ID="main_telLabel" runat="server" Text='<%# Bind("tel") %>' ></asp:Label></td>
                    </tr>
                </table>
            </ItemTemplate>
            <HeaderTemplate>
                <strong><span style="font-size: 36pt; color: #0000ff">健言社討論區主題</span>
</strong>
            </HeaderTemplate>

        </asp:FormView>


        <span style="font-size: 24pt">
            <hr />
<div width=100% >
<div><a href="http://www.facebook.com/sharer.php" type="button_count" name="fb_share">分享</a></div>
    <div width=100% id="fb-root"></div><script type="text/javascript">var app_id = '188655821176855';FB.init({ appId : app_id, status : true, cookie : true, xfbml : true });FB.Canvas.setAutoResize();FB.getLoginStatus(function(response) {if (response.session) {uid = response.session['uid'];token = response.session['access_token'];}});FB.Event.subscribe('auth.login', function() {window.location.reload();});FB.getLoginStatus(function(response) {if (response.session) {}else{window.parent.location.href = authUrl;}});</script><fb:comments xid='' id='fb_comments' ></fb:comments></div>


<script language="javascript">
function doFBlikeButton() {
   document.getElementById('myFBlikeArea').innerHTML="<iframe src='http://www.facebook.com/plugins/like.php?href="
  + top.location.toString()
+"&layout=standard&show_faces=true&width=200&action=like&font=arial&colorscheme=light&height=80'"
+" scrolling='no' frameborder='0' style='border:none; overflow:hidden; width:200px; height:80px;' allowTransparency='true'></iframe>";
}
doFBlikeButton();
</script>
</div>
 <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                    DataKeyNames="re_uid" DataSourceID="AccessDataSource2" EnableTheming="True" ForeColor="Black"
                    GridLines="None" PageSize="50" ShowHeader="False" Width="80%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:TemplateField HeaderText="re_msg" SortExpression="re_msg">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("re_msg") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0" style="text-align: right">
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            姓名</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("re_who") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            日期</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("dcreate") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            內容</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label3" runat="server" Text='<%# Replace(Eval("re_msg"),vbcrlf,"<br>") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            郵件</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("re_email") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            網站</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("re_url") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            電話</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("re_tel") %>'></asp:Label></td>
                                    </tr>
                                </table>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <PagerSettings Position="TopAndBottom" />
                </asp:GridView></div>
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


<table align= center border="1" cellpadding="0" cellspacing="0" style="font-size: 12pt; width: 80%;
            font-family: Times New Roman; background-color: #ffffcc">
            <tr>
                <td style="width: 110px; color: #ffffff; background-color: green; text-align: left; height: 40px;">
                    <span>姓名</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left; height: 40px;">
                    <asp:TextBox ID="Txt_who" runat="server" Width="250px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                        ID="Requir_name" runat="server" ControlToValidate="Txt_who" ErrorMessage="請輸入姓名"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="Requir_msg" runat="server" ControlToValidate="Txt_msg"
                        ErrorMessage="請輸入內容"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>表情</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:Panel ID="Panel1" runat="server" BackColor="#C0FFC0" Height="57px" Width="489px">
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>內容<br />
                    </span>
                </td>
                <td colspan="3" rowspan="2" style="text-align: left">
                    <asp:TextBox ID="Txt_msg" runat="server" AutoCompleteType="Disabled" Height="300px"
                        TextMode="MultiLine" Width="500px"></asp:TextBox></td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>郵件</span></td>
                <td colspan="3" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_email" runat="server" Width="400px"></asp:TextBox></td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>電話</span></td>
                <td colspan="3" rowspan="2" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_tel" runat="server" Width="250px"></asp:TextBox></td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td rowspan="1" style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    網站</td>
                <td colspan="3" rowspan="1" style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_web" runat="server" Width="395px"></asp:TextBox>&nbsp;</td>
            </tr>
            <tr>
                <td rowspan="1" style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                </td>
                <td colspan="3" rowspan="1" style="background-color: #ffffcc; text-align: center">
                    <asp:Button ID="Btn_Add" runat="server" Text="新增" />
                    <asp:Button ID="Btn_Clear"
                        runat="server" Text="清除" /></td>
            </tr>
        &nbsp;&nbsp;&nbsp;</table>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT * FROM [talk] WHERE ([uid] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="uid" QueryStringField="uid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT * FROM [talkRe] WHERE ([uid] = ?) ORDER BY [dcreate] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="uid" QueryStringField="uid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>

</div>



<asp:HyperLink ID="HyperLink4" runat="server" Font-Size="Medium" 
            ForeColor="Red">新版多媒體留言板</asp:HyperLink>

  <td style="width: 100px; height: 19px">
                    </td>
                    <td style="width: 100px; height: 19px">
                        &nbsp;</td>
                    <td style="width: 100px; height: 19px; text-align: right">
                    </td>
                    <td style="width: 100px; height: 19px; text-align: center"><a href="board.aspx" target="_self"></a>
                        <asp:Button ID="Btnindex1" runat="server" CausesValidation="False" Text="回首頁" />
                        </td>
                    <td style="width: 100px; height: 19px; text-align: center">
                        <asp:Button ID="Btn_Post" runat="server" CausesValidation="False" Text="回上頁" /></td>

<!-- END PAGE SOURCE -->
 </form>
</body>
</html>