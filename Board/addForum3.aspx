<%@ Page Title="" Language="VB" MasterPageFile="~/TMC.master" ValidateRequest="false"  %>

<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim addType As String = ""
        addType = Request("Type")
        If addType = "1" Or addType = "2" Then
            Dim strSQLCategory As String = ""
            Dim objDsCategory As DataSet
            Dim objSQL As New SqlFunc()
            Dim connstr As String = ""
            connstr = (New WebConfig).ConnStr("Tmc").ToString
            
            liMsgDate.Text = String.Format("<p>{0:g}</p>", DateTime.Now)
            liAddType.Text = String.Format("<input type=""hidden"" name=""addType"" id=""addType"" value=""{0}"" />", addType)
            licategory.Text = "<select name=""category"" id=""category"">"
            licategory.Text += "<option value="""">請選擇</option>"
            strSQLCategory = "Select CategoryID,CategoryName From RFCategory"
            objDsCategory = objSql.GetDataSetBySQL(connstr, strSQLCategory)
            If objDsCategory.Tables(0).Rows.Count > 0 Then
                Dim objRow As DataRow
                For i As Integer = 0 To objDsCategory.Tables(0).Rows.Count - 1
                    objRow = objDsCategory.Tables(0).Rows(i)
                    Dim NowCategoryID As String = ""
                    Dim NowCategoryName As String = ""
                    Dim SelectTag As String = ""
                    NowCategoryID = String.Format("{0}", objRow("CategoryID"))
                    NowCategoryName = String.Format("{0}", objRow("CategoryName"))
                
                    licategory.Text += String.Format("<option value=""{0}"">{1}</option>", NowCategoryID, NowCategoryName)
                Next
            End If
            
            licategory.Text += "</select>"
        Else
            Response.Redirect("/board/board.aspx")
        End If
    End Sub
</script>



<asp:Content ID="Content2" ContentPlaceHolderID="cpHTMLHead" runat="Server">
    
    
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/public.js"></script>
    <script type="text/javascript" src="/tinymce/js/tinymce/tinymce.min.js"></script>

     <script type="text/javascript" src="/js/jquery.htmlcode.js"></script>
    <script type="text/javascript" src="/js/Board/addForum.js"></script>
 <script>
    tinymce.init({
        selector: ".tinymce",
        theme: "modern",
        height: 300,
        plugins: [
             "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
             "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
             "save table contextmenu directionality emoticons template paste textcolor"
       ],
       content_css: "css/content.css",
       toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons", 
       style_formats: [
            {title: 'Bold text', inline: 'b'},
            {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
            {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
            {title: 'Example 1', inline: 'span', classes: 'example1'},
            {title: 'Example 2', inline: 'span', classes: 'example2'},
            {title: 'Table styles'},
            {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
        ]
    }); 
</script
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentSitemap" runat="server">
    <a href="index.asp">Home</a>   >    <a href="/board/board.aspx">健言社討論區</a>   >    <span>發表主題</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
    <div class="notebox" style="width: 940px;">
        <h5 style="margin: 0">歡迎您來到健言留言版，留言請遵守健言四不談：<br />
            不談商業、不談色情　不談宗教、不談政治
本社有權刪除不當留言，敬請見諒！</h5>
    </div>
    <!--/notebox-->
    <!--/div-->

    <table width="98%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 20px" class="normal">
        <tr>
            <td width="270%" colspan="4" align="center" style="color: #7e4300; text-align: left; border-bottom: 3px solid #eebd0a;">發表主題
            </td>
        </tr>
        <tr>
            <td width="15%" align="center" bgcolor="#eeecde" style="color: #7e4300;">
                <h4>主　　題</h4>
            </td>
            <td width="35%" bgcolor="#eeeeee">
                <p>
                    <input type="text" style="width: 80%;" id="subject" name="subject" maxlength="30"></p>
                <span id="errsubject" class="errclass"></span>
            </td>
            <td width="20%" align="center" bgcolor="#eeecde" style="color: #7e4300;">
                <h4>留言時間</h4>
            </td>
            <td width="30%" bgcolor="#eeeeee">
                <asp:Literal id="liMsgDate" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#f9f6e9" style="color: #7e4300;">
                <h4>姓　　名</h4>
            </td>
            <td>
                <p>
                    <input type="text" style="width: 80%;" name="who" id="elm1" maxlength="10"></p>
                    <span id="errwho" class="errclass"></span>
            </td>
            <td align="center" bgcolor="#f9f6e9" style="color: #7e4300;">
                <h4>聯絡方式</h4>
            </td>
            <td>
                <p>
                    <input type="text" style="width: 80%;" id="contactway" name="contactway" maxlength="30"></p>
                     <span id="errcontactway" class="errclass"></span>
            </td>
        </tr>
        <tr id="trPic">
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
        <tr id="trCategory">
            <td align="center" bgcolor="#f9f6e9" style="color: #7e4300;">
                <h4>分　　類</h4>
            </td>
            <td colspan="3"  style="letter-spacing: 3px">
                <asp:Literal ID="licategory" runat="server"></asp:Literal>
                <span id="errcategory" class="errclass"></span>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F9F6E9" style="color: #7e4300;">
                <h4>回覆內容</h4>
            </td>
            <td colspan="3" style="padding: 10px 20px">
              <textarea name="msg" rows="13" cols="20" id="msg" style="width: 98%;" class="tinymce"></textarea>
                <span id="errmsg" class="errclass"></span>
            </td>
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
                <button type="button" class="message" onclick="reset();">清除重填</button>
                <button type="button" class="message" onclick="Save()">確定送出</button>
            </td>
        </tr>
    </table>
  
    <asp:Literal ID="liAddType" runat="server"></asp:Literal>
</asp:Content>

