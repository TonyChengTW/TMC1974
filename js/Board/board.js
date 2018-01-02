function GoPage(PageLink) {
    var PageID = "#" + PageLink;
    if ($(PageID)) {
        window.location.href = $(PageID).val();
    }
}
function GoSearch() {
    var listurl = '/board/board.aspx?page=1';
    if ($("#category").val() != '') {
        listurl += "&Category=" + $("#category").val();
    }
    if ($("#SearchKeyWord").val() != '') {
        listurl += "&SearchKeyWord=" + $.HTMLEncode($("#SearchKeyWord").val());
    }
    window.location.href = listurl;
}