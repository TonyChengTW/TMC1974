<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage=65001%>
<%
Set conn = Server.CreateObject("ADODB.Connection") 
DBPath = Server.MapPath("\tmc2013.mdb")
conn.Open "driver={Microsoft Access Driver (*.mdb)};dbq=" & DBPath


 Set rs = Server.CreateObject("ADODB.Recordset")



sql="select *  from  new where releasedate >=#2013/08/07# order by releasedate  "  
'sqlb="Select top 1 [title] from [new] where [category]=1 and (startdate<=now()) And (enddate>=now()) order by [cdate] desc"
'sql="select top 1 title from new where category =2 and (startdate<=now()) And (enddate>=now()) order by cdate desc"
 
rs.Open Sql,conn

%>

    <% while not rs.eof  %>
<% response.write  rs(0) & "</br>" %>
<% response.write  rs(2) & "</br>" %>
 <% rs.movenext %>
 <% wend %>