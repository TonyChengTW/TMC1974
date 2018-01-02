<%@ WebHandler Language="VB" Class="CreateImage" %>

Imports System
Imports System.Web

Public Class CreateImage : Implements IHttpHandler
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        CreateCheckCodeImage(GenerateCheckCode())
    End Sub
 
    Public Function GenerateCheckCode() As String
        Dim number As Integer
        Dim code As Char
        Dim checkCode As String = String.Empty
        Dim random As System.Random = New Random()
        '要製造出幾個驗證碼
        For i As Integer = 0 To 3
            'number = random.[Next]()
            number = random.Next
            '亂數決定哪一個是數字或字母
            If number Mod 2 = 0 Then
                code = CChar(ChrW(Asc("0") + (number Mod 10)))
            Else
                code = CChar(ChrW(Asc("A") + (number Mod 26)))
            End If
            checkCode += code.ToString()
        Next
        '寫入Cook
       
        HttpContext.Current.Response.Cookies.Add(New HttpCookie("CheckCode", checkCode))
        Return checkCode
    End Function
    Public Sub CreateCheckCodeImage(ByVal checkCode As String)
        If checkCode Is Nothing OrElse checkCode.Trim() = [String].Empty Then
            Return
        End If

        Dim image As New System.Drawing.Bitmap(100, 30)

        Dim g As Graphics = Graphics.FromImage(image)

        Try
            '生成隨機生成器
            Dim random As New Random()

            '清空圖片背景色
            g.Clear(Color.White)

          

            Dim font As Font = New System.Drawing.Font("Arial", 22, (System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Italic))
            Dim brush As New System.Drawing.Drawing2D.LinearGradientBrush(New Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.Black, 1.2F, True)
            g.DrawString(checkCode, font, brush, 2, 2)

            '畫圖片的邊框線
            g.DrawRectangle(New Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1)

            Dim ms As New System.IO.MemoryStream()
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif)
            HttpContext.Current.Response.ClearContent()
            HttpContext.Current.Response.ContentType = "image/Gif"
            HttpContext.Current.Response.BinaryWrite(ms.ToArray())
        Finally
            g.Dispose()
            image.Dispose()
        End Try
    End Sub
    
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property
    

End Class