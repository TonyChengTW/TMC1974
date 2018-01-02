Imports System.Data
Imports System.Data.OleDb
Partial Class Test
    Inherits System.Web.UI.Page

    Protected Sub Btn_Add_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Add.Click
        Response.Redirect("addForum.aspx")
    End Sub
   Protected Sub Btn2_Add_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn2_Add.Click
        Response.Redirect("addForumNew.aspx")
    End Sub

    Protected Sub Btn_clearsubject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_clearsubject.Click
        Txt_name.Text = ""
        Txt_subject.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
        'GridView1.DataBind()
        Dim tag As HtmlMeta = New HtmlMeta()
        tag.Name = "description"
        tag.Content = "My description for this page"
        Header.Controls.Add(tag)
        drawCounter()
        'GridView1.PageIndex = Session("uid")
        'Lab_Count.Text = CInt(Me.GridView2.Rows(0).Cells(1).Text) + CInt(Me.GridView3.Rows(0).Cells(1).Text)

        'Label9.text=Application("list")'留言比賽結果
CounterDraw
    End Sub
    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated



        If e.Row.RowType = DataControlRowType.DataRow Then


            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#CDE6FF'")



            ' when mouse leaves the row, change the bg color to its original value   

            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;")

        End If
    End Sub
    Protected Sub GridView1_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.PageIndexChanged
        Session("uid") = GridView1.PageIndex
    End Sub

    'Protected Sub DetailsView3_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView3.DataBound
    '    If DetailsView3.Rows(0).Cells(0).Text <= 0 Then
    '        DetailsView3.Visible = False
    '    End If
    'End Sub
Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Dim i As Integer = 0
        Dim j As Integer = 0
        If e.Row.RowType = DataControlRowType.Pager Then
            Dim trPager As TableRow = CType(e.Row.Controls(0).Controls(0).Controls(0), TableRow)
            For i = 0 To trPager.Controls.Count - 1
                Dim tcPager As TableCell = CType(trPager.Controls(i), TableCell)
                For j = 0 To tcPager.Controls.Count - 1
                    'System.Web.UI.WebControls.DataControlPagerLinkButton
                    ''Dim kk As String = tcPager.Controls(j).ToString
                    'tcPager.Controls(1).ToString()
                    'If tcPager.Controls(j).FindControl("System.Web.UI.WebControls.DataControlPagerLinkButton") = True Then
                    If tcPager.Controls(j).ToString() = "System.Web.UI.WebControls.DataControlPagerLinkButton" Then
                        Dim lbtn As LinkButton = CType(tcPager.Controls(j), LinkButton)
                        If (lbtn.Text = "..." And i = 0) Then
                            lbtn.Text = "上10頁"
                        ElseIf lbtn.Text = "..." Then
                            lbtn.Text = "下10頁"
                        End If
                    End If
                Next
            Next
        End If
    End Sub
    Protected Sub VisitStat()
        Dim LastMonthBegin As String = DateTime.Today.AddMonths(-1).ToString("yyyy-MM") + "-01 00:00:01" '上个月的起始时间
        Dim ThisMonthBegin As String = DateTime.Today.AddMonths(0).ToString("yyyy-MM") + "-01 00:00:01" '本个月的起始时间
        Dim NextMonthBegin As String = DateTime.Today.AddMonths(1).ToString("yyyy-MM") + "-01 00:00:01" '下个月的起始时间
        Dim YesterdayBegin As String = DateTime.Now.AddDays(-1).ToString("d") + " 00:00:01" '昨天的起始时间
        Dim TodayBegin As String = DateTime.Now.AddDays(0).ToString("d") + " 00:00:01" '/今天的起始时间
        Dim TomorrowBegin As String = DateTime.Now.AddDays(1).ToString("d") + " 00:00:01" '/明天的起始时间
        'Label3.Text = "累计PV浏览量：" + SqlResult("select count(sIntoIP) from [Yp_VisitStat]")
        '''    Label4.Text = "累計人數" + SqlResult("select count( sIntoIP) from [Yp_VisitStat]")
        '    Label5.Text = "上个月PV浏览量：" + SqlResult("select count(sIntoIP) from [Yp_VisitStat] where dIntoTime>'" + LastMonthBegin + "'and dIntoTime<'" + ThisMonthBegin + "'")
        '    Label6.Text = "上个月独立IP浏览量：" + SqlResult("select count( sIntoIP) from [Yp_VisitStat] where dIntoTime>'" + LastMonthBegin + "'and dIntoTime<'" + ThisMonthBegin + "'")
        '    Label7.Text = "本月PV浏览量：" + SqlResult("select count(sIntoIP) from [Yp_VisitStat] where dIntoTime>'" + ThisMonthBegin + "'and dIntoTime<'" + NextMonthBegin + "'")
        '''     Label8.Text = "本月累計人數：" + SqlResult("select count( sIntoIP) from [Yp_VisitStat] where dIntoTime>#" + ThisMonthBegin + "# and dIntoTime< #" + NextMonthBegin + "#")
        '"本月独立IP浏览量：" + SqlResult("select count( sIntoIP) from [Yp_VisitStat] where dIntoTime>'" + ThisMonthBegin + "'and dIntoTime<'" + NextMonthBegin + "'")
        '    Label9.Text = "昨日PV浏览量：" + SqlResult("select count(sIntoIP) from [Yp_VisitStat] where dIntoTime>'" + YesterdayBegin + "'and dIntoTime<'" + TodayBegin + "'")
        '''    Label10.Text = "昨日人數：" + SqlResult("select count( sIntoIP) from [Yp_VisitStat] where dIntoTime>#" + YesterdayBegin + "# and dIntoTime< #" + TodayBegin + "#")
        '    Label11.Text = "今日PV浏览量：" + SqlResult("select count(sIntoIP) from [Yp_VisitStat] where dIntoTime>'" + TodayBegin + "'and dIntoTime<'" + TomorrowBegin + "'")
        '''   Label12.Text = "今日人數：" + SqlResult("select count( sIntoIP) from [Yp_VisitStat] where dIntoTime>#" + TodayBegin + "# and dIntoTime< #" + TomorrowBegin + "#")
        'Label13.Text = "當前共有:<b>" + Application("counter").ToString() + "</b> 位訪問者正在訪問網站!"
    End Sub
    Protected Function SqlResult(ByVal MySql As String) As String

        Dim strResult As String = ""
        Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\VisitStat.mdb")
        Dim Conn As New OleDbConnection(connectionString)
        Conn.Open()
        Dim myCommand As OleDbCommand = New OleDbCommand(MySql, Conn)
        strResult = myCommand.ExecuteScalar().ToString()
        Conn.Close()
        Conn.Dispose()
        'return strResult
        SqlResult = strResult
    End Function
    Protected Sub drawCounter()
        Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\counters.mdb")
        Dim Conn As New OleDbConnection(connectionString)
        Dim iOnline as Integer
        Dim ihits As Integer
        Dim i As Integer
        Dim icounts As Integer
        Dim Cmd As New OleDbCommand("select ihits from [counter]  ", Conn)
        Conn.Open()
        ihits = Cmd.ExecuteScalar()
   iOnline=Application("Usercount")
        Dim images(10) As Image
        Dim strImages As String
        Dim Digits As Integer = 10
        Dim length As Integer = Len(Trim(ihits))
       Dim ilength As Integer = Len(Trim(iOnline))
        '總人數
        For I = 0 To 9
            strImages = "Image" & (I + 1)
            If (10 - length) > I Then
                CType(Me.FindControl(strImages), Image).ImageUrl = "images/0a.gif"
            Else

                CType(Me.FindControl(strImages), Image).ImageUrl = "images/" + Mid(ihits, I + length - 9, 1) + "a.gif"
            End If


        Next
        '昨日人數
        Dim Cmd2 As New OleDbCommand("select ihits from [Yesterdayhits]  ", Conn)
        ihits = Cmd2.ExecuteScalar()
        length = Len(Trim(ihits))
        For I = 0 To 2
            strImages = "Image" & (I + 11)
            If (3 - length) > I Then
                CType(Me.FindControl(strImages), Image).ImageUrl = "images/0a.gif"
            Else

                CType(Me.FindControl(strImages), Image).ImageUrl = "images/" + Mid(ihits, I + length - 2, 1) + "a.gif"
            End If
        Next
        '今天人數
        Dim Cmd3 As New OleDbCommand("select ihits from [TodayHits]  ", Conn)

        ihits = Cmd3.ExecuteScalar()
        length = Len(Trim(ihits))
        For I = 0 To 2
            strImages = "Image" & (I + 14)
            If (3 - length) > I Then
                CType(Me.FindControl(strImages), Image).ImageUrl = "images/0a.gif"
            Else

                CType(Me.FindControl(strImages), Image).ImageUrl = "images/" + Mid(ihits, I + length - 2, 1) + "a.gif"
            End If
        Next
        Conn.Close()
        '線上人數
