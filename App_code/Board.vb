Imports Microsoft.VisualBasic

Public Class Board
    Public Shared Function TransCategoryToValue(ByVal CategoryName As String) As String
        Dim CategoryValue As String = ""
        Dim strSQL As String = ""
        Dim objSQL As New SqlFunc()
        Dim connstr As String = ""
        connstr = (New WebConfig).ConnStr("Tmc").ToString
        strSQL = String.Format("Select CategoryID From RFCategory Where CategoryName={0}", SqlPara.Varchar(CategoryName))
        CategoryValue = objSQL.GetDataValue(connstr, strSQL)
        Return CategoryValue
    End Function
    Public Shared Function ShowCategory(ByVal CategoryID As String) As String
        Dim CategoryName As String = ""
        Dim strSQL As String = ""
        Dim objSQL As New SqlFunc()
        Dim connstr As String = ""
        connstr = (New WebConfig).ConnStr("Tmc").ToString
        strSQL = String.Format("Select CategoryName From RFCategory Where CategoryID={0}", SqlPara.Int(CategoryID))
        CategoryName = objSQL.GetDataValue(connstr, strSQL)
        If Not String.IsNullOrWhiteSpace(CategoryName) Then
            CategoryName = String.Format("【{0}】", CategoryName)
        End If

        Return CategoryName
    End Function

    Public Shared Function ReplaceLine(ByVal Content As String) As String
        'Content = Replace(Content, "<", "&lt;")
        'Content = Replace(Content, ">", "&gt;")
        Content = Replace(Content, vbNewLine, "<br/>")
        
        Return Content
    End Function

    Public Shared Function chkAccount(ByVal Account As String, ByVal Pwd As String) As Boolean
        Dim objSql As New SqlFunc
        Dim chkSQL As String = ""
        Dim U_ID As String = ""
        Dim rtnVal As Boolean = False
        Dim connstrDemo As String = (New WebConfig).ConnStr("demo").ToString

        chkSQL = String.Format("Select U_ID From Users Where U_Name={0} and U_Pwd={1}", SqlPara.Varchar(Account), SqlPara.Varchar(Pwd))
        U_ID = objSql.GetDataValue(connstrDemo, chkSQL)

        If Not String.IsNullOrEmpty(U_ID) Then
            rtnVal = True
        End If

        Return rtnVal

    End Function

End Class
