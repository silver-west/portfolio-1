
$(document).ready(function(){
	$("#loginId").on("blur", idCheck);
	$("#loginPw").on("blur", pwCheck);
	$("#loginPw, #loginId").on("input", function() {
		$("#ment").text("");
	});

    $("#loginBtn").click(function(e) {
        e.preventDefault();

        let inputId = $("#loginId").val();
        let inputPw = $("#loginPw").val();

        if (!idCheck() || !pwCheck()) {
			if (!idCheck()) {
				$("#loginId").focus();
			} else {
				$("#loginPw").focus();
			}
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
                    $("#ment").text("아이디, 비밀번호가 틀립니다");
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
	
	function idCheck() {
        if (nullCheck($("#loginId"))) {
            $("#mentId").text("아이디를 입력하세요");
            return;
        } else {
			$("#mentId").text("");
			return true;
		}	
	}
	
	function pwCheck() {
        if (nullCheck($("#loginPw"))) {
            $("#mentPw").text("비밀번호를 입력하세요");
            return;
        } else {
			$("#mentPw").text("");
			return true;
		}
	}
	
    
    });