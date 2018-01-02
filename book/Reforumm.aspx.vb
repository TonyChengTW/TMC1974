Imports System.Data
Imports System.Data.OleDb
Partial Class Re_tmc
    Inherits System.Web.UI.Page
    Dim Myuid As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
     
         
     If Not IsPostBack Then
             If  Request.Cookies("1974IsLogon") Is Nothing Then
            'Dim aCookie As HttpCookie = Request.Cookies("userName1")
           ' Label1.Text = Server.HtmlEncode(aCookie.Value)
            Response.redirect("LogonGbook.aspx")
        end if 
       else
            Dim ads As New AccessDataSource("~/App_Data/tmc.mdb", "")
            ads.UpdateCommand = "UPDATE [talk] SET hits =  hits + 1 WHERE [uid]= ?"
            ads.UpdateParameters.Add("uid", Request.QueryString("uid"))
            ads.Update()
      
        End If

        Page.Title = "台北健言社回覆討論區"
       
    End Sub
    Sub AddText(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs)
       
      
    End Sub
   Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        If CType(FormView1.FindControl("HyperLink2"), HyperLink).NavigateUrl = "" Then
            CType(FormView1.FindControl("HyperLink2"), HyperLink).Visible = False
        End If
        If CType(FormView1.FindControl("HyperLink3"), HyperLink).NavigateUrl = "mailto:" Then
            CType(FormView1.FindControl("HyperLink3"), HyperLink).Visible = False
        End If
    End Sub
    Protected Sub AddData(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Add.Click
       If IsValid Then

            Dim RComments As String = Me.FCKeditor1.Value
            
            Dim T1 As Date = Now()
            Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\Tmctest.mdb")
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
       Me.FCKeditor1.Value=""

        Dim ads As New AccessDataSource("~/App_Data/tmctest.mdb", "")
        ads.UpdateCommand = "UPDATE [talk] SET re = re + 1, newdcreate = ? WHERE uid = ?"
        ads.UpdateParameters.Add("newdcreate", DateTime.Now.ToString)
        ads.UpdateParameters.Add("uid", Request.QueryString("uid"))
        ads.Update()

    End Sub

    Protected Sub Btn_Clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Clear.Click
        Txt_who.Text = ""
        Txt_email.Text = ""
        Txt_tel.Text = ""
        
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
End Class
