<%@ Page Language="VB" AutoEventWireup="false" CodeFile="reforum.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns:og="http://opengraphprotocol.org/schema/"xmlns:fb="http://www.facebook.com/2008/fbml">

<head runat="server">
    <title></title><meta property="og:image" content="http://www.tmc1974.com/book/images/logoface2.jpg"/>
<meta property='og:site_name' content='台北市健言社' /> 
<meta property="og:site_name" content="台北市健言社" /> 
    <script type='text/javascript'>$(function() {$('#fb_comments').attr('xid',top.location.toString()));});</script>
    <script type="text/javascript" src="http://connect.facebook.net/zh_TW/all.js"></script>
<script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>

<script language="javascript">

function doFBlikeButton() {
   var choose = document.getElementById('myFBlikeArea');
   choose.innerHTML="xx";
}


</script>
</head>
<body onload="doFBlikeButton()">
   <form id="form1" runat="server">
    <div style="text-align: center" title="健言社回覆討論">
        <br />
        
        <span style="font-size: 24pt">
            
        </span>
        
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

<div id="'myFBlikeArea">test</div>
</div>
            <span style="font-size: 12pt">&nbsp; &nbsp;&nbsp;<table style="font-size: 11pt; width: 100%">
                <tr>
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
                </tr>
            </table>
           <div align=center >
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
                <table style="font-size: 11pt; width: 100%">
                    <tr>
                        <td style="width: 100px; height: 19px">
                        </td>
                        <td style="width: 100px; height: 19px">
                        </td>
                        <td style="width: 100px; height: 19px; text-align: right">
                        </td>
                        <td style="width: 100px; height: 19px; text-align: center">
                            <asp:Button ID="Btnindex2" runat="server" CausesValidation="False" Text="回首頁" /></td>
                        <td style="width: 100px; height: 19px; text-align: center"><asp:Button ID="BtnBack" runat="server" CausesValidation="False" Text="回上頁" /></td>
                    </tr>
                </table>
                &nbsp;<br />
            </span>
        </span>&nbsp;<div align=center > <span  style="font-size: 36pt"><strong><span style="color: #0000ff"  >健言社討論區回覆留言<br /></div>
<div align=center >       
 <span style="font-size: 24pt" aligen=center>
            <span style="font-size: 12pt">
        <asp:HyperLink ID="HyperLink4" runat="server" Font-Size="Medium" 
            ForeColor="Red">新版多媒體留言板</asp:HyperLink>
            </span>
        </span></span></strong><br />
        </span>
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
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp; &nbsp;&nbsp;<br />
        &nbsp;</div>
    </form>
</body>
</html>

