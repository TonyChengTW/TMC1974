<%@ WebHandler Language="VB" Class="chkIllegalWords" %>

Imports System
Imports System.Web

Public Class chkIllegalWords : Implements IHttpHandler
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        context.Response.ContentType = "text/plain"
        Dim msg As String = ""
        msg = context.Request("msg")
        If Word.isIllegalWordsContains(msg) = True Then
            context.Response.Write("Y")
        Else
            context.Response.Write("N")
        End If
    End Sub
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class