Public Class WebConfig
    Private _ConnStr As String = ""
    Private _DBName As String = ""
    Sub New()

    End Sub
    Public Function ConnStr(ByVal ConnectionName As String) As String
        _DBName = String.Format("/book/App_data/{0}.mdb", ConnectionName)
        _ConnStr = String.Format("Provider=Microsoft.Jet.OLEDB.4.0;data source={0};Persist Security Info=False;", HttpContext.Current.Server.MapPath(_DBName))
        Dim rootWebConfig As System.Configuration.Configuration
        rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/")

        If (rootWebConfig.ConnectionStrings.ConnectionStrings.Count > 0) Then
            rootWebConfig.ConnectionStrings.ConnectionStrings(ConnectionName).ConnectionString = _ConnStr
        End If
        Return _ConnStr
    End Function
End Class
