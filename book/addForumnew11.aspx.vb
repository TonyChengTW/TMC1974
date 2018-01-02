Imports System.Data
Imports System.Data.OleDb
Partial Class addForum
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If  Request.Cookies("1974IsLogon") Is Nothing Then
            'Dim aCookie As HttpCookie = Request.Cookies("userName1")
           ' Label1.Text = Server.HtmlEncode(aCookie.Value)
      Response.redirect("LogonGbook.aspx")
        End If
    End Sub
    Protected Sub AddData(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
         Dim RComments As String = Me.FCKeditor1.Value
         Dim position As Integer
         'Response.Write("<script>alert(RComments);location='List.aspx';</script>") 

        If IsValid Then
          
              'if   (InStr(String.ToLower(RComments), "iframe") =0  AND  InStr(String.ToLower(RComments), "script") =0 ) then 
               

          
            Dim T1 As Date = Now()
            Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\tmctest.mdb")
            Dim Conn As New OleDbConnection(connectionString)

            Dim AddSQL As String = "INSERT INTO talk (who,subject,email,tel,msg,url,ip) VALUES ('" & Txt_who.Text & "','" & Txt_subject.Text & "','" & Txt_email.Text & "','" & Txt_tel.Text & "','" & RComments & "','" & Txt_web.Text & "','" & Request.ServerVariables("REMOTE_ADDR") & "')"
            Dim cmd As New OleDbCommand(AddSQL, Conn)
            Conn.Open()
            cmd.ExecuteNonQuery()
            Conn.Close()
 'Txt_tel.Text=RComments
            Response.Redirect("boardnew.aspx" )
           else
              'Response.Write("<script>alert('資料');location='List.aspx';</script>") 
               Response.Write("<script>alert('資料輸入錯')</script>") 
                ' Txt_tel.Text=RComments
                   Me.FCKeditor1.Focus()
            'End If  

        End If


    End Sub
    Sub AddText(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim img As ImageButton
        img = CType(sender, ImageButton)
        ' Me.Txt_msg.Text = Me.Txt_msg.Text & img.CommandName
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Clear.Click
        Txt_who.Text = ""
        Txt_subject.Text = ""
        Txt_email.Text = ""
        Txt_tel.Text = ""
        Me.FCKeditor1.Value=""
    End Sub

    Protected Sub Btn_Post_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Post.Click
        Server.Transfer("board.aspx")
    End Sub
End Class
