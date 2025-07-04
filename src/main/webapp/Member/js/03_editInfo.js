
$(document).ready(function() {
    //변수
    const defaultNick = $("#editNick").val();
    
    let chanePw = false;
    let chaneRe = false;
    let chaneNick = false;
    
    let nickDupCheck = false;

    //bootStrap
    $("label").addClass("form-label text-start w-100");
    $(".nickCheck").addClass("btn btn-secondary");
    $("#mentPw, #mentRe, #mentNick").addClass("mt-2 text-danger text-start w-100");
    $("#ment").addClass("mt-2 text-danger");
    $("input").addClass("form-control");


    //태그 속성
    $("#editPw").attr({
        "placeholder" : "비밀번호를 입력하세요",
        "type" : "password"
    });

    $("#rePw").attr({
        "placeholder" : "한 번 더 입력하세요",
        "type" : "password"
    });

    $("#editNick").attr({
        "placeholder" : "닉네임을 입력하세요",
        "type" : "text"
    });

    //값 바꿨는지 확인
    $("#editPw").on("input", function (){
       chanePw = true; 
    });
    $("#rePw").on("input", function (){
       chaneRe = true; 
    });
    $("#editNick").on("input", function (){
       chaneNick = true; 
    });

    //체크
    $("#editPw, #rePw, #editNick").on("input", function(){
			$("#mentPw, #mentRe, #mentNick, #ment").text("");
	});
	
    $(".nickCheck").click(function(e) { //중복체크 (나중에..)
        e.preventDefault();
		
		let inputNick = $("#editNick").val();
        if (chaneNick) {
            if (inputNick == "" || !inputNick) {
                 $("#mentNick").removeClass("text-success").addClass("text-danger");
               $("#mentNick").text("닉네임을 입력하세요");
               return; 
            }
    
            if (inputNick != defaultNick) {
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
            } else {
                $("#mentNick").text("현재 닉네임과 같습니다(계속 사용 가능)");
                nickDupCheck = true;
                return;
            }
        } else {
            $("#mentNick").text("현재 닉네임과 같습니다(계속 사용 가능)");
            nickDupCheck = true;
            return;
        }
                
    });
    
    
    $("#submitBtn").click(function(e) {
        e.preventDefault();

        let pw = $("#editPw").val();
        let re = $("#rePw").val();
        let nick = $("#editNick").val();
    
        if (chanePw && pw == "") {
            $("#editPw").focus();
            $("#mentPw").text("비밀번호를 입력하세요");
            
            return;
        }
        if (chaneRe && re == "") {
            $("#rePw").focus();
            $("#mentRe").text("한 번 더 입력하세요");
            
            return;
        }
        if (chaneNick && nick == "") {
            $("#editNick").focus();
            $("#mentNick").text("닉네임을 입력하세요");
            
            return;
        }

        //비밀번호 체크
        if (chanePw || chaneRe) {
	        if (pw != re) {
	            $("#rePw").focus();
	            $("#mentRe").text("입력하신 비밀번호와 다릅니다");
	            
	            return;
	        } 	
		}

        //닉네임 체크
        if (!nickDupCheck && chaneNick) {
            $("#ment").text("닉네임 중복 체크 확인");

            return;
        }
		
        $("form").submit();
    });


});


    

