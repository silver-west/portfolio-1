
$(document).ready(function() {

    //bootStrap
    $("label").addClass("form-label text-start w-100");
    $(".nickCheck").addClass("btn btn-secondary");
    $("#mentPw, #mentRe, #mentNick").addClass("mt-2 text-danger text-start w-100");
    $("#ment").addClass("mt-2 text-danger fs-3");
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

    //변수
    const defaultPW = $("#editPw").val();
    const defaultRe = $("#rePw").val();
    const defaultNick = $("#editNick").val();

    let chanePw = false;
    let chaneRe = false;
    let chaneNick = false;

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
    $(".nickCheck").click(function(e) { //중복체크 (나중에..)
        e.preventDefault();

                
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
        if (pw == re) {
            $("form").submit();
        } else {
            $("#rePw").focus();
            $("#mentRe").text("입력하신 비밀번호와 다릅니다");
            
            return;
        }
    });


});


    

