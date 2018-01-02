
Partial Class Default6
    Inherits System.Web.UI.Page

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
                            lbtn.Text = "上一頁"
                        ElseIf lbtn.Text = "..." Then
                            lbtn.Text = "下一頁"
                        End If
                    End If
                Next
            Next
        End If
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
