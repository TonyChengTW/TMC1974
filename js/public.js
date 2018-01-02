function isEMail(value) {
    var emailfilter = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    return (emailfilter.test(value));
}




function AppendPic(PicName) {
    $("#msg").val($("#msg").val() + PicName);
}
function isMaxLen(o) {
    var nMaxLen = o.getAttribute ? parseInt(o.getAttribute("maxlength")) : "";
    if (o.getAttribute && o.value.length > nMaxLen) {
        o.value = o.value.substring(0, nMaxLen)
    }
}

function delmsg(uid, re_uid,func)
{
    if (confirm("確定刪除留言?")) {
        location.href = "/board/replydel.aspx?uid=" + uid + "&re_uid=" + re_uid + "&func=" + func;
    }
}