$(document).ready(function(){
//CSS, bootStrap
	$("input[name='check']").addClass("ms-3");
	$("img").css({
		"width" : "100%",
		"height" : "200px",
		"object-fit" : "contain" 	
	});
	
	$(".orTo").css({
		"font-weight" : "bold",
		"color" : "coral"
	});
	
	$(".noL").css("border-top", "1px solid lightgray");

    $("#checkDelBtn").addClass("btn btn-danger mx-3");
    $("#cartBuyBtn").addClass("btn btn-success");
	
	$(".priceText").addClass("fs-5 text-danger text-center pt-3");
	$(".itemName").addClass("fs-5");
	$("#orderText").addClass("fs-2 fw-bold");
	$(".delBtn").addClass("btn btn-danger me-3");

//------------------------------------------

// 변수 ------------------------------------
    let orderTotal = 0;

    //object
    let $allCheck = $("#allCheck");
    
//-----------------------------------------

// function --------------------------------

    function init() {
        orderTotal = 0;

       updatePage();

    }

    function updatePage() {
        
        $(".checkBox").each(function() {
            updateTotal.call(this);
            updateCartTotal.call(this);
        });

        $(".orderCount").each(function(){
            orderCountCheck.call(this);
        });
    }

    function allCheckOn() {
        $(".checkBox:not(:checked)").prop("checked", true);
        updatePage();
    }

    function allCheckOff() {
        $(".checkBox:checked").prop("checked", false);
        updatePage();
    }

    function updateTotal() {
        //1. 가격, 개수 => orderPrice
        let totalPrice = 0;

        let price = parseInt(
            $(this).closest("tr").find(".itemPrice").text()
        );

        let count = parseInt(
           $(this).closest("tr").next().next()
           .find(".orderCount").text()
        );

        totalPrice = price * count;

        //2. 갱신
        let $result = $(this).closest("tr").next().next().find(".totalPrice");
        $result.text(totalPrice);
    }

    function updateCartTotal() {
        //체크 확인 -> orderTotal <-> totalPrice-> 갱신
        let orderTotal = 0;
        
        $(".checkBox:checked").each(function() {
            //가격
            let totalPrice = parseInt(
                $(this).closest("tr").next().next()
                .find(".totalPrice").text()
            );

            orderTotal += totalPrice;

        });


        //갱신
        $("#orderTotal").text(orderTotal);
        $(".orderCount").each(function() {
            let orderCount = parseInt($(this).text());
            $(this).siblings("input[name=count]").val(orderCount);
        });
        
        
    }

    function countDown() {
        let $orderCount = $(this).closest("tr").find(".orderCount");
        let count = parseInt($orderCount.text());
        let itemTotal = parseInt($orderCount.closest("tr").prev().find(".itemTotal").text());

        if (count <= 1 || itemTotal <= 1) {
            return;
        } else {
            $orderCount.text(count - 1);
        }

        updatePage();
    }

    function countUp() {
        let $orderCount = $(this).closest("tr").find(".orderCount");
        let count = parseInt($orderCount.text());
        let itemTotal = parseInt($orderCount.closest("tr").prev().find(".itemTotal").text());
        
        if (count >= itemTotal) {
            return;
        } else {
            $orderCount.text(count + 1);
        }
        
        updatePage();
    }

    function orderCountCheck() {
        let orderCount = parseInt($(this).text());
        let itemTotal = parseInt(
            $(this).closest("tr").prev().find(".itemTotal").text()
        );

        let $minusBtn = $(this).siblings(".minusBtn");
        let $plusBtn = $(this).siblings(".plusBtn");

        if (orderCount >= itemTotal) {
            $plusBtn.css("color", "lightgray");
        } else {
            $plusBtn.css("color", "");
        }

        if (orderCount <= 1 || itemTotal <= 1) {
            $minusBtn.css("color", "lightgray");
        } else {
            $minusBtn.css("color", "");
        }
    }

    function totalCheck() {
        let boolean = true;
        $(".checkBox:checked").each(function(){
            $itemTotal = $(this).closest("tr").next().next().find(".itemTotal");
            let total = parseInt($itemTotal.text());
            
            if (total < 1) {
                boolean = false;
                return false;
            }
        });

        return boolean;
    }

    

    
// -----------------------------------------


// event -----------------------------------

    $allCheck.on("click", function() {
        if ($(this).prop("checked")) {
            allCheckOn();
        } else {
            allCheckOff();
        }
    });

    $(".checkBox").on("change", updateCartTotal);
    $(".minusBtn").on("click", countDown);
    $(".plusBtn").on("click", countUp);
    
    $("#cartBuyBtn").on("click", function(e) {
        e.preventDefault();

        //재고 되는지 체크
        let booleanTotalCheck = totalCheck();
        if (booleanTotalCheck) {
            $("#ment").text("");
        } else {
            $("#ment").text("품절인 상품이 있습니다");
            return;
        }

        //포인트 되는지 체크
        let orderTotal = parseInt($("#orderTotal").text());
        $.ajax({
            url: "PointCheck.do",
            method: "POST",
            data: { vsPoint : orderTotal },
            success: function(response) {
                if (response == "pass") {
                    $("input[name='totalPoint']").val(orderTotal);
                    $("#cartForm").attr("action", "BuyCart.do");
                    updateCartTotal();
                    $("#cartForm").submit();
                } else {
                    $("#ment").text("포인트가 부족합니다");
                    return;
                }
            }
        });

    });

    $("#checkDelBtn").on("click", function(e) {
        e.preventDefault();

        $("#cartForm").attr("action", "DelCartAll.do");
        $("#cartForm").submit();
    });
    
   
	$(".transBtn").on("click", function(){
		let url = $(this).data("url");
		
		if (url) {
			window.location.href = url;
		}
	});
    

//------------------------------------------

    init();


});