<%
Thispage ="http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL") & "?" & Request.Querystring

response.write  Thispage

%>