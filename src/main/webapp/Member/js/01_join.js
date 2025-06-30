//변수
var booleanId = false;
var booleanPw = false;
var booleanRe = false;
var booleanNick = false;

$(document).ready(function(){
    //bootStrap
    $("label").addClass("form-label text-start w-100");
    $(".idCheck, .nickCheck").addClass("btn btn-secondary");
    $("#mentId, #mentPw, #mentRe, #mentNick").addClass("mt-2 text-danger text-start w-100");
    $("#ment").addClass("mt-2 text-danger fs-3");


    //태그 속성
    $("#joinId").attr({
        "placeholder" : "비밀번호를 입력하세요",
        "type" : "text"
    });

    $("#joinPw").attr({
        "placeholder" : "비밀번호를 입력하세요",
        "type" : "password"
    });

    $("#rePw").attr({
        "placeholder" : "한 번 더 입력하세요",
        "type" : "password"
    });

    $("#joinNick").attr({
        "placeholder" : "닉네임을 입력하세요",
        "type" : "text"
    });

    //체크
    $("#joinId").blur(function(){
    if (!nullCheck($(this))) {
        $("#mentId").text("아이디를 입력하세요");
        booleanId = false;
    } else {
        $("#mentId").text("");
        booleanId = true;
    }
    });

    $(".idCheck").click(function(e) { //중복체크 (나중에..)
        e.preventDefault();

                
    });
    
    $(".nickCheck").click(function(e) { //중복체크 (나중에..)
        e.preventDefault();

                
    });

    $("#joinPw").blur(function(){
    if (!nullCheck($(this))) {
        $("#mentPw").text("비밀번호를 입력하세요");
        booleanPw = false;
    } else {
        $("#mentPw").text("");
        booleanPw = true;
    }
    });

    $("#rePw").blur(function(){
        if (!nullCheck($(this))) {
            $("#mentRe").text("한 번 더 입력하세요");
            booleanRe = false;
        } else {
            if (!pwCheck($(this))) {
                $("#mentRe").text("위의 입력과 다릅니다");
                booleanRe = false;
            } else {
                $("#mentRe").text("");
                booleanRe = true;
            }
        }
        });
    });

    $("#joinNick").blur(function(){
    if (!nullCheck($(this))) {
        $("#mentNick").text("닉네임을 입력하세요");
        booleanNick = false;
    } else {
        $("#mentNick").text("");
        booleanNick = true;
    }
    });


    $(".myBtn").click(function(e) {
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

    function pwCheck(obj) {
        if ($("#joinPw").val() == obj.val()) {
            return true;
        } else {
            return false;
        }
    }

    function formCheck() {
        if (!booleanId) {
            $("#joinId").focus();
            return false;
        }
        
        if (!booleanPw) {
            $("#joinPw").focus();
            return false;
        }

        if (!booleanRe) {
            $("#rePw").focus();
            return false;
        }

        if (!booleanNick) {
            $("#joinNick").focus();
            return false;
        }

        return true;
    }

