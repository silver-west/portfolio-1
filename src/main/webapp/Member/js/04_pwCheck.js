$("document").ready(function(){
	$("form").addClass("mt-5");
	$("label").addClass("form-label text-start w-100");
	$("#mentPw").addClass("text-danger mt-2");
	
	$("#inputPw").on("input", function() {
		$("#mentPw").text("");
	});
	
	$("#submitBtn").click(function(e) {
		e.preventDefault();
		
		let inputPw = $("#inputPw").val();

		if (nullCheck($("#inputPw"))) {
            $("#mentPw").text("비밀번호를 입력하세요");
            
            return;
        }
		
		$.ajax({
			url: "PwCheck.do",
			method: "POST",
			data: { pw: inputPw },
			success: function (response) {
				if (response == "pass") {
					$("form").submit();
				} else {
					$("#mentPw").text("틀린 비밀번호 입니다");
				}
			}
		});
	});
});

    function nullCheck(obj) {
        if (obj.val()) {
            return false;
        } else {
            return true;
        }
    }