$(document).ready(function() {
	
	$(".card").each(function() {
		let total = $(this).find("#total").text();
		
		if (parseInt(total) == 0) {
			$(this).find(".text").css({
				"color" : "gray",
				"text-decoration" : "line-through",
				"text-decoration-color" : "red",
			});
			let $ment = $(this).find(".ment");
			$ment.addClass("text-danger");
			$ment.css({
				"border" : "1px solid darkgray",
				"border-radius" : "3px",
				"padding" : "2px"
			});
			$ment.text("품절");
		} 
	});
	
	$(".card").on("mouseenter", function() {
		$(this).css({
			"border" : "3px solid lightblue",
			"cursor" : "pointer"
		});
	});
	$(".card").on("mouseleave", function() {
		$(this).css({
			"border" : "1px solid lightgray",
			"cursor" : ""
		});
	});
	$(".card").on("mousedown", function() {
		$(this).css({
			"border" : "2px solid #00809D",
		});
	});
	
	$(".card").on("click", function(e) {
		let url = $(this).find("a").attr("href");
		location.href = url;
	});
});