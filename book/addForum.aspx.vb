Imports System.Data
Imports System.Data.OleDb
Partial Class addForum
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Redirect("http://www.tmc1974.com")
        Dim img As ImageButton
        Dim i As Integer
        For i = 0 To 33
            img = New ImageButton
            img.ID = "pic" & i
            img.ImageUrl = "images/" & i.ToString("0") & ".gif"
            img.CommandName = "[pic" & i & "]"
            AddHandler img.Click, AddressOf AddText
            Me.Panel1.Controls.Add(img)
            Dim lit As Literal
            lit = New Literal
            lit.Text = "&nbsp;&nbsp;"
            Me.Panel1.Controls.Add(lit)
        Next
    End Sub
    Protected Sub AddData(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("http://www.tmc1974.com")
        'If IsValid Then
        '    Dim RComments As String = Txt_msg.Text
        '    RComments = Replace(RComments, "<", "&lt;")
        '    RComments = Replace(RComments, ">", "&gt;")
        '    RComments = Replace(RComments, vbCrLf, "<br>")
        '    For i As Integer = 0 To 33
        '        RComments = Replace(RComments, "[pic" & i & "]", "<img border=0 src=images/" & i & ".gif>")
        '    Next
        '    Dim T1 As Date = Now()
        '    Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\Tmc.mdb")
        '    Dim Conn As New OleDbConnection(connectionString)

        '    Dim AddSQL As String = "INSERT INTO talk (who,subject,email,tel,msg,url,ip) VALUES ('" & Txt_who.Text & "','" & Txt_subject.Text & "','" & Txt_email.Text & "','" & Txt_tel.Text & "','" & RComments & "','" & Txt_web.Text & "','" & Request.ServerVariables("REMOTE_ADDR") & "')"
        '    Dim cmd As New OleDbCommand(AddSQL, Conn)
        '    Conn.Open()
        '    cmd.ExecuteNonQuery()
        '    Conn.Close()
        '    Response.Redirect("board.aspx")
        'End If


    End Sub
    Sub AddText(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim img As ImageButton
        img = CType(sender, ImageButton)
        Me.Txt_msg.Text = Me.Txt_msg.Text & img.CommandName
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Clear.Click
        Response.Redirect("http://www.tmc1974.com")
        Txt_who.Text = ""
        Txt_subject.Text = ""
        Txt_email.Text = ""
        Txt_tel.Text = ""
        Txt_msg.Text = ""
    End Sub

    Protected Sub Btn_Post_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Post.Click
        Response.Redirect("http://www.tmc1974.com")
        'Server.Transfer("board.aspx")
    End Sub
End Class
