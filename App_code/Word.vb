Public Class Word
    Private Shared ReadOnly defWordsBanned() As String = {"script", "eval", ".innerHTML", ".prepend", ".prototype", ".after", ".before", ".write", ".innerText", ".clone", ".createElement", ".append", ".type", ".setAttribute", ".src", ".insert", ".replace", ".ajax", ".load", ".unwrap", ".wrap", "function", "return", "escape", "codeURI", "\'", "\"""}
    Private Shared ReadOnly defRegexPatterns() As String = {"<iframe\s+[^\s]?", "<frameset\s+[^\s]?", "<frame\s+[^\s]?", "<form\s+[^\s]?", "<\S+\s+((\S+\s+)*|\s+)(on[a-zA-Z]{3,}\s*=)+", "\\x[0-9a-fA-F]{2}", "\\u[0-9a-fA-F]{4}"}
    Public Overloads Shared Function isIllegalWordsContains(ByVal inputString As String) As Boolean
        Return isIllegalWordsContains(inputString, Nothing, Nothing)
    End Function

    Public Overloads Shared Function isIllegalWordsContains(ByVal inputString As String, ByVal ExtraWords() As String, ByVal ExtraRegexPatterns() As String) As Boolean
        Dim rtnVal As Boolean = False
        If Not String.IsNullOrWhiteSpace(inputString) Then
            inputString = inputString.Trim()
            Dim WordsBanned() As String = defWordsBanned
            If ExtraWords IsNot Nothing AndAlso ExtraWords.Length > 0 Then
                WordsBanned = (From w In defWordsBanned Select w).Union(From e In ExtraWords Select e).ToArray()
            End If
            Dim RegexPatterns() As String = defRegexPatterns
            If ExtraRegexPatterns IsNot Nothing AndAlso ExtraRegexPatterns.Length > 0 Then
                RegexPatterns = (From p In defRegexPatterns Select p).Union(From e In ExtraRegexPatterns Select e).ToArray()
            End If
            For Each bWord As String In WordsBanned
                If inputString.IndexOf(bWord, StringComparison.OrdinalIgnoreCase) >= 0 Then
                    rtnVal = True
                End If
            Next
            For Each Pattern As String In RegexPatterns
                If Regex.IsMatch(inputString, Pattern, RegexOptions.IgnoreCase) Then
                    rtnVal = True
                End If
            Next
        End If
        Return rtnVal
    End Function
End Class
