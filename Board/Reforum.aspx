<%@ Page Title="" Language="VB" MasterPageFile="~/TMC.master" %>

<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim connstr As String = ""
        connstr = (New WebConfig).ConnStr("Tmc").ToString
        Dim adminMode As Boolean = False
        
        If Session("manageboard") = "1" Then
            adminMode = True
        End If
        
        Dim uid As String = ""
        uid = Context.Request("uid")
        Dim strSQL As String = ""
        Dim objDs As DataSet
        Dim objDsReply As DataSet
        Dim objSQL As New SqlFunc()
        Dim strHTMLReply As New StringBuilder
        Dim updSQL As String = ""
        If Not String.IsNullOrWhiteSpace(uid) Then
            strSQL = String.Format("Select * From talk Where uid={0}", SqlPara.Int(uid))
            objDs = objSQL.GetDataSetBySQL(connstr, strSQL)
            If objDs.Tables(0).Rows.Count > 0 Then
                Dim objRow As DataRow
                objRow = objDs.Tables(0).Rows(0)
                Dim muid As String = ""
               
                muid = String.Format("{0}", objRow("uid"))
                updSQL = String.Format("UPDATE talk SET hits =  hits + 1 WHERE uid={0}", SqlPara.Int(muid))
                objSQL.ExecuteSQL(connstr,updSQL)
                liList_who.Text = String.Format("<p>{0}</p>", objRow("who"))
                liList_subject.Text = String.Format("<p>{0}</p>", objRow("subject"))
                liList_msg.Text = String.Format("{0}", objRow("msg"))
                
                If Not String.IsNullOrWhiteSpace(liList_msg.Text) Then
                    liList_msg.Text = Board.ReplaceLine(liList_msg.Text)
                End If
                
                
                
                liList_newdcreate.Text = String.Format("<p>{0:g}</p>", objRow("newdcreate"))
                liList_Title.Text = String.Format("{0}", objRow("subject"))
                liuid.Text = String.Format("<input type=""hidden"" name=""uid"" id=""uid"" value=""{0}"" />", objRow("uid"))
                liMsgDate.Text = String.Format("{0:g}", DateTime.Now)
            End If
            
            
            strSQL = String.Format("SELECT * FROM talkRe WHERE uid = {0} ORDER BY dcreate DESC", SqlPara.Int(uid))
            objDsReply = objSQL.GetDataSetBySQL(connstr, strSQL)
            If objDsReply.Tables(0).Rows.Count > 0 Then
                Dim objRow As DataRow
                For i As Integer = 0 To objDsReply.Tables(0).Rows.Count - 1
                    Dim re_uid As String = ""
                    Dim re_who As String = ""
                    Dim re_contactway As String = ""
                    Dim re_msg As String = ""
                    Dim dcreate As String = ""
                
                    objRow = objDsReply.Tables(0).Rows(i)
                    re_uid = String.Format("{0}", objRow("re_uid"))
                    re_who = String.Format("<p>{0}</p>", objRow("re_who"))
                    re_msg = String.Format("<p>{0}</p>", objRow("re_msg"))
                    re_contactway = String.Format("<p>{0}</p>", objRow("re_contactway"))
                    dcreate = String.Format("{0:g}", objRow("dcreate"))
                
                    
                    strHTMLReply.AppendLine("<br />")
                    strHTMLReply.AppendLine("<table width=""98%"" border=""0"" cellspacing=""0"" cellpadding=""0"" class=""normal"">")
                    strHTMLReply.AppendLine("   <tr>")
                    strHTMLReply.AppendLine("       <td width=""15%"" align=""center"" bgcolor=""#eeecde"" style=""color: #7e4300; border-top: 3px solid #eebd0a;"">")
                    strHTMLReply.AppendLine("<h4>姓　　名</h4>")
                    strHTMLReply.AppendLine("       </td>")
                    strHTMLReply.AppendLine("       <td width=""35%"" bgcolor=""#eeeeee"" style=""border-top: 3px solid #cfcfcf;"">")
                    If Not String.IsNullOrWhiteSpace(re_who) Then
                        strHTMLReply.AppendLine(re_who)
                    Else
                        strHTMLReply.AppendLine("&nbsp")
                    End If
                    If adminMode = True Then
                        strHTMLReply.AppendFormat("<input type=""button"" value=""刪除回覆留言"" onclick=""delmsg('{0}','{1}',2)""",uid,re_uid)
                    End If
                    strHTMLReply.AppendLine("       </td>")
                    strHTMLReply.AppendLine("       <td width=""20%"" align=""center"" bgcolor=""#eeecde"" style=""color: #7e4300; border-top: 3px solid #eebd0a;"">")
                    strHTMLReply.AppendLine("       <h4>&nbsp;</h4>")
                    strHTMLReply.AppendLine("       </td>")
                    strHTMLReply.AppendLine("       <td width=""30%"" bgcolor=""#eeeeee"" style=""border-top: 3px solid #cfcfcf;"">&nbsp;</td>")
                    strHTMLReply.AppendLine("   </tr>")
                    strHTMLReply.AppendLine("   <tr>")
                    strHTMLReply.AppendLine("       <td align=""center"" bgcolor=""#f9f6e9"" style=""color: #7e4300;"">")
                    strHTMLReply.AppendLine("       <h4>留言時間</h4>")
                    strHTMLReply.AppendLine("       </td>")
                    strHTMLReply.AppendLine("       <td>")
                    If Not String.IsNullOrWhiteSpace(dcreate) Then
                        strHTMLReply.AppendFormat("<p>{0}</p>", dcreate)
                    Else
                        strHTMLReply.AppendLine("&nbsp")
                    End If
                    strHTMLReply.AppendLine("       </td>")
                    strHTMLReply.AppendLine("       <td align=""center"" bgcolor=""#f9f6e9"" style=""color: #7e4300;"">")
                    strHTMLReply.AppendLine("       <h4>聯絡方式</h4>")
                    strHTMLReply.AppendLine("       </td>")
                    strHTMLReply.AppendLine("       <td>")
                    If Not String.IsNullOrWhiteSpace(re_contactway) Then
                        strHTMLReply.AppendLine(re_contactway)
                    Else
                        strHTMLReply.AppendLine("&nbsp")
                    End If
                    strHTMLReply.AppendLine("       </td>")
                    strHTMLReply.AppendLine("   </tr>")
                    strHTMLReply.AppendLine("   <tr>")
                    strHTMLReply.AppendLine("   <td align=""center"" bgcolor=""#eeecde"" style=""color: #7e4300;"">")
                    strHTMLReply.AppendLine("   <h4>留言內容</h4>")
                    strHTMLReply.AppendLine("   </td>")
                    strHTMLReply.AppendLine("   <td colspan=""3"" align=""left"" valign=""middle"" bgcolor=""#eeeeee"">")
                    If Not String.IsNullOrWhiteSpace(re_msg) Then
                        strHTMLReply.AppendLine(re_msg)
                    Else
                        strHTMLReply.AppendLine("&nbsp")
                    End If
                    strHTMLReply.AppendLine("</td>")
                    strHTMLReply.AppendLine("</tr>")
                    strHTMLReply.AppendLine("</table>")
                Next
                
                liHTMLReply.Text = strHTMLReply.ToString
            End If
        Else
            Response.Redirect("/board/board.aspx")
        End If
        
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHtmlHead" runat="Server">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/public.js"></script>
    <script type="text/javascript" src="http://connect.facebook.net/zh_TW/all.js"></script>
    <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/js/jquery.htmlcode.js"></script>
    <script type="text/javascript" src="/js/board/reforum.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentSitemap" runat="server">
    <a href="/index.asp">Home</a>   >    <a href="/board/board.aspx">健言社討論區</a>   >    <span>回覆留言</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page_title">

            <asp:Literal ID="liList_Title" runat="server"></asp:Literal>
        
    </div>
        
    <div class="notebox" style="width: 940px;">
        <h5 style="margin: 0">歡迎您來到健言留言版，留言請遵守健言四不談：<br />
            不談商業、不談色情　不談宗教、不談政治