'Application("Usercount")
'iOnline=3
'ilength=1

     For I = 0 To 1
            strImages = "Image" & (I + 17)
            If (2 - ilength) > I Then
                CType(Me.FindControl(strImages), Image).ImageUrl = "images/0a.gif"
            Else

                CType(Me.FindControl(strImages), Image).ImageUrl = "images/" + Mid(iOnline, I + ilength - 1, 1) + "a.gif"
            End If
        Next

    End Sub

Protected sub CounterDraw()
        Dim couters1,couters2,couters3  as integer
        Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\TMC.mdb")
        Dim Conn As New OleDbConnection(connectionString)
        Dim iOnline as Integer
        Dim ihits As Integer
        Dim i As Integer
        Dim icounts As Integer
        Dim Cmd As New OleDbCommand("SELECT  COUNT(*)  FROM  talk WHERE (dcreate >= #9/12/2010#)", Conn)
        Conn.Open()
        couters1  = Cmd.ExecuteScalar()
        Label20.text=couters1 
        'Conn.Close()
        Dim Cmd2 As New OleDbCommand("SELECT  Count(*)  FROM talkRe WHERE (talkRe.dcreate)>=#9/12/2010#", Conn)
        'Conn.Open()
        couters2  = Cmd2.ExecuteScalar()
        Label21.text=couters2
        Label22.text= couters1 + couters2 
        Conn.Close() 
   
 end sub
End Class
