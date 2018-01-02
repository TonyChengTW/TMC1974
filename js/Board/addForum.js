

$(document).ready(function () {
   
    var addType = '';
    addType = $("#addType").val();
    if (addType == '2') {
        $("#trPic").hide();
    }

    if (addType == '2') {
        tinyMCE.init({
            mode: "textareas",
            language: 'zh_TW',
            plugins: ["textcolor,image"],
            fontsize_formats: "8pt 9pt 10pt 11pt 12pt 26pt 36pt",
            theme: 'modern',
            toolbar: " fontsize | bold italic | alignleft aligncenter alignright alignjustify |link image |backcolor forecolor | fontsizeselect",
			menubar: false,
            statusbar: false
        });
    }

    $("#form1").validate({

        invalidHandler: function (form, validator) {
            var errors = validator.numberOfInvalids();
            invalidElements = validator.invalidElements();
            if (errors) {
                validator.errorList[0].element.focus();
            }
        },
        errorPlacement: function (error, element) {
            var strerr = $(error).text();
            $("#err" + element.attr("name")).html(strerr);
            $("#err" + element.attr("name")).show();

        },
        unhighlight: function (element, errorClass, validClass) {
            $("#err" + $(element).attr("name")).hide();
        },
        highlight: function (element, errorClass, validClass) {
            $("#err" + $(element).attr("name")).show();
        },
        rules: {
            who: { required: true },
            subject: { required: true },
            category: { required: true },
            checkcode: { required: true },
        },
        messages: {
            who: { required: "請輸入姓名" },
            subject: { required: "請輸入主題" },
            category: { required: "請選擇分類" },
            checkcode: { required: "請輸入驗證碼" }
        }
        , onfocusout: function (element) {
           
        }

    });

});

function getMsgContent() {
    var addType = '';
    var msgcontent = '';
   
    addType = $("#addType").val();

    if (addType == '1') {
        msgcontent = $("#msg").val().replace(/\n/g, "<br/>");
    }
    else if (addType == '2') {
        msgcontent = tinyMCE.get('msg').getContent();
    }
   
    return msgcontent;
}

function Save() {
    var IsChkMsg = false;
    IsChkMsg = chkForm();
    if ($("#form1").valid() && IsChkMsg == true) {
        para = {
            addType: '1',
            who: $("#who").val(),
            subject: $("#subject").val(),
            msg: $.HTMLEncode(getMsgContent()),
            contactway: $("#contactway").val(),
            category: $("#category").val(),
            checkcode: $("#checkCode").val()
        };

        $.ajax({
            type: "POST",
            url: "/Ashx/addForum.ashx",
            cache: false,
            async: true,
            data: para,
            success: function (data, status) {

                if (data == 'Y') {
                    window.location.href = '/board/board.aspx';
                } else {
                    alert(data);
                }
            },
            error: function (data, status, e) {
                event.preventDefault();
            }
        });
    }
}

function getStats(id) {
    var body = tinymce.get(id).getBody(), text = tinymce.trim(body.innerText || body.textContent);

    return {
        chars: text.length,
        words: text.split(/[\w\u2019\'-]+/).length
    };
}

function chkTextLength() {
    var addType = '';
    addType = $("#addType").val();
    if (addType == '1') {
        if ($("#msg").val().length > 20000) {
            return false;
        }
    } else if(addType=='2') {
        if (getStats('msg').chars > 20000) {
            return false;
        }
    }
    return true;
}

function chkForm() {
    var rtnval;
    var msgcontent = '';
    msgcontent = getMsgContent();
    if (msgcontent == '') {
        $("#errmsg").html("請輸入內容!");
        $("#errmsg").show();
        rtnval = false;
    } else {
        
        if (chkMsgWord(msgcontent) == false) {
            $("#errmsg").html("請勿輸入非法字元!");
            $("#errmsg").show();
            rtnval = false;
        } else {
            if (chkTextLength() == false) {
                $("#errmsg").html("輸入內容不可超過20000個字!");
                $("#errmsg").show();
                rtnval = false;
            } else {
                $("#errmsg").hide();
                $("#errmsg").html("");
                rtnval = true;
            }
        }
    }
    return rtnval;
}

function chkMsgWord(msgcontent) {
    var rtnval = true;
    if (msgcontent != '') {
        para = { msg: msgcontent }
        $.ajax({
            type: "POST",
            url: "/Ashx/chkIllegalWords.ashx",
            cache: false,
            async: false,
            data: para,
            success: function (data, status) {
                if (data == 'N') {
                    rtnval = true;

                }
                else if (data == 'Y') {
                    rtnval = false;

                }
            },
            error: function (data, status, e) {
                event.preventDefault();
            }
        });
    }
    return rtnval;
}