$(document).ready(function () {
    $("#slider").easySlider({
        continuous: true,
        url: true
    });
});
function ClearKeyWord() {
        if ($("#GoogleKeyWord").val() == "請輸入關鍵字...") {
            $("#GoogleKeyWord").val("");
        }
        else if($("#GoogleKeyWord").val()==""){
            $("#GoogleKeyWord").val("請輸入關鍵字...");
        }
}