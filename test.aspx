<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript">
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-48175705-1', 'tmc1974.com');
        ga('send', 'pageview');
</script>
    <script type="text/javascript">
        function GATrack(EventCategory, TrackEvent, EventLabel) {
           // ga('send', 'event', EventCategory, TrackEvent, EventLabel);

	   ga('send', 'event', EventCategory, TrackEvent, EventLabel);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="button" name="btnOK" value="確定" onclick="GATrack('menu_new','click','menutest33');"/>
    </div>
    </form>
</body>
</html>
