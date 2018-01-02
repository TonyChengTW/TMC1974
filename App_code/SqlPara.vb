Public Class SqlPara

    Shared Function Varchar(ByVal Para As String) As String
        If String.IsNullOrEmpty(Para) Then Para = ""
        Return "'" & Para.Replace("'", "''") & "'"
    End Function

    Shared Function Int(ByVal Para As String) As String
        If String.IsNullOrEmpty(Para) Then
            Return "Null"
        Else
            If Not IsNumeric(Para) Then
                Return "Null"
            Else
                Return Para
            End If
        End If
    End Function

    Shared Function DateTime(ByVal Para As String) As String
        If String.IsNullOrEmpty(Para) Then
            Return "Null"
        Else
            If Not IsDate(Para) Then

            End If
            Return "#" & Para & "#"
        End If
    End Function

    Shared Function LikeString(ByVal Para As String) As String
        If String.IsNullOrEmpty(Para) Then Para = ""
        Return Para.Replace("'", "''")
    End Function

End Class

