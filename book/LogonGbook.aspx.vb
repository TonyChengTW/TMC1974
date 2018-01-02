
Partial Class Default7
    Inherits System.Web.UI.Page




Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

             if  Request("kind")="add" then
               Response.Redirect("addForumnew.aspx")
             else
               Response.Redirect("Reforumnew.aspx?uid=" & Request("uid"))
             end if 
    End Sub
End Class
