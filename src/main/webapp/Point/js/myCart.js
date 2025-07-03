$(document).ready(function(){
//CSS, bootStrap
	$("input[name='check']").addClass("ms-3");
	$("img").css({
		"width" : "100%",
		"height" : "100%",
		"object-fit" : "cover" 	
	});
	
	$(".orTo").css({
		"font-weight" : "bold",
		"color" : "coral"
	});
	
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

        $(".checkBox").each(function() {
            updateTotal.call(this);
            updateCartTotal.call(this);
        });
    }

    function updatePage() {
        
        $(".checkBox").each(function() {
            updateTotal.call(this);
            updateCartTotal.call(this);
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
        //항목 가격 -> 체크 확인 -> orderTotal <-> totalPrice-> 갱신
        
        //가격
        let totalPrice = parseInt(
            $(this).closest("tr").next().next()
            .find(".totalPrice").text()
        );

        //체크 확인
        if ($(this).prop("checked")) {
            orderTotal += totalPrice;
        } else {
            orderTotal -= totalPrice;
        }
        
        //갱신
        $("#orderTotal").text(orderTotal);
        
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

    

//------------------------------------------

    init();


});