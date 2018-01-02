$(function () {
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
            msg: { required: true, chkMsg: true },
            checkcode: { required: true }
        },
        messages: {
            who: { required: "請輸入姓名" },
            msg: { required: "請輸入內容", chkMsg: "請勿輸入非法字元",chkTextLength:"輸入內容不可超過20000個字!"},
            checkcode: { required: "請輸入驗證碼" }
        }
        , onfocusout: function (element) {
            // $(element).valid();
        }

    });

});
$.validator.addMethod(
"chkEmail",
function (value, element) {
    if (value != '') {
        if (!isEMail(value)) {
            return false;
        }
        else {
            return true;
        }
    }
});

$.validator.addMethod(
"chkMsg",
function (value, element) {
    var rtnval = true;
    if (value != '') {

        para = { msg: $("#msg").val() }
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

});

$.validator.addMethod(
"chkWordLength",
function (value, element) {
    if ($("#msg").val().length > 20000) {
        return false;
    } else {
        return true;
    }
});

function Save() {

    if ($("#form1").valid()) {
        para = {
            who: $("#who").val(),
            msg: $.HTMLEncode($("#msg").val().replace(/\n/g, "<br/>")),
            contactway: $("#contactway").val(),
            checkCode: $("#checkcode").val(),
            uid: $("#uid").val(),
            addType: '2'
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

