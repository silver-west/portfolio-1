$("document").ready(function(){
    //css, bootStrap
	$("#sendForm td").css("border-bottom","none");
    $("#sendForm input").addClass("mx-2");
    $("#submitBtn").addClass("myBtn btn mt-3");
    $("#pointMent, #myPoint").addClass("text-success");
    
    $("input[name='sendUser'], input[name='recieve'], input[name='sendPoint']").on("input blur", function(){
		$("#ment").text("");
	});
    
    //체크 -> 1. null 2. send 2.point
    $("#submitBtn").click(function(e){
    	e.preventDefault();
    	
    	let myPoint = Number($("#myPoint").text());
    	let send = $("input[name='sendUser']").val();
    	let $recieve = $("input[name='recieve']");
        console.log($recieve.val());
    	let $sendPoint = $("input[name='sendPoint']");
    	
    	//null
    	if (nullCheck($recieve)) {
    		$recieve.focus();
    		$("#ment").text("받는 분을 입력해주세요");
    		
    		return;
    	}
    	
    	if (nullCheck($sendPoint)) {
    		$sendPoint.focus();
    		$("#ment").text("보낼 포인트 금액을 입력해주세요");
    		
    		return;
    	}
    	
    	//보내는 - 받는 사람 체크
    	if (send == $recieve.val()) {
			$recieve.focus();
			$("#ment").text("본인에게는 못 보냅니다");
			
			return;
		}
    	
    	//point
    	let sendPoint = Number($sendPoint.val());
    	console.log(sendPoint);

        if (sendPoint <= 0) {
			$sendPoint.focus();
    		$("#ment").text("1 포인트 이상으로 입력해주세요");
    		
    		return;
		} 
    	
    	if (sendPoint > myPoint) {
    		$sendPoint.focus();
    		$("#ment").text("포인트가 부족합니다");
    		
    		return;
    	}

        //받는 유저 확인
        let recieve = $recieve.val();
        let booleanRecieve = false;
        let userType = $("input[name='type']:checked").val();

        let transUrl = "";
        let dataKey = "";
        let mentKey = "";
        if (userType == "id") {
            transUrl = "IdCheck.do";
            dataKey = "id";
            mentKey = "아이디";
        } else if (userType == "nick") {
            transUrl = "NickCheck.do";
            dataKey = "nick";
            mentKey = "닉네임";
        }

        $.ajax({
            url: transUrl,
            method: "POST",
            data: { [dataKey]: recieve },
            success: function(response) {
                if (response == "duplicate") {
                    booleanRecieve = true;
                    $("#ment").text("");
                    $("form").submit();
                } else {
                    booleanRecieve = false;
                    $("#ment").text(`해당 ${mentKey}의 유저가 없습니다`);
                    return;
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