
$(document).ready(function(){

    $("#loginBtn").click(function(e) {
        e.preventDefault();

        let inputId = $("#loginId").val();
        let inputPw = $("#loginPw").val();

        if (!formCheck()) {
            return;
        }

        $.ajax({
            url: "AdminCheck.do",
            method: "POST",
            data: { id : inputId, pw : inputPw },
            success: function(response) {
                if (response == "pass") {
                    $("form").submit();
                } else {
                    $("#ment").text("아이디, 비번이 틀립니다");
                    return;
                }
            }
        });
    
    });

    function nullCheck(obj) {
        if (obj.val()) {
            return false;
        } else {
            return true;
        }
    }

    function formCheck() {
        if (nullCheck($("#loginId"))) {
            $("#loginId").focus();
            $("#mentId").text("아이디를 입력하세요");
            return false;
        } else {
			$("#mentId").text("");
		}
        
        if (nullCheck($("#loginPw"))) {
            $("#loginPw").focus();
            $("#mentPw").text("비밀번호를 입력하세요");
            return false;
        } else {
			$("#mentPw").text("");
		}

        return true;
    }
    
    });