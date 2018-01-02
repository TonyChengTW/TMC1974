Imports System.Data
Imports System.Data.OleDb
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HyperLink4.NavigateUrl = "Reforumnew.aspx?uid=" + Request.QueryString("uid")
        If Not IsPostBack Then
            Dim ads As New AccessDataSource("~/App_Data/tmc.mdb", "")

            ads.UpdateCommand = "UPDATE [talk] SET hits =  hits + 1 WHERE [uid]= ?"
            ads.UpdateParameters.Add("uid", Request.QueryString("uid"))
            ads.Update()

        End If


        Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\TMC.mdb")
        Dim objConn As New OleDbConnection(connectionString)
        Dim ssqrl As String
        ssqrl = "SELECT * FROM [talk] WHERE [uid]=" + Request.QueryString("uid")
        Dim objCmd As New Data.OleDb.OleDbCommand(ssqrl, objConn)
        Dim rd As System.Data.OleDb.OleDbDataReader

        objConn.Open()
        rd = objCmd.ExecuteReader()
        rd.Read()



        Dim tag As HtmlMeta = New HtmlMeta()
        Page.Title = rd.Item("subject")
        tag.Name = "description"
        tag.Content = rd.Item("msg")
        Header.Controls.Add(tag)

        rd.Close()
        objConn.Close()
        'Page.Title = "台北健言社回覆討論區"
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
    Sub AddText(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim img As ImageButton
        img = CType(sender, ImageButton)
        Me.Txt_msg.Text = Me.Txt_msg.Text & img.CommandName
    End Sub
    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        'If CType(FormView1.FindControl("HyperLink2"), HyperLink).NavigateUrl = "" Then
        '    CType(FormView1.FindControl("HyperLink2"), HyperLink).Visible = False
        'End If
        'If CType(FormView1.FindControl("HyperLink3"), HyperLink).NavigateUrl = "mailto:" Then
        '    CType(FormView1.FindControl("HyperLink3"), HyperLink).Visible = False
        'End If
    End Sub
    Protected Sub AddData(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Add.Click
        If IsValid Then
            Dim RComments As String = Txt_msg.Text
            RComments = Replace(RComments, "<", "&lt;")
            RComments = Replace(RComments, ">", "&gt;")
            RComments = Replace(RComments, vbCrLf, "<br>")
            For i As Integer = 0 To 33
                RComments = Replace(RComments, "[pic" & i & "]", "<img border=0 src=images/" & i & ".gif>")
            Next
            Dim T1 As Date = Now()
            Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\Tmc.mdb")
            Dim Conn As New OleDbConnection(connectionString)
            Dim Addcreate As String = "UPDATE talk SET newdcreate='" & T1 & "' WHERE " & ("talk.uid =" & Request("uid")) & ""
            Dim AddSQL As String = "INSERT INTO talkRe (uid,re_who,re_email,re_tel,re_msg,re_url) VALUES ('" & Request("uid") & "','" & Txt_who.Text & "','" & Txt_email.Text & "','" & Txt_tel.Text & "','" & RComments & "','" & Txt_web.Text & "')"
            Dim cmd As New OleDbCommand(AddSQL, Conn)
            Dim cmddate As New OleDbCommand(Addcreate, Conn)
            Conn.Open()
            cmd.ExecuteNonQuery()
            cmddate.ExecuteNonQuery()
            Conn.Close()
            GridView1.DataBind()
        End If
        Txt_who.Text = ""
        Txt_email.Text = ""
        Txt_tel.Text = ""
        Txt_msg.Text = ""

        Dim ads As New AccessDataSource("~/App_Data/tmc.mdb", "")
        ads.UpdateCommand = "UPDATE [talk] SET re = re + 1, newdcreate = ? WHERE uid = ?"
        ads.UpdateParameters.Add("newdcreate", DateTime.Now.ToString)
        ads.UpdateParameters.Add("uid", Request.QueryString("uid"))
        ads.Update()

    End Sub

    Protected Sub Btn_Clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Clear.Click
        Txt_who.Text = ""
        Txt_email.Text = ""
        Txt_tel.Text = ""
        Txt_msg.Text = ""
    End Sub

    Protected Sub Btn_Back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Post.Click
        Response.Redirect("board.aspx")
    End Sub

    Protected Sub BtnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnBack.Click
        Response.Redirect("board.aspx")
    End Sub

    Protected Sub Btnindex1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btnindex1.Click
        Session("uid") = 0
        Response.Redirect("board.aspx")
    End Sub

    Protected Sub Btnindex2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btnindex2.Click
        Session("uid") = 0
        Response.Redirect("board.aspx")
    End Sub
    Protected Sub metadata()

       
       

    End Sub
End Class
