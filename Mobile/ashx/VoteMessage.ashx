<%@ WebHandler Language="VB" Class="VoteMessage" %>

Imports System
Imports System.Web

Public Class VoteMessage : Implements IHttpHandler
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        context.Response.ContentType = "text/plain"
        
        Dim connstr As String = ""
        Dim SpeakerID As String = ""
        Dim VoteName As String = ""
        Dim VoteMessage As String = ""
        Dim strSQL As New StringBuilder
        Dim objSQL As New SqlFunc()
        
        SpeakerID = context.Request("SpeakerID")
        VoteName = context.Request("VoteName")
        VoteMessage = context.Request("VoteMessage")
        
        connstr = (New WebConfig).ConnStr("TMCMobile").ToString
        
        strSQL.AppendLine("Insert Into VoteMessage(SpeakerID,VoteName,VoteMessage) ")
        strSQL.AppendFormat(" Values({0},{1},{2})", SqlPara.Int(SpeakerID), SqlPara.Varchar(VoteName), SqlPara.Varchar(VoteMessage))
        
        objSQL.ExecuteSQL(connstr, strSQL.ToString)
        
        context.Response.Write("1")
        
    End Sub
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class