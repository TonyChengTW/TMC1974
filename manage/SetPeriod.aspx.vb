Partial Class manage_SetPeriod
    Inherits System.Web.UI.Page

    Dim connstr As String = (New WebConfig).ConnStr("Tmc").ToString
    Dim connstrDemo As String = (New WebConfig).ConnStr("demo").ToString
    Dim objSql As New SqlFunc

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("manageboard") = "1" Then
            If Not Page.IsPostBack Then
                LoadData()
            End If
        Else
            Response.Write("<script type=""text/javascript"">alert('請先登入');location.href='http://www.tmc1974.com/login/login.aspx?fromurl=1';</script>")
        End If

    End Sub

    Public Sub LoadData()
        Dim PeriodSQL As String = ""
        Dim Period As String = ""
        Dim PeriodStartDate As String = ""
        Dim PeriodEndDate As String = ""

        PeriodSQL = "Select Period,StartDate,EndDate From PeriodSet Where SetId=1"
        Dim objDsPeriod As DataTable
        objDsPeriod = objSql.GetDataSetBySQL(connstr, PeriodSQL).Tables(0)
        If objDsPeriod.Rows.Count > 0 Then
            Dim objPeriodRow As DataRow
            objPeriodRow = objDsPeriod.Rows(0)
            Period = String.Format("{0}", objPeriodRow("Period"))
            PeriodStartDate = objPeriodRow("StartDate")
            PeriodEndDate = objPeriodRow("EndDate")
            txtPeriod.Text = Period
            txtStartDate.Text = PeriodStartDate
            txtEndDate.Text = PeriodEndDate
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim strSQL As New StringBuilder

        If Session("manageboard") = "1" Then
            strSQL.AppendFormat("Update PeriodSet Set Period={0},StartDate={1},EndDate={2} Where SetId=1", SqlPara.Varchar(txtPeriod.Text), SqlPara.Varchar(txtStartDate.Text), SqlPara.Varchar(txtEndDate.Text))
            objSql.ExecuteSQL(connstr, strSQL.ToString)
            Response.Write("<script type=""text/javascript"">alert('儲存更新成功!');location.href='http://www.tmc1974.com/manage/';</script>")
        Else
            Response.Write("<script type=""text/javascript"">alert('請先登入');location.href='http://www.tmc1974.com/login/login.aspx';</script>")
        End If

        Response.End()

    End Sub
End Class
