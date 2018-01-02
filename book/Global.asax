<%@ Application Language="VB" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        
        ' 應用程式啟動時執行的程式碼
        Application("Usercount") = 0
        
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' 應用程式關閉時執行的程式碼
     
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' 發生未處理錯誤時執行的程式碼
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' 啟動新工作階段時執行的程式碼
        ' 啟動新工作階段時執行的程式碼
       
        Dim aa As DateTime
        Dim sYear As String
        Dim sMonth As String
        Dim sDay As String
        Dim ihits As Integer
        Dim ihitsYesday As Integer
        aa = Date.Today.ToString
        'aa = Date.Today.AddDays(-1).ToString
        sYear = aa.ToString
        sYear = aa.Year.ToString
        sMonth = aa.Month.ToString
        sDay = aa.Day.ToString
        Dim strResult As String = ""
        Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\counters.mdb")
        Dim Conn As New OleDbConnection(connectionString)

        Dim UpdateCmd As New OleDbCommand("UPDATE [counter] SET ihits=ihits+1", Conn)
        Conn.Open()
        ihits = UpdateCmd.ExecuteScalar()
        Conn.Close()
        Dim myCommand As New OleDbCommand("select ihits from [TodayHits]  where [dDate]=#" & aa & "#", Conn)
           Conn.Open()

        ihits = myCommand.ExecuteScalar()
        Conn.Close()
        If ihits = 0 Then
            '今天第1次訪問，先找出昨天的問數量
            aa = Date.Today.AddDays(-1).ToString
            Dim myCommand1 As New OleDbCommand("select ihits from [TodayHits]  where [dDate]=#" & aa & "#", Conn)
           
            Conn.Open()
            ihitsYesday = myCommand1.ExecuteScalar()
            Conn.Close()
            '將昨天的問數量更新
            Conn.Open()
            Dim myCommand2 As New OleDbCommand("UPDATE [Yesterdayhits] SET ihits =" & ihitsYesday, Conn)
            myCommand2.ExecuteNonQuery()
            Conn.Close()
            '更新今天數量
            Conn.Open()
            aa = Date.Today.ToString
            Dim myCommand3 As New OleDbCommand("UPDATE [TodayHits] SET ihits=1 ,  [dDate]=#" & aa & "#", Conn)
            myCommand3.ExecuteNonQuery()
            Conn.Close()

        Else
            Conn.Open()
            Dim myCommand4 As New OleDbCommand("UPDATE [TodayHits] SET ihits=ihits+1", Conn)
            myCommand4.ExecuteNonQuery()
            Conn.Close()

        End If
        Application.Lock()
        Application("Usercount") = Application("Usercount") + 1
        Application.UnLock()
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' 工作階段結束時執行的程式碼。 
        ' 注意: 只有在 Web.config 檔將 sessionstate 模式設定為 InProc 時，
        ' 才會引發 Session_End 事件。如果將工作階段模式設定為 StateServer 
        ' 或 SQLServer，就不會引發這個事件。
        Application.Lock()
        Application("Usercount") = Application("Usercount") - 1
        Application.UnLock()
      
    End Sub
       
</script>