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
        Dim strHits As String = ""
        Dim ihitsYesterday As Integer
        Dim strHitsYesday As String = ""
        aa = Date.Today.ToString
        'aa = Date.Today.AddDays(-1).ToString
        sYear = aa.ToString
        sYear = aa.Year.ToString
        sMonth = aa.Month.ToString
        sDay = aa.Day.ToString
        Dim strResult As String = ""
        Dim connstr As String = ""
        Dim strSQL As String = ""
        Dim objSQL As New SqlFunc()
        connstr = (New WebConfig).ConnStr("Counters").ToString
        strSQL = "UPDATE [counter] SET ihits=ihits+1"
        objSQL.ExecuteSQL(connstr, strSQL)
        
        strSQL = String.Format("select ihits from TodayHits  where dDate={0}", SqlPara.DateTime(aa))
        strHits = objSQL.GetDataValue(connstr, strSQL)
        Integer.TryParse(strHits, ihits)
        If ihits = 0 Then
            '今天第1次訪問，先找出昨天的問數量
            aa = Date.Today.AddDays(-1).ToString
            strSQL = String.Format("select ihits from TodayHits  where dDate={0}", SqlPara.DateTime(aa))
            strHitsYesday = objSQL.GetDataValue(connstr, strSQL)
            Integer.TryParse(strHitsYesday, ihitsYesterday)
           
            '將昨天的問數量更新
            strSQL = String.Format("Update YesterdayHits Set ihits={0}", SqlPara.Int(ihitsYesterday))
            objSQL.ExecuteSQL(connstr, strSQL)
            
            '更新今天數量
            aa = Date.Today.ToString
            
            strSQL = String.Format("UPDATE TodayHits SET ihits=1 ,  dDate={0}", SqlPara.DateTime(aa))
            objSQL.ExecuteSQL(connstr, strSQL)
        Else
            strSQL = String.Format("UPDATE TodayHits SET ihits=ihits+1")
            objSQL.ExecuteSQL(connstr, strSQL)
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