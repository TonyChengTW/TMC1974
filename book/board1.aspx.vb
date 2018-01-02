
Partial Class Test
    Inherits System.Web.UI.Page

    Protected Sub Btn_Add_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Add.Click
        Response.Redirect("addForum.aspx")
    End Sub

    Protected Sub Btn_clearsubject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_clearsubject.Click
        Txt_name.Text = ""
        Txt_subject.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
        GridView1.DataBind()

        GridView1.PageIndex = Session("uid")
        Lab_Count.Text = CInt(Me.DetailsView1.Rows(0).Cells(0).Text) + CInt(Me.DetailsView2.Rows(0).Cells(0).Text)
    End Sub
    Protected Sub GridView1_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.PageIndexChanged
        Session("uid") = GridView1.PageIndex
    End Sub

    Protected Sub DetailsView3_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView3.DataBound
        If DetailsView3.Rows(0).Cells(0).Text <= 0 Then
            DetailsView3.Visible = False
        End If
    End Sub
End Class
