$("document").ready(function(){
    //css, bootStrap
	$("#sendForm td").css("border-bottom","none");
    $("#sendForm input").addClass("mx-2");
    $("#submitBtn").addClass("myBtn btn mt-3");
    $("#pointMent, #myPoint").addClass("text-success");
    
    //체크 -> 1. null 2. send 2.point
    $("#submitBtn").click(function(e){
    	e.preventDefault();
    	
    	const myPoint = Number($("#myPoint").text());
    	console.log(myPoint);
    	
    	const send = $("[name='sendUser']").val();
    	let $recieve = $("[name='recieve']");
    	let $sendPoint = $("[name='sendPoint']");
    	
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
    	
    	$("form").submit();
    	
    });
});

	function nullCheck(obj) {
		if (obj.val()) {
			return false;
		} else {
			return true;
		}
	}