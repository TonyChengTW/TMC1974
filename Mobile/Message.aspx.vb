
Partial Class Mobile_Message
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim SpeakerID As String = ""
        Dim Week As String = ""

        SpeakerID = Request("SpeakerID")
        Week = Request("Week")

        hidSpeakerID.Value = SpeakerID
        hidWeek.Value = Week

    End Sub
End Class
