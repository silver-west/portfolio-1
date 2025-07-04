//변수
let idDupCheck = false;
let nickDupCheck = false;
let booleanrePwCheck = false;

$(document).ready(function(){
    //bootStrap
    $("label").addClass("form-label text-start w-100");
    $(".idCheck, .nickCheck").addClass("btn btn-secondary");
    $("#mentId, #mentPw, #mentRe, #mentNick").addClass("mt-2 text-danger text-start w-100");
    $("#ment").addClass("mt-2 text-danger");


    //태그 속성
    $("#joinId").attr({
        "placeholder" : "아이디를 입력하세요",
        "type" : "text"
    });

    $("#joinPw").attr({
        "placeholder" : "비밀번호를 입력하세요",
    });

    $("#rePw").attr({
        "placeholder" : "한 번 더 입력하세요",
    });

    $("#joinNick").attr({
        "placeholder" : "닉네임을 입력하세요",
        "type" : "text"
    });

    //체크
    $(".idCheck").click(function(e) { 
        let inputId = $("#joinId").val();
        if (inputId == "" || !inputId) {
            $("#mentId").removeClass("text-success").addClass("text-danger");
           $("#mentId").text("아이디를 입력하세요");
           return; 
        }

        $.ajax({
            url: "IdCheck.do",
            method: "POST",
            data: { id: inputId },
            success: function (response) {
                if (response == "pass") {
                    idDupCheck = true;
                    $("#mentId").removeClass("text-danger").addClass("text-success");
                    $("#mentId").text("아이디 생성 가능");
                } else {
                    idDupCheck = false;
                    $("#mentId").removeClass("text-success").addClass("text-danger");
                    $("#mentId").text("중복된 아이디 입니다.");
                }
            }
        });
                
    });
    
    $(".nickCheck").click(function(e) {
        let inputNick = $("#joinNick").val();
        if (inputNick == "" || !inputNick) {
             $("#mentNick").removeClass("text-success").addClass("text-danger");
           $("#mentNick").text("닉네임을 입력하세요");
           return; 
        }

        $.ajax({
            url: "NickCheck.do",
            method: "POST",
            data: { nick: inputNick },
            success: function (response) {
                if (response == "pass") {
                    nickDupCheck = true;
                    $("#mentNick").removeClass("text-danger").addClass("text-success");
                    $("#mentNick").text("닉네임 설정 가능");
                } else {
                    nickDupCheck = false;
                    $("#mentNick").removeClass("text-success").addClass("text-danger");
                    $("#mentNick").text("중복된 닉네임 입니다.");
                }
            }
        });          
    });
    
    $("#rePw").on("input blur", rePwCheck);
    $("#joinPw").on("input blur", rePwCheck);
    $("#joinId, #joinPw, #rePw, #joinNick").on("input", function(){
		$("#ment").text("");
	});
    
    $("#submitBtn").click(function(e) {
        e.preventDefault();

        //1. null 체크
        if (!formCheck()) {
            return;
        }

        //2. 중복체크
        if (!idDupCheck) {
            $("#ment").text("아이디 중복 체크 확인");
            return;
        } else {
            $("#ment").text("");
        }
            
        if (!nickDupCheck) {
            $("#ment").text("닉네임 중복 체크 확인");
            return;
        } else {
            $("#ment").text("");
        }

        //3. 비번-비번확인 체크
        if (!booleanrePwCheck) {
			$("#rePw").focus();
			return;
		}
        
    
        $("form").submit();
    
    });
    
	function rePwCheck() {
		let pw = $("#joinPw").val();
        let re = $("#rePw").val();
        
        if (pw != re) {
            $("#mentRe").text("비밀번호가 다릅니다");
            booleanrePwCheck = false;
            return;
        } else {
			$("#mentRe").text("");
	        booleanrePwCheck = true;
		}
        
	}

    function formCheck() {
        if (!$("#joinId").val() || $("#joinId").val() == "") {
            $("#joinId").focus();
            return false;
        }
        
        if (!$("#joinPw").val() || $("#joinPw").val() == "") {
            $("#joinPw").focus();
            return false;
        }

        if (!$("#rePw").val() || $("#rePw").val() == "") {
            $("#rePw").focus();
            return false;
        }

        if (!$("#joinNick").val() || $("#joinNick").val() == "") {
            $("#joinNick").focus();
            return false;
        }

        return true;
    }

});
