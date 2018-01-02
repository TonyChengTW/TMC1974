<%@ Page Title="" Language="VB" MasterPageFile="~/TMC.master" %>

<script runat="server">
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim connstr As String = ""
        Dim connstrHit As String = ""
        Dim adminMode As Boolean = False
        
        If Session("manageboard") = "1" Then
            adminMode = True
        End If
        
        connstr = (New WebConfig).ConnStr("Tmc").ToString
        connstrHit = (New WebConfig).ConnStr("Counters").ToString
     
        Dim objSql As New SqlFunc()
        Dim objDs As DataSet
        Dim objDsCategory As DataSet
        Dim strSQL As New StringBuilder
        Dim RealName As String = ""
        Dim Caption As String = ""
        Dim Content As String = ""
        Dim Email As String = ""
        Dim PhoneNumber As String = ""
        Dim WebSite As String = ""
        Dim PageSize As Integer = 20
        Dim RecordCount As Integer = 0
        Dim page As String = ""
        Dim intPage As Integer = 1
        Dim RecordSQL As String = ""
        Dim PageCount As Integer = 0
        Dim NowURL As String = "Board.aspx"
        Dim who As String = ""
        Dim subject As String = ""
        Dim HTMLList As New StringBuilder
        Dim SQLWhere As String = ""
        Dim SQLOrder As String = ""
        Dim SQLOrderInverse As String = ""
        Dim MainSQL As String = ""
        Dim TopCount As Integer = 0
        Dim Category As String = ""
        Dim SearchKeyWord As String = ""
        Dim TotalHitCounts As String = ""
        Dim TotayHitCounts As String = ""
        Dim YesterdayHitCounts As String = ""
        Dim NewMessageCounts As String = ""
        Dim ReplyMessageCounts As String = ""
        
        Dim TotalHits As String = ""
        Dim strHitSQL As String = ""
        Dim strTodayHitSQL As String = ""
        Dim strYesterdayHitSQL As String = ""
        Dim strNewMessageCountSQL As String = ""
        Dim strReplyMessageCountSQL As String = ""
        Dim intNewMessageCounts As Integer = 0
        Dim intReplyMessageCounts As Integer = 0
        Dim TotalMessageCounts As String = ""
        Dim strSQLCategory As String = ""
      
        Dim Period As String = ""
        Dim PeriodSQL As String = ""
        Dim PeriodStartDate As String = ""
        Dim PeriodEndDate As String = ""
        
        If adminMode = True Then
            liAdminCaption.Text = "<th>刪除</th>"
        End If
     
        PeriodSQL = "Select Period,StartDate,EndDate From PeriodSet Where SetId=1"
        Dim objDsPeriod As DataTable
        objDsPeriod = objSql.GetDataSetBySQL(connstr, PeriodSQL).Tables(0)
        If objDsPeriod.Rows.Count > 0 Then
            Dim objPeriodRow As DataRow
            objPeriodRow = objDsPeriod.Rows(0)
            Period = String.Format("{0}", objPeriodRow("Period"))
            PeriodStartDate = objPeriodRow("StartDate")
            PeriodEndDate = objPeriodRow("EndDate")
        End If
        
        liPeriod.Text = Period
        
        strHitSQL = "select ihits from [counter]"
        TotalHitCounts = objSql.GetDataValue(connstrHit, strHitSQL)
        
        strTodayHitSQL = "select ihits from TodayHits"
        TotayHitCounts = objSql.GetDataValue(connstrHit, strTodayHitSQL)
        
        strYesterdayHitSQL = "select ihits from YesterdayHits"
        YesterdayHitCounts = objSql.GetDataValue(connstrHit, strYesterdayHitSQL)
        
        strNewMessageCountSQL = String.Format("select  count(*)  FROM  talk WHERE (dcreate >= #{0}# and dcreate <= #{1}#)", PeriodStartDate, PeriodEndDate)
        NewMessageCounts = objSql.GetDataValue(connstr, strNewMessageCountSQL)
        liNewMessageCount.Text = NewMessageCounts
        
        strReplyMessageCountSQL = String.Format("SELECT  Count(*)  FROM talkRe WHERE (talkRe.dcreate)>=#{0}# and dcreate <= #{1}#", PeriodStartDate, PeriodEndDate)
        ReplyMessageCounts = objSql.GetDataValue(connstr, strReplyMessageCountSQL)
        liReplyMessageCounts.Text = ReplyMessageCounts
        
        Integer.TryParse(NewMessageCounts, intNewMessageCounts)
        Integer.TryParse(ReplyMessageCounts, intReplyMessageCounts)
        liTotalMessageCounts.Text = String.Format("{0}", intNewMessageCounts + intReplyMessageCounts)
        
        
        page = Request("page")
        who = Server.UrlDecode(Request("who"))
        subject = Server.UrlDecode(Request("subject"))
        
        Category = Request("Category")
        SearchKeyWord = Server.UrlDecode(Request("SearchKeyWord"))
        
        
        SQLOrder = " [top] DESC,[newdcreate] DESC,uid desc"
        SQLOrderInverse = "[top] asc, [newdcreate] asc,uid asc"
       
        Dim qrystr As String = ""
        
     
       
        
        If Not String.IsNullOrWhiteSpace(Category) AndAlso String.IsNullOrWhiteSpace(SearchKeyWord) Then
            SQLWhere &= String.Format("and category = {0}", SqlPara.Int(Category))
            SQLOrder = "[top] Desc,newdcreate Desc,uid desc"
            SQLOrderInverse = "[top] asc,newdcreate asc,uid asc"
            qrystr = qrystr & "&Category=" & Category
        ElseIf Not String.IsNullOrWhiteSpace(SearchKeyWord) AndAlso String.IsNullOrWhiteSpace(Category) Then
            SQLWhere &= String.Format("and ((who like '%{0}%') or (subject like '%{0}%'))", SqlPara.LikeString(SearchKeyWord))
            SQLOrder = "[top] Desc,newdcreate Desc,uid desc"
            SQLOrderInverse = "[top] asc,newdcreate asc,uid asc"
            qrystr = qrystr & "&SearchKeyWord=" & Server.UrlEncode(SearchKeyWord)
        ElseIf Not String.IsNullOrWhiteSpace(SearchKeyWord) AndAlso Not String.IsNullOrWhiteSpace(Category) Then
            SQLWhere &= String.Format("and ((who like '%{0}%') or (subject like '%{0}%')) and category={1}", SqlPara.LikeString(SearchKeyWord), SqlPara.Int(Category))
            SQLOrder = "[top] Desc,newdcreate Desc,uid desc"
            SQLOrderInverse = "[top] asc,newdcreate asc,uid asc"
            qrystr = qrystr & "&Category=" & Category & "&SearchKeyWord=" & Server.UrlEncode(SearchKeyWord)
        End If
        
        
        licategory.Text = "<select name=""category"" id=""category"" onchange=""GoSearch()"">"
        licategory.Text += "<option value="""">全部分類</option>"
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
                If Category = NowCategoryID Then
                    SelectTag = "selected"
                End If
                licategory.Text += String.Format("<option value=""{0}"" {1}>{2}</option>", NowCategoryID, SelectTag, NowCategoryName)
            Next
        End If
        licategory.Text += "</select>"
        
        likeyword.Text = String.Format("<input type=""text"" id=""SearchKeyWord"" name=""SearchKeyWord"" value=""{0}"" style=""width: 40%"" />", SearchKeyWord)
        
        
        If Not String.IsNullOrWhiteSpace(SQLWhere) Then
            SQLWhere = SQLWhere.Substring(4)
        End If
        
     
        If Integer.TryParse(page, intPage) = False Then
            intPage = 1
        End If
        
        RecordSQL = "SELECT count(*) From talk"
     
        If Not String.IsNullOrWhiteSpace(SQLWhere) Then
            RecordSQL = String.Format("{0} Where {1}", RecordSQL, SQLWhere)
        End If

        If intPage > 1 Then
            strSQL.AppendFormat("SELECT TOP {0} * FROM ", PageSize)
            strSQL.AppendFormat("   ( SELECT TOP {0} * FROM talk ", PageSize * intPage)
            If Not String.IsNullOrWhiteSpace(SQLWhere) Then
                strSQL.AppendFormat(" Where {0} ", SQLWhere)
            End If
            If Not String.IsNullOrWhiteSpace(SQLOrder) Then
                strSQL.AppendFormat("ORDER BY {0}", SQLOrder)
            End If
            strSQL.AppendFormat(") AS a ", SQLOrder)
            If Not String.IsNullOrWhiteSpace(SQLOrderInverse) Then
                strSQL.AppendFormat("  ORDER BY {0} ", SQLOrderInverse)
            End If
        Else
            strSQL.AppendFormat("SELECT TOP {0} * FROM talk ", PageSize)
            If Not String.IsNullOrWhiteSpace(SQLWhere) Then
                strSQL.AppendFormat(" Where {0} ", SQLWhere)
            End If
            If Not String.IsNullOrWhiteSpace(SQLOrder) Then
                strSQL.AppendFormat(" Order by {0} ", SQLOrder)
            End If
        End If
        

        Integer.TryParse(objSql.GetDataValue(connstr, RecordSQL), RecordCount)

        PageCount = RecordCount \ PageSize

        If (RecordCount Mod PageSize) > 0 Then
            PageCount = PageCount + 1
        End If
        
        objDs = objSql.GetDataSetBySQL(connstr, strSQL.ToString)
    
        Dim PageStart As Integer = 0
        Dim PageEnd As Integer = 0
       
        Dim StepCount As Integer = 0

        If objDs.Tables(0).Rows.Count > 0 Then
            If intPage > 1 Then
                PageStart = objDs.Tables(0).Rows.Count - 1
                PageEnd = 0
                StepCount = -1
            Else
                PageStart = 0
                PageEnd = objDs.Tables(0).Rows.Count - 1
                StepCount = 1
            End If
            For i As Integer = PageStart To PageEnd Step StepCount
                Dim objRow As DataRow
                Dim uid As String = ""
                Dim County As String = ""
                Dim newdcreate As String = ""
                Dim hits As String = ""
                Dim re As String = ""
                Dim ShowCategory As String = ""

                objRow = objDs.Tables(0).Rows(i)
                uid = String.Format("{0}", objRow("uid"))
                
                RealName = String.Format("{0}", objRow("who"))
                Caption = String.Format("{0}", objRow("subject"))
                newdcreate = String.Format("{0:g}", objRow("newdcreate"))
                hits = String.Format("{0}", objRow("hits"))
                re = String.Format("{0}", objRow("re"))
                ShowCategory = String.Format("{0}", objRow("Category"))
                ShowCategory = Board.ShowCategory(ShowCategory)
              

                HTMLList.AppendLine("<tr onmouseover=""this.style.backgroundColor='#e9d045';"" onmouseout=""this.style.backgroundColor='#f1e5a3';"">")
                If adminMode = True Then
                    HTMLList.AppendFormat("   <td align=""left""><input type=""button"" value=""刪除留言"" onclick=""delmsg('{0}','',1)""></td>", uid)
                End If
                HTMLList.AppendFormat("   <td align=""left"">{0}</td>", RealName)
                HTMLList.AppendFormat("   <td><a href=""/board/reforum.aspx?uid={0}"">{1}{2}</a></td>", uid, ShowCategory, Caption)
                HTMLList.AppendFormat("   <td align=""center"">{0}</td>", newdcreate).AppendLine()
                HTMLList.AppendFormat("   <td align=""center"">{0}</td>", hits).AppendLine()
                HTMLList.AppendFormat("   <td align=""center"">{0}</td>", re).AppendLine()
                HTMLList.AppendLine("</tr>")
                
            Next
        Else
            HTMLList.AppendLine("<tr>")
            HTMLList.AppendFormat("   <td colspan=""5"">找不到資料,請重新設定條件查詢</td>")
            HTMLList.AppendLine("</tr>")
        End If

        If PageCount > 0 Then
        
            Dim PageFlag As Integer = 0
            Dim PageMod As Integer = 0
          
            PageMod = intPage Mod 10
            PageFlag = intPage \ 10
            If (PageMod = 0) Then
                PageFlag = PageFlag - 1
            End If
            Dim LinkCount As Integer = PageFlag * 10 + 10
            If LinkCount > PageCount Then LinkCount = PageFlag * 10 + (PageCount Mod 10)
            HTMLList.AppendLine("   <tr>")
            
            HTMLList.AppendLine("   <th colspan=""5"" style=""background-color: #e8dd97"">")
            HTMLList.AppendLine("       <div class=""turnpage2"" style=""margin: 5px 0"">")
            
            If PageFlag > 0 Then
                HTMLList.AppendFormat("   <button type=""button"" class=""page"" onclick=""GoPage('PrePage10Link');"">上10頁</button>")
                HTMLList.AppendFormat("       <input type=""hidden"" name=""PrePage10Link"" id=""PrePage10Link"" value=""{0}?page={1}{2}"" />", NowURL, (PageFlag - 1) * 10 + 1, qrystr)
            End If

            If intPage > 1 Then
                HTMLList.AppendFormat("   <button type=""button"" class=""page"" onclick=""GoPage('PrePageLink');"">上一頁</button>")
                HTMLList.AppendFormat("       <input type=""hidden"" name=""PrePageLink"" id=""PrePageLink"" value=""{0}?page={1}{2}"" />", NowURL, intPage - 1, qrystr)
            End If
            
            For i As Integer = PageFlag * 10 + 1 To LinkCount
                If intPage = i Then
                    HTMLList.AppendFormat("<span>{0}</span>", intPage).AppendLine()
                Else
                    HTMLList.AppendFormat("<a href=""{0}?page={1}{2}"" title=""{1}"">{1}</a>", NowURL, i.ToString, qrystr).AppendLine()
                End If
            Next
     
            If intPage < PageCount Then
                HTMLList.AppendLine("       <button type=""button"" class=""page"" onclick=""GoPage('NextPageLink');"">下一頁</button>")
                HTMLList.AppendFormat("       <input type=""hidden"" name=""NextPageLink"" id=""NextPageLink"" value=""{0}?page={1}{2}"" />", NowURL, intPage + 1, qrystr)
            End If
            
            If ((PageFlag + 1) * 10) < PageCount Then
                HTMLList.AppendLine("       <button type=""button"" class=""page"" onclick=""GoPage('Next10PageLink');"">下10頁</button>")
                HTMLList.AppendFormat("       <input type=""hidden"" name=""Next10PageLink"" id=""Next10PageLink"" value=""{0}?page={1}{2}"" />", NowURL, (PageFlag + 1) * 10 + 1, qrystr)
            End If
            
            HTMLList.AppendFormat("       <p style=""margin-top: 25px;"">累計人數(2009/10/26)：<span>{0}</span>　昨日人數：<span>{1}</span>　今日人數：<span>{2}</span>　現在線上人數：<span>{3}</span>　 </p>", TotalHitCounts, YesterdayHitCounts, TotayHitCounts, Application("Usercount"))
            HTMLList.AppendLine("       </div>")
            HTMLList.AppendLine("   </th>")
            HTMLList.AppendLine("</tr>")
            
        Else
            
            HTMLList.AppendLine("   <tr>")
            
            HTMLList.AppendLine("   <th colspan=""5"" >")
            HTMLList.AppendLine("   </th>")
            HTMLList.AppendLine("   </tr>")
            
        End If

        liList.Text = HTMLList.ToString


    End Sub
</script>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHTMLHead" runat="Server">
    <link rel="Stylesheet" href="/css/board/board.css" />
    <script type="text/javascript" src="/js/public.js"></script>
    <script type="text/javascript" src="/js/jquery.htmlcode.js"></script>
    <script type="text/javascript" src="/js/board/board.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentSitemap" runat="server">
    <a href="/index.asp">Home</a>   >    <span>健言社討論區</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page_title">健言社討論區</div>

    <div class="notebox" style="width: 740px;">
        <h5 style="margin: 0">歡迎您來到健言留言版，留言請遵守健言四不談：<br />
            不談商業、不談色情　不談宗教、不談政治
本社有權刪除不當留言，敬請見諒！</h5>
    </div>
    <!--/notebox-->

    <div class="boardbox">
        <p>
            健言社第<asp:literal ID="liPeriod" runat="server"></asp:literal>期留言數 新增留言<b><asp:Literal ID="liNewMessageCount" runat="server"></asp:Literal>+</b> 回覆留言<b><asp:Literal ID="liReplyMessageCounts" runat="server"></asp:Literal>=<asp:Literal ID="liTotalMessageCounts" runat="server"></asp:Literal></b>

            <span>
                <a href="/board/boardcount.aspx">★本期留言排行榜</a></span>
            <span>
                <a href="/book/SelectHelp.aspx">►搜尋方式說明</a></span><span>
                    <a href="/board/Reforum.aspx?uid=2605">►多媒體留言操作說明</a></span>
        </p>
        <button type="button" class="message" onclick="window.location.href='/board/addForum.aspx?type=1';">
            <img src="/images/icon_File_edit.png" width="25" style="vertical-align: middle" />新增主題</button>
        <button type="button" class="message" onclick="window.location.href='/board/addForum.aspx?type=2';">
            <img src="/images/icon_Multimedia.png" width="25" style="vertical-align: middle" />多媒體留言</button>

        <asp:Literal ID="licategory" runat="server"></asp:Literal>
        <asp:Literal ID="likeyword" runat="server"></asp:Literal>   
       
        <button type="button" class="board" onclick="GoSearch()">搜尋</button>
    </div>
    <!--/div-->

    <div id="myDiv" style="margin-top: -180px; float: right">
        <table>
            <tr>
                <td id="pic1">
                    <table>
                        <tr>
                            <td>
                                <a href="https://www.flickr.com/photos/133676498@N06/albums/72157683413735075" title="Title1" target="_blank">
                                 <img border="0" src="https://www.flickr.com/photos/133676498@N06/33641122353/in/album-72157683413735075/" width="200" height="150" /><br />
                                 第135期 會外會。募愛到樂山。街頭快閃TM募發票</a></td>
                            <td><a href="https://www.flickr.com/photos/133676498@N06/albums/72157683413735075" title="Title1" target="_blank">
                                <img border="0" src="https://farm9.staticflickr.com/8340/28540413483_30114caf7c_z_d.jpg" width="200" height="150"/><br />
                                42周年社慶/a></td>

                            <td><a href="https://www.flickr.com/photos/133676498@N06/albums/72157664072859323" title="Title1" target="_blank">
                                <img border="0" src="https://farm2.staticflickr.com/1614/26001468346_e5a8d4e017_z_d.jpg" width="200" height="150"/><br />
                                2016家族聯誼會</a></td>
                            <td><a href="https://flic.kr/s/aHskDJWxAC" title="Title1" target="_blank">
                                <img border="0" src="https://farm9.staticflickr.com/8769/29657910461_4fa5a3125c_z_d.jpg" width="200" height="150"/><br />
                                133期即興劇</a></td>
                            <td><a href="https://flic.kr/s/aHskPFJu5U" title="Title1" target="_blank">
                                <img border="0" src="https://farm6.staticflickr.com/5467/31242741831_3f2bab2055_z_d.jpg" width="200" height="150"/><br />
                                134期第七週 個人色彩與形象魅力 </a></td>
                             <td><a href="https://www.flickr.com/photos/133676498@N06/albums/72157680072371466" title="Title1" target="_blank">
                                <img border="0" src="https://c2.staticflickr.com/4/3884/32002835713_9098060672_b.jpg" width="200" height="150"/><br />
                                第134期 社長交接  </a></td>
                             <td><a href="https://flic.kr/s/aHskLZoRH9" title="Title1" target="_blank">
                                <img border="0" src="http://7.share.photo.xuite.net/tmc1974119/17c148b/19497936/1079149499_Q.jpg" width="200" height="150"/><br />
                                134期第ㄧ週 口才“百”勝，名聲齊“陽”  </a></td>
                        </tr>
                    </table>
                </td>
                <td id="pic2"></td>
            </tr>
        </table>
        <!-- 跑馬燈 -->
        <script type="text/javascript" src="/js/board/marquee.js"></script>
        <!-- 跑馬燈 END -->
    </div>
    <table width="100%" class="hovertable">
        <tr>
            <asp:Literal Id="liAdminCaption" runat="server"></asp:Literal>

            <th>姓名</th>
            <th>標題</th>
            <th>最後回應</th>
            <th>點閱	</th>
            <th>回覆</th>
        </tr>
        <asp:Literal ID="liList" runat="server"></asp:Literal>

    </table>
    <div class="clear" style="margin-bottom: -15px;"></div>
</asp:Content>

