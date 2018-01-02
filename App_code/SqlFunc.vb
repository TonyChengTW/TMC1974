Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.Odbc
Imports System.Data.OleDb

Public Class SqlFunc
    Implements IDisposable
    Public Function GetDataSetBySQL(ByVal strConn As String, ByVal strCommandText As String) As DataSet
        Dim ds As New DataSet
        Dim SqlCmd As New OleDbCommand
        Using Conn As New OleDbConnection(strConn)
            Try
                SqlCmd.CommandTimeout = 30
                SqlCmd.CommandType = CommandType.Text
                SqlCmd.CommandText = strCommandText

                SqlCmd.Connection = Conn
                Using da As New OleDbDataAdapter
                    da.SelectCommand = SqlCmd
                    da.Fill(ds)
                End Using
            Catch ex As Exception
            Finally
                If Conn.State = ConnectionState.Open Then
                    Conn.Close()
                End If
                SqlCmd.Connection = Nothing
                SqlCmd.Dispose()
            End Try
        End Using

        Return ds
    End Function
    Public Function ExecuteSQL(ByVal strConn As String, ByVal strSqlStmt As String) As Integer
        Dim SqlCmd As New OleDbCommand(strSqlStmt)
        Dim intResult As Integer = 0
        Using Conn As New OleDbConnection(strConn)
            Try

                SqlCmd.Connection = Conn
                Conn.Open()
                intResult = SqlCmd.ExecuteNonQuery()

            Catch ex As Exception
            Finally
                If Conn.State = ConnectionState.Open Then
                    Conn.Close()
                End If
                SqlCmd.Connection = Nothing
                SqlCmd.Dispose()
            End Try
        End Using
        Return String.Format("{0}", intResult)
    End Function
    Public Function GetDataValue(ByVal strConn As String, ByVal strSqlStmt As String) As String
        Dim SqlCmd As New OleDbCommand(strSqlStmt)
        Dim dbResult As Object = Nothing
        Using Conn As New OleDbConnection(strConn)
            Try

                SqlCmd.Connection = Conn
                Conn.Open()
                dbResult = SqlCmd.ExecuteScalar()

            Catch ex As Exception
            Finally
                If Conn.State = ConnectionState.Open Then
                    Conn.Close()
                End If
                SqlCmd.Connection = Nothing
                SqlCmd.Dispose()
            End Try
        End Using
        Return String.Format("{0}", dbResult)
    End Function
    Public Sub Dispose() Implements IDisposable.Dispose
        GC.SuppressFinalize(Me)
    End Sub
End Class
