Partial Class DDRYMD
    Inherits System.Web.UI.Page
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
    End Sub
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: 此為 Web Form 設計工具所需的方法呼叫   
        '請勿使用程式碼編輯器進行修改。   
        InitializeComponent()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            FillDDLYMD(DDLYear)
            DDLYear.SelectedValue = Now.Year
            DDLMonth.SelectedValue = Now.Month
            FillDDLYMD(DDLDate)
            DDLDate.SelectedValue = Now.Day
        End If
    End Sub
    Public Sub FillDDLYMD(ByVal ddl As System.Web.UI.WebControls.DropDownList)
        Select Case ddl.ID.ToUpper
            Case "DDLYEAR"
                '這裡設定的年的區間是以前後五年(包含今年)   
                Dim I As Integer = 0
                For I = -5 To 5
                    Dim J As Integer = Now.Year
                    DDLYear.Items.Add(J + I)
                Next
            Case "DDLDATE"
                ConvertDate()
        End Select
    End Sub
    Sub ConvertDate()
        '日期產生，包含是否為閏年的判斷   
        Dim I As Integer, RecNo As Integer = DDLDate.SelectedIndex
        Select Case DDLMonth.SelectedItem.Text
            Case 1, 3, 5, 7, 8, 10, 12
                DDLDate.Items.Clear()
                For I = 1 To 31
                    DDLDate.Items.Add(I)
                Next
                DDLDate.SelectedIndex = RecNo
            Case 4, 6, 9, 11
                DDLDate.Items.Clear()
                For I = 1 To 30
                 DDLDate.Items.Add(I)
                Next
                If RecNo > DDLDate.Items.Count - 1 Then
                    DDLDate.SelectedIndex = 0
                Else
                    DDLDate.SelectedIndex = RecNo
                End If
            Case 2
                Dim Y = Val(DDLYear.SelectedItem.Text)
                Dim Y100 = Y Mod 100, Y400 = Y Mod 400, Y4 = Y Mod 4
                Dim J As Integer
                If Y4 = 0 Then
                    If Y100 = 0 Then
                        If Y400 = 0 Then
                            DDLDate.Items.Clear()
                            For J = 1 To 29
                                DDLDate.Items.Add(J)
                            Next
                        Else
                            DDLDate.Items.Clear()
                            For J = 1 To 28
                                DDLDate.Items.Add(J)
                            Next
                        End If
                    Else
                        DDLDate.Items.Clear()
                        For J = 1 To 29
                            DDLDate.Items.Add(J)
                        Next
                    End If
                Else
                    DDLDate.Items.Clear()
                    For J = 1 To 28
                        DDLDate.Items.Add(J)
                    Next
                End If
                If RecNo > DDLDate.Items.Count - 1 Then
                    DDLDate.SelectedIndex = 0
                Else
                    DDLDate.SelectedIndex = RecNo
                End If
        End Select
    End Sub
    Private Sub DDLMonth_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLMonth.SelectedIndexChanged
        ConvertDate()
    End Sub
    Private Sub DDLYear_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLYear.SelectedIndexChanged
        ConvertDate()
    End Sub
End Class
