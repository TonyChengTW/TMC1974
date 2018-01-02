Imports System.Data
Imports System.Data.OleDb
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        '選出日期的總數
        For i As Integer = 0 To Calendar1.SelectedDates.Count - 1
            '選到值的設為星期在丟給變數
            Dim checkday As String = CStr(Calendar1.SelectedDates(i).DayOfWeek)
            '月和日二者連結成字串以方便放在新增欄位
            Dim showmonth As String = Calendar1.SelectedDates(i).Month & "月" & Calendar1.SelectedDates(i).Day & "日"
            '判斷是星期幾在把checkday丟給新增資料
            Dim showday As String
            Select Case checkday
                Case 0
                    showday = "日"
                    checkday = showday
                Case 1
                    showday = "一"
                    checkday = showday
                Case 2
                    showday = "二"
                    checkday = showday
                Case 3
                    showday = "三"
                    checkday = showday
                Case 4
                    showday = "四"
                    checkday = showday
                Case 5
                    showday = "五"
                    checkday = showday
                Case 6
                    showday = "六"
                    checkday = showday
            End Select
            'Response.Write(showmonth & "  " & checkday & "<br/>")


            Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\Custom.mdb")
            Dim Conn As New OleDbConnection(connectionString)

            Dim AddSQL As String = "INSERT INTO monthcalendar(T_month,T_day,T_one,T_three,T_four,T_five,T_Bone,T_threeone,T_threetwo,name) VALUES ('" & showmonth & "','" & checkday & "','" & DropDownList1.SelectedItem.Text & "','" & DropDownList2.SelectedItem.Text & "','" & DropDownList3.SelectedItem.Text & "','" & DropDownList4.SelectedItem.Text & "','" & DropDownList5.SelectedItem.Text & "','" & DropDownList6.SelectedItem.Text & "','" & DropDownList7.SelectedItem.Text & "','" & DropDownList7.SelectedItem.Text & " ')"
            Dim cmd As New OleDbCommand(AddSQL, Conn)
            Conn.Open()
            cmd.ExecuteNonQuery()
            Conn.Close()


        Next
        Grid_AddMonth.DataBind()
        'Calendar1.SelectionMode = CalendarSelectionMode.None
    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\Custom.mdb")
        Dim Conn As New OleDbConnection(connectionString)
        Dim cmd As New OleDbCommand
        cmd.Connection = Conn
        cmd.CommandText = "DELETE FROM monthcalendar WHERE T_uid"
        Conn.Open()
        cmd.ExecuteNonQuery()
        Conn.Close()
        Grid_AddMonth.DataBind()
        'Calendar1.SelectionMode = CalendarSelectionMode.None
        'Me.Calendar1.SelectionMode = CalendarSelectionMode.Day
       
    End Sub

    Protected Sub Btn_Print_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Print.Click
        Response.Redirect("Printemployees.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'For i As Integer = 0 To Grid_AddMonth.Rows.Count - 1
        '    'Response.Write(Grid_AddMonth.Rows(i).Cells(0).Text)
        '    Response.Write(Grid_AddMonth.DataKeys(i)("T_uid").ToString() & "<br/>")
        'Next
        'Response.Write(Request("T_uid"))
    End Sub

    
End Class
