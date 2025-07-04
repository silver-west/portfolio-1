$(document).ready(function(){
	$("#sold").prop("disabled", true);
	$("#ment").addClass("text-danger");
	$("#itemName").css({
		"color" : "#00809D",
		"font-weight" : "bold",
		"font-size" : "20px"
	});
	
	$(".p").addClass("px-3 py-2");
	$("#cartBtn, #buyBtn").addClass("mx-2");
	$(".price").css({
		"color" : "coral",
		"font-weight" : "bold",
		"font-size" : "20px",
		"border-bottom" : "1px solid lightgray"
	});
	
	//수량
	let total = parseInt($("#total").text());
	const price = parseInt($("#itemPrice").text());
	let orderCount = 1;
	
	if (total == 0) {
		$("#totalPrice").css({
			"color" : "gray",
			"text-decoration" : "line-through",
			"text-decoration-color" : "red"
		});
		$("#ment").text("품절된 아이템 입니다.");
	}

	let $plusBtn = $("#plusBtn");
	let $minusBtn = $("#minusBtn");
	let $orderCountBox = $("#orderCount");
	let $totalPrice = $("#totalPrice");
	$totalPrice.text(`${orderCount * price}`);
	
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
		$totalPrice.text(`${orderCount * price}`);
		$orderCountBox.html(orderCount);
		checkCount(); 
	}

	//장바구니
	let $cartBtn = $("#cartBtn");
	function addCart(e) {
		e.preventDefault();
		
		$("form").attr("action", "AddCart.do");
		$("input[name='orderCount']").val(orderCount);
		$("form").submit();
	}

	//구매
	let $buyBtn = $("#buyBtn");
	function checkPoint(e) {
		 e.preventDefault();
		
		let price = parseInt($totalPrice.text());
		console.log(price);
		
		//포인트 체크
		$.ajax({
			url: "PointCheck.do",
			method: "POST",
			data: { vsPoint : price },
			success :function(response) {
				if (response == "pass") {		
					$("form").attr("action", "BuyItem.do");
					$("input[name='orderPrice']").val(price);
					$("form").submit();
				} else {
					$("#ment").text("보유 포인트가 부족합니다");
				}
			}
		});
	}

	//이벤트 등록
	$plusBtn.on("click", countUp);
	$minusBtn.on("click", countDown);
	$buyBtn.on("click", checkPoint);
	$cartBtn.on("click", addCart);
	
	checkCount(); 
	
	
});

