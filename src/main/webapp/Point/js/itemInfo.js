$(document).ready(function(){
	$("#sold").prop("disabled", true);
	$("#itemName").css({
		"color" : "#00809D",
		"font-weight" : "bold",
		"font-size" : "20px"
	});
	
	$(".p").addClass("px-3 py-2");
	$("#cartBtn, #buyBtn").addClass("mx-5");
	$(".price").css({
		"color" : "coral",
		"font-weight" : "bold",
		"font-size" : "20px"
	});
	
	//수량 설정 
	let total = parseInt($("#total").text());
	const price = parseInt($("#itemPrice").text());
	let orderCount = 1;
	
	if (total == 0) {
		$("#totalPrice").css({
			"color" : "gray",
			"text-decoration" : "line-through",
			"text-decoration-color" : "red"
		});
		$("#ment").addClass("text-danger");
		$("#ment").text("품절된 아이템 입니다.");
	}

	let $plusBtn = $("#plusBtn");
	let $minusBtn = $("#minusBtn");
	let $orderCountBox = $("#orderCount");
	let $totalPrice = $("#totalPrice");
	$totalPrice.text(`${orderCount * price} P`);
	
	function countUp() {
		if (orderCount >= total) {
			return;
		}
		orderCount += 1;
		updateUI();
	}
	
	function countDown() {
		if (orderCount == 1) {
			return;
		}
		orderCount -= 1;
		updateUI();
	}
	
	function checkCount() {
		if (orderCount <= 1) { //down 검사
			$minusBtn.prop("disabled", true);
			changeToColor($minusBtn, true);
		} else {
			$minusBtn.prop("disabled", false);
			changeToColor($minusBtn, false);
		}
		
		if (total <= orderCount) { //up; 검사
			$plusBtn.prop("disabled", true);
			changeToColor($plusBtn, true);
		} else {
			$plusBtn.prop("disabled", false);
			changeToColor($plusBtn, false);
		}
	
	}
	
	function changeToColor($obj, toGray) {
		if (toGray) {
			$obj.css("color", "lightgray");
		} else {
			$obj.css("color", ""); //초기화
		}
	}
	
	function updateUI() {
		$totalPrice.text(`${orderCount * price} P`);
		$orderCountBox.html(orderCount);
		checkCount(); 
	}
	
	$plusBtn.on("click", countUp);
	$minusBtn.on("click", countDown);
	
	checkCount(); 
	
	
});