本社有權刪除不當留言，敬請見諒！</h5>
    </div>
    <!--/notebox-->
    <!--/div-->

    <table width="98%" border="0" cellspacing="0" cellpadding="0" class="normal">
        <tr>
            <td width="15%" align="center" bgcolor="#eeecde" style="color: #7e4300; border-top: 3px solid #eebd0a;">
                <h4>主　　題</h4>
            </td>
            <td width="35%" bgcolor="#eeeeee" style="border-top: 3px solid #cfcfcf;">
                <asp:Literal ID="liList_subject" runat="server"></asp:Literal>
            </td>
            <td width="20%" align="center" bgcolor="#eeecde" style="color: #7e4300; border-top: 3px solid #eebd0a;">
                <h4>留言時間</h4>
            </td>
            <td width="30%" bgcolor="#eeeeee" style="border-top: 3px solid #cfcfcf;">
                <asp:Literal id="liList_newdcreate" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#f9f6e9" style="color: #7e4300;">
                <h4>姓　　名</h4>
            </td>
            <td>
                <asp:Literal ID="liList_who" runat="server"></asp:Literal>
            </td>
            <td align="center" bgcolor="#f9f6e9" style="color: #7e4300;">
                <h4>聯絡方式</h4>
            </td>
            <td>
                <asp:Literal ID="liList_contactway" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#eeecde" style="color: #7e4300;">
                <h4>留言內容</h4>
            </td>
            <td colspan="3" align="left" valign="middle" bgcolor="#eeeeee">
               
                   <p><asp:literal ID="liList_msg" runat="server"></asp:literal></p>
                
            </td>
        </tr>
    </table>
    <asp:Literal ID="liHTMLReply" runat="server"></asp:Literal>
    <div>
 <script type="text/javascript">
     document.write("<iframe src=\"http://www.facebook.com/plugins/like.php?href=" + top.location.toString() + "&amp;layout=standard&amp;show_faces=true&amp;width=200&amp;action=like&amp;font=verdana&amp;colorscheme=light&amp;height=80\" scrolling=\"no\" frameborder=\"0\" style=\"border:none; overflow:hidden; width:660px; height:60px;\" allowTransparency=\"true\"></iframe>");

 </script>
                  
    </div>
    <div width=100% id="fb-root" align="left" ></div><script type="text/javascript">var app_id = '188655821176855'; FB.init({ appId: app_id, status: true, cookie: true, xfbml: true }); FB.Canvas.setAutoResize(); FB.getLoginStatus(function (response) { if (response.session) { uid = response.session['uid']; token = response.session['access_token']; } }); FB.Event.subscribe('auth.login', function () { window.location.reload(); }); FB.getLoginStatus(function (response) { if (response.session) { } else { window.parent.location.href = authUrl; } });</script><fb:comments xid='' id='fb_comments' ></fb:comments>

