Imports System.Collections
Partial Class Testcount
    Inherits System.Web.UI.Page
    Dim connstr As String = (New WebConfig).ConnStr("Tmc").ToString
    Dim objSql As New SqlFunc
    Dim Period As String = ""
    Dim PeriodStartDate As String = ""
    Dim PeriodEndDate As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SetDate()

        lifirstTable.Text = showFirstTable()
        litable1.Text = ShowTable1()
        litable2.Text = showTable2()
        litable3.Text = showTable3()

    End Sub

    Public Function showFirstTable() As String
        Dim strTable As New StringBuilder
        strTable.AppendLine("<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""width: 50%"" align=""center"">")
        strTable.AppendLine("   <tr>")
        strTable.AppendLine("       <td align=""center"" style=""width: 100%; background-color: #ffffcc; text-align: center"">")
        strTable.AppendFormat("           <font style=""font-size: 24pt"">{0}期留言排行</font>", Period)
        strTable.AppendLine("       </td>")
        strTable.AppendLine("   </tr>")
        strTable.AppendLine("   <tr>")
        strTable.AppendLine("       <td align=""center"" style=""width: 100%; background-color: #ffffcc; text-align: center"">")
        strTable.AppendLine("           <strong><span style=""font-size: 24pt""  ><span style=""color:Red""><span id=""Label1""></span></span></span></strong>")
        strTable.AppendLine("       </td>")
        strTable.AppendLine("   </tr>")
        strTable.AppendLine("</table> ")
        strTable.AppendLine("<br />")

        Return strTable.ToString
    End Function

    Public Sub SetDate()
        Dim PeriodSQL As String = ""

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
    End Sub

    Public Function ShowTable1() As String
        Dim strSQL As New StringBuilder
        Dim strTable As New StringBuilder

        strSQL.AppendLine("SELECT [aa].who,sum ([aa].talkcount) AS talkcount ")
        strSQL.AppendLine(" FROM [select * from (SELECT talk.who as who, Count(talk.who) AS talkcount FROM talk where talk.dcreate>=#6/11/2015# ")
        strSQL.AppendLine(" GROUP BY talk.who ")
        strSQL.AppendLine(" union ")
        strSQL.AppendLine(" SELECT talkRe.re_who as who, Count(talkRe.re_who) AS talkcount ")
        strSQL.AppendLine(" FROM talkRe ")
        strSQL.AppendLine(" WHERE talkRe.dcreate >= #6/4/2015# ")
        strSQL.AppendLine(" GROUP BY talkRe.re_who ) ")
        strSQL.AppendLine(" ]. AS [aa] ")
        strSQL.AppendLine(" GROUP BY [aa].who  ORDER BY Sum(aa.talkcount) DESC ")

        Dim objDt As DataTable
        objDt = objSql.GetDataSetBySQL(connstr, strSQL.ToString).Tables(0)
        If objDt.Rows.Count > 0 Then
            Dim objRow As DataRow
            strTable.AppendLine("<table border=""1"" style=""width: 50%"" align=""center"">")
            strTable.AppendLine("  <tbody>")
            strTable.AppendLine("      <tr>")
            strTable.AppendLine("          <td align=""center"" style=""width: 460px; color: #ffffff; background-color: #ff0066; text-align: center;"" valign=""top"">總排行(新增主題+回覆)</td>")
            strTable.AppendLine("      </tr>")
            strTable.AppendLine("      <tr>")
            strTable.AppendLine("          <td valign=""top"" align=""center"">")
            strTable.AppendLine("              <div>")
            strTable.AppendLine("                  <table cellspacing=""0"" cellpadding=""4"" id=""Table1"" style=""color: #333333; width: 100%; border-collapse: collapse;"">")
            strTable.AppendLine("                      <tbody>")
            strTable.AppendLine("                          <tr style=""color: White; background-color: #507CD1; font-weight: bold;"">")
            strTable.AppendLine("                              <th scope=""col"">人名</th>")
            strTable.AppendLine("                              <th align=""left"" scope=""col"">體系</th>")
            strTable.AppendLine("                              <th scope=""col"">合計</th>")
            strTable.AppendLine("                          </tr>")

            For i As Integer = 0 To objDt.Rows.Count - 1
                Dim bgColor As String = ""
                Dim who As String = ""
                Dim talkcount As String = ""

                objRow = objDt.Rows(i)

                If (i + 1) Mod 2 = 0 Then
                    bgColor = "White"
                Else
                    bgColor = "#EFF3FB"
                End If

                who = String.Format("{0}", objRow("who"))
                talkcount = String.Format("{0}", objRow("talkcount"))

                strTable.AppendFormat("                      <tr style=""background-color: {0};"">", bgColor)
                strTable.AppendFormat("                          <td>{0}</td>", who)
                strTable.AppendLine("                          <td>&nbsp;</td>")
                strTable.AppendFormat("                          <td>{0}</td>", talkcount)
                strTable.AppendLine("                      </tr>")
            Next

            strTable.AppendLine("                          <tr style=""color: White; background-color: #507CD1; font-weight: bold;"">")
            strTable.AppendLine("                              <td>&nbsp;</td>")
            strTable.AppendLine("                              <td>&nbsp;</td>")
            strTable.AppendLine("                              <td>&nbsp;</td>")
            strTable.AppendLine("                          </tr>")
            strTable.AppendLine("                      </tbody>")
            strTable.AppendLine("                  </table>")
            strTable.AppendLine("              </div>")
            strTable.AppendLine("          </td>")
            strTable.AppendLine("      </tr>")
            strTable.AppendLine("  </tbody>")
            strTable.AppendLine("</table>")

        End If

        strTable.AppendLine("<br/>")
        strTable.AppendLine("<br/>")
        strTable.AppendLine("<br/>")

        Return strTable.ToString
    End Function

    Public Function showTable2() As String
        Dim strSQL As New StringBuilder
        Dim strTable As New StringBuilder

        strSQL.AppendLine("SELECT talk.who as who , Count(talk.who) AS talkcount FROM talk WHERE (((talk.dcreate)>=#6/11/2015#))")
        strSQL.AppendLine("GROUP BY talk.who  ORDER BY  Count(talk.who) DESC")

        Dim objDt As DataTable
        objDt = objSql.GetDataSetBySQL(connstr, strSQL.ToString).Tables(0)
        If objDt.Rows.Count > 0 Then
            Dim objRow As DataRow
            strTable.AppendLine("<table border=""1"" style=""width: 50%"" align=""center"">")
            strTable.AppendLine("  <tbody>")
            strTable.AppendLine("      <tr>")
            strTable.AppendLine("          <td align=""center"" style=""width: 460px; color: #ffffff; background-color: #ff0066; text-align: center;"" valign=""top"">新增主題次數排行</td>")
            strTable.AppendLine("      </tr>")
            strTable.AppendLine("      <tr>")
            strTable.AppendLine("          <td valign=""top"" align=""center"">")
            strTable.AppendLine("              <div>")
            strTable.AppendLine("                  <table cellspacing=""0"" cellpadding=""4"" id=""Table2"" style=""color: #333333; width: 100%; border-collapse: collapse;"">")
            strTable.AppendLine("                      <tbody>")
            strTable.AppendLine("                          <tr style=""color: White; background-color: #507CD1; font-weight: bold;"">")
            strTable.AppendLine("                              <th scope=""col"">人名</th>")
            strTable.AppendLine("                              <th scope=""col"">合計</th>")
            strTable.AppendLine("                          </tr>")

            For i As Integer = 0 To objDt.Rows.Count - 1
                Dim bgColor As String = ""
                Dim who As String = ""
                Dim talkcount As String = ""

                objRow = objDt.Rows(i)

                If (i + 1) Mod 2 = 0 Then
                    bgColor = "White"
                Else
                    bgColor = "#EFF3FB"
                End If

                who = String.Format("{0}", objRow("who"))
                talkcount = String.Format("{0}", objRow("talkcount"))

                strTable.AppendFormat("                      <tr style=""background-color: {0};"">", bgColor)
                strTable.AppendFormat("                          <td>{0}</td>", who)
                strTable.AppendFormat("                          <td>{0}</td>", talkcount)
                strTable.AppendLine("                      </tr>")
            Next

            strTable.AppendLine("                          <tr style=""color: White; background-color: #507CD1; font-weight: bold;"">")
            strTable.AppendLine("                              <td>&nbsp;</td>")
            strTable.AppendLine("                              <td>&nbsp;</td>")
            strTable.AppendLine("                          </tr>")
            strTable.AppendLine("                      </tbody>")
            strTable.AppendLine("                  </table>")
            strTable.AppendLine("              </div>")
            strTable.AppendLine("          </td>")
            strTable.AppendLine("      </tr>")
            strTable.AppendLine("  </tbody>")
            strTable.AppendLine("</table>")

        End If

        strTable.AppendLine("<br/>")
        strTable.AppendLine("<br/>")
        strTable.AppendLine("<br/>")

        Return strTable.ToString

    End Function

    Public Function showTable3() As String
        Dim strSQL As New StringBuilder
        Dim strTable As New StringBuilder

        strSQL.AppendLine("SELECT talkRe.re_who as who , Count(talkRe.re_who) AS talkcount FROM talkRe WHERE (((talkRe.dcreate)>=#6/11/2015#)) ")
        strSQL.AppendLine(" GROUP BY talkRe.re_who ORDER BY  Count(talkRe.re_who) DESC ")

        Dim objDt As DataTable
        objDt = objSql.GetDataSetBySQL(connstr, strSQL.ToString).Tables(0)
        If objDt.Rows.Count > 0 Then
            Dim objRow As DataRow
            strTable.AppendLine("<table border=""1"" style=""width: 50%"" align=""center"">")
            strTable.AppendLine("  <tbody>")
            strTable.AppendLine("      <tr>")
            strTable.AppendLine("          <td align=""center"" style=""width: 460px; color: #ffffff; background-color: #ff0066; text-align: center;"" valign=""top"">回覆次數排行</td>")
            strTable.AppendLine("      </tr>")
            strTable.AppendLine("      <tr>")
            strTable.AppendLine("          <td valign=""top"" align=""center"">")
            strTable.AppendLine("              <div>")
            strTable.AppendLine("                  <table cellspacing=""0"" cellpadding=""4"" id=""Table3"" style=""color: #333333; width: 100%; border-collapse: collapse;"">")
            strTable.AppendLine("                      <tbody>")
            strTable.AppendLine("                          <tr style=""color: White; background-color: #507CD1; font-weight: bold;"">")
            strTable.AppendLine("                              <th scope=""col"">人名</th>")
            strTable.AppendLine("                              <th scope=""col"">合計</th>")
            strTable.AppendLine("                          </tr>")

            For i As Integer = 0 To objDt.Rows.Count - 1
                Dim bgColor As String = ""
                Dim who As String = ""
                Dim talkcount As String = ""

                objRow = objDt.Rows(i)

                If (i + 1) Mod 2 = 0 Then
                    bgColor = "White"
                Else
                    bgColor = "#EFF3FB"
                End If

                who = String.Format("{0}", objRow("who"))
                talkcount = String.Format("{0}", objRow("talkcount"))

                strTable.AppendFormat("                      <tr style=""background-color: {0};"">", bgColor)
                strTable.AppendFormat("                          <td>{0}</td>", who)
                strTable.AppendFormat("                          <td>{0}</td>", talkcount)
                strTable.AppendLine("                      </tr>")
            Next

            strTable.AppendLine("                          <tr style=""color: White; background-color: #507CD1; font-weight: bold;"">")
            strTable.AppendLine("                              <td>&nbsp;</td>")
            strTable.AppendLine("                              <td>&nbsp;</td>")
            strTable.AppendLine("                          </tr>")
            strTable.AppendLine("                      </tbody>")
            strTable.AppendLine("                  </table>")
            strTable.AppendLine("              </div>")
            strTable.AppendLine("          </td>")
            strTable.AppendLine("      </tr>")
            strTable.AppendLine("  </tbody>")
            strTable.AppendLine("</table>")

        End If

        strTable.AppendLine("<br/>")
        strTable.AppendLine("<br/>")
        strTable.AppendLine("<br/>")

        Return strTable.ToString

    End Function

End Class