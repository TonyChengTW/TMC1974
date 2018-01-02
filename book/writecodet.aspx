<%@ Page Language="VB" AutoEventWireup="false" CodeFile="writecodet.aspx.vb" Inherits="writecodet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
</head>
<body>
    <form id="form1" runat="server">
        <span style="font-size: 14pt">Imports System.Data.OleDb
            <br />
            Imports System.Data
            <br />
            Partial Class Test Inherits System.Web.UI.Page<br />
            <br />
            Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles
            Me.Load
            <br />
            Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source="
            &amp; Server.MapPath("App_Data\Tmccount.mdb"))
            <br />
            Dim comm As New OleDbCommand
            <br />
            comm.Connection = conn
            <br />
            comm.CommandText = "Select * from tmcdate"
            <br />
            Dim mydatedatareader As OleDbDataReader
            <br />
            conn.Open()
            <br />
            mydatedatareader = comm.ExecuteReader
            <br />
            Do While mydatedatareader.Read For i As Integer = 0 To mydatedatareader.FieldCount
            - 1
            <br />
            Label1.Text = mydatedatareader.Item(i)
            <br />
            Next Loop
            <br />
            mydatedatareader.Close() conn.Close()<br />
            <br />
            Dim myconn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source="
            &amp; Server.MapPath("App_Data\tmc.mdb"))
            <br />
            Dim mycomm As OleDbCommand = New OleDbCommand("SELECT talk.who AS 人名,COUNT(talk.who)
            +(SELECT COUNT(talkre.re_who) FROM talkre WHERE talkre.dcreate &gt;" &amp; Label1.Text
            &amp; "and talkre.re_who=talk.who ) AS 合計 FROM talk WHERE (talk.dcreate &gt;" &amp;
            Label1.Text &amp; ") GROUP BY talk.who", myconn)
            <br />
            Dim myadapter As OleDbDataAdapter = New OleDbDataAdapter
            <br />
            myadapter.SelectCommand = mycomm
            <br />
            myconn.Open()
            <br />
            Dim myDataSet As DataSet = New DataSet
            <br />
            myadapter.Fill(myDataSet, "討論區排行榜")
            <br />
            Dim mydatatable As DataTable = myDataSet.Tables("討論區排行榜")
            <br />
            For i As Integer = 0 To mydatatable.Columns.Count - 1
            <br />
            Response.Write(mydatatable.Columns(i).ColumnName &amp; vbTab)
            <br />
            Next
            <br />
            Response.Write("&lt;br/&gt;")
            <br />
            For k As Integer = 0 To mydatatable.Rows.Count - 1
            <br />
            &nbsp;&nbsp; For j As Integer = 0 To mydatatable.Columns.Count - 1
            <br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Response.Write(mydatatable.Rows(k).Item(j)
            &amp; vbTab)
            <br />
            &nbsp; &nbsp; Next
            <br />
            Response.Write("&lt;br/&gt;")
            <br />
            Next
            <br />
            myconn.Close()
            <br />
            End Sub<br />
            <br />
            Protected Sub Calen_SelectDate_SelectionChanged(ByVal sender As Object, ByVal e
            As System.EventArgs) Handles Calen_SelectDate.SelectionChanged
            <br />
            Lab_SelectDate.Text = Calen_SelectDate.SelectedDate
            <br />
            End Sub<br />
            <br />
            <span style="font-size: 12pt"><span style="font-size: 14pt">Protected Sub Btn_DateUpdate_Click(ByVal
                sender As Object, ByVal e As System.EventArgs) Handles Btn_DateUpdate.Click
                <br />
                Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source="
                &amp; Server.MapPath("App_Data\Tmccount.mdb"))
                <br />
                Dim comm As New OleDbCommand
                <br />
                comm.Connection = conn
                <br />
                comm.CommandText = "UPDATE tmcdate SET datecount=" &amp; "#" &amp; Lab_SelectDate.Text
                &amp; "#" &amp; "where uid=1"
                <br />
                Response.Write(comm.CommandText &amp; "&lt;br/&gt;")
                <br />
                Dim records As Integer
                <br />
                conn.Open() records = comm.ExecuteNonQuery()
                <br />
                conn.Close()
                <br />
                Response.Write("您己成功的更新一筆資料：" &amp; records)
                <br />
                End Sub
                <br />
                End Class</span></span></span>
    </form>
</body>
</html>
