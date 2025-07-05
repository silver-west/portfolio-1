//변수
var booleanId = false;
var booleanPw = false;
var booleanRe = false;

$(document).ready(function(){
    //bootStrap
    $(".login-box").addClass("container-fluid d-flex justify-content-center mb-5");
    $(".joinForm").addClass("my-3 pt-1");
    $("label").addClass("form-label text-start w-100");
    $("#mentId, #mentPw").addClass("mt-2 text-danger text-start w-100");


    //태그 속성
    $("#loginId").attr({
        "placeholder" : "아이디를 입력하세요",
        "type" : "text"
    });

    $("#loginPw").attr({
        "placeholder" : "비밀번호를 입력하세요",
        "type" : "password"
    });

    
    //체크
    $("#loginId").on("blur input", function(){
		$("#loginMent").text("");
	    if (!nullCheck($(this))) {
	        $("#mentId").text("아이디를 입력하세요");
	        booleanId = false;
	    } else {
	        $("#mentId").text("");
	        booleanId = true;
	    }
    });

    $("#loginPw").on("blur input", function(){
		$("#loginMent").text("");
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

        let inputId = $("#loginId").val();
        let inputPw = $("#loginPw").val();

        if (!formCheck()) {
            return;
        }

        $.ajax({
            url: "LoginCheck.do",
            method: "POST",
            data: { id: inputId, pw: inputPw },
            success: function(response) {
                if (response == "pass") {
                    $("form").submit();
                } else {
                    $("#loginMent").text("아이디, 비밀번호가 다릅니다");
                    
                    return;
                }
            }
        });
    
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