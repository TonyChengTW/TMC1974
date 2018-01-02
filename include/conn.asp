<%		
		if isObject(conn) = false then
			Dim conn
			Set conn = Server.CreateObject("ADODB.Connection")
			conn.CommandTimeout=60
			conn.open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("\tmc2013.mdb")&";")
			Response.Charset = "Big5"
		end if
		if isObject(conn2) = false then
			Dim conn2
			Set conn2 = Server.CreateObject("ADODB.Connection")
			conn2.CommandTimeout=60
			conn2.open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("\book\App_Data\Tmc.mdb")&";")
			Response.Charset = "Big5"
		end if
      if isObject(conn) = false then
			Dim conn3
			Set conn3 = Server.CreateObject("ADODB.Connection")
			conn3.CommandTimeout=60
			conn3.open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("\tmc2012_member.mdb")&";")
			Response.Charset = "Big5"
		end if
%>