<script language="javascript" type="text/javascript" src="/js/Board/doFB.js"></script>
    <table width="98%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 20px" class="normal">
        <tr>
            <td width="270%" colspan="4" align="center" style="color: #7e4300; text-align: left; border-bottom: 3px solid #eebd0a;">回覆留言</td>
        </tr>
        <tr>
            <td width="15%" align="center" bgcolor="#eeecde" style="color: #7e4300;">
                <h4>姓　　名</h4>
            </td>
            <td width="35%" bgcolor="#eeeeee">
                <p>
                    <input type="text" style="width: 80%;" id="who" name="who" maxlength="10"/>
                </p>
                <span id="errwho" class="errclass"></span>
            </td>
            <td width="20%" align="center" bgcolor="#eeecde" style="color: #7e4300;">
                <h4>&nbsp;</h4>
            </td>
            <td width="30%" bgcolor="#eeeeee">
                <p>&nbsp;</p>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#f9f6e9" style="color: #7e4300;">
                <h4>留言時間</h4>
            </td>
            <td>
                <p>
                    <asp:Literal id="liMsgDate" runat="server" />
                </p>
            </td>
            <td align="center" bgcolor="#f9f6e9" style="color: #7e4300;">
                <h4>聯絡方式</h4>
            </td>
            <td>
                <p>
                    <input type="text" id="contactway" name="contactway" style="width: 80%;" maxlength="30" />
                </p>
                 <span id="errcontactway" class="errclass"></span>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#EEECDE" style="color: #7e4300;">
                <h4>表　　情</h4>
            </td>
            <td colspan="3" bgcolor="#EEEEEE" style="letter-spacing: 3px">
            <img src="/images/sana_msn_icon/msn_icon_01.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC1]');" />
                <img src="/images/sana_msn_icon/msn_icon_02.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC2]');" />
                <img src="/images/sana_msn_icon/msn_icon_03.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC3]');" />
                <img src="/images/sana_msn_icon/msn_icon_04.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC4]');" />
                <img src="/images/sana_msn_icon/msn_icon_05.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC5]');" />
                <img src="/images/sana_msn_icon/msn_icon_06.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC6]');" />
                <img src="/images/sana_msn_icon/msn_icon_07.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC7]');" />
                <img src="/images/sana_msn_icon/msn_icon_08.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC8]');" />
                <img src="/images/sana_msn_icon/msn_icon_09.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC9]');"/>
                <img src="/images/sana_msn_icon/msn_icon_10.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC10]');"/>
                <img src="/images/sana_msn_icon/msn_icon_11.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC11]');"/>
                <img src="/images/sana_msn_icon/msn_icon_12.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC12]');"/>
                <img src="/images/sana_msn_icon/msn_icon_13.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC13]');"/>
                <img src="/images/sana_msn_icon/msn_icon_14.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC14]');"/>
                <img src="/images/sana_msn_icon/msn_icon_15.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC15]');"/>
                <img src="/images/sana_msn_icon/msn_icon_16.gif" style="cursor:pointer" alt="" onclick="AppendPic('[NPIC16]');"/>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F9F6E9" style="color: #7e4300;">
                <h4>回覆內容</h4>
            </td>
            <td colspan="3" style="padding: 10px 20px">
                <textarea style="width:98%;" rows="5"  id="msg" name="msg" maxlength="65535" onkeyup="return isMaxLen(this)"></textarea>
                    <span id="errmsg"  class="errclass"></span></td>
        </tr>
        <tr>
            <td align="center" bgcolor="#EEECDE" style="color: #7e4300;">
                <h4>驗 證 碼</h4>
            </td>
            <td colspan="3" bgcolor="#EEEEEE" style="padding: 10px 20px">
                 <input type="text" id="checkcode" name="checkcode" style="width: 10%;"  />
                    <img src="/ashx/CreateImage.ashx" alt="" />
                                <span id="errcheckcode" class="errclass"></span>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center" style="padding: 10px;">
                <button type="button" class="message" onclick="reset()">清除重填</button>
                <button type="button" class="message" onclick="Save()">確定送出</button></td>
        </tr>
    </table>
    <div class="clear" style=""></div>
    <asp:Literal ID="liuid" runat="server"></asp:Literal>
</asp:Content>

