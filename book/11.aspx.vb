
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink1.NavigateUrl = "http://dfdsf.aspx?uid=" + Request.QueryString("uid")

    End Sub
End Class

