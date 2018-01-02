Imports System.Data
Imports System.Data.OleDb
Partial Class Createemployees
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("App_Data\Custom.mdb")
        Dim Conn As New OleDbConnection(connectionString)
        Dim AddSQL As String = "INSERT INTO employees(workpeople) VALUES ('" & TextBox1.Text & "')"
        Dim cmd As New OleDbCommand(AddSQL, Conn)
        Conn.Open()
        cmd.ExecuteNonQuery()
        Conn.Close()
        GridView1.DataBind()
        TextBox1.Text = ""
    End Sub

End Class
