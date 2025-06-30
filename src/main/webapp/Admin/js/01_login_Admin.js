//변수
var booleanId = false;
var booleanPw = false;
var booleanRe = false;

$(document).ready(function(){
    $("#loginId").blur(function(){
    if (!nullCheck($(this))) {
        $("#mentId").text("아이디를 입력하세요");
        booleanId = false;
    } else {
        $("#mentId").text("");
        booleanId = true;
    }
    });

    $("#loginPw").blur(function(){
    if (!nullCheck($(this))) {
        $("#mentPw").text("비밀번호를 입력하세요");
        booleanPw = false;
    } else {
        $("#mentPw").text("");
        booleanPw = true;
    }
    });


    $("#loginBtn").click(function(e) {
        e.preventDefault();

        if (formCheck()) {
            $("form").submit();
        }
    
    });

    function nullCheck(obj) {
        if (!obj.val()) {
            return false;
        } else {
            return true;
        }
    }

    function formCheck() {
        if (!booleanId) {
            $("#loginId").focus();
            return false;
        }
        
        if (!booleanPw) {
            $("#loginPw").focus();
            return false;
        }

        return true;
    }
    
    });