<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
	<div>
	 		<span class="contentTitle">✔️ 포인트 상점</span>  
  	</div>
  	<div class="container my-5 mx-1">
  		<div class="row">
  	<c:forEach var="item" items="${itemList}">
  				<div class=" col-sm-4 col-6" align="center" id="cardBoard">
	  				<div class="card mb-3">
	  					<img src="${contextPath}/Point/img/comingImg.jpg" class="card-img-top border-bottom">
	  					<div class="card-body py-1">
	  						<p class="card-title mt-2">
	  							<a href="#">${item.name}</a>
	  						</p>
	  						<div class="card-text pb-1">
	  							<p>${item.coment}</p>
	  							<span class="text">남은 수량 : </span><span class="text" id="total">${item.total}</span><span class="ment ms-2"></span>
	  						</div>
	  					</div>
	  				</div>
  				</div>
  	</c:forEach>
  		</div>		
  	</div>
</div>
<script>
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
			$ment.text("품절");
		}
	});
	
	$(".card").on("mouseenter", function() {
		$(this).css({
			"border" : "5px solid lightblue",
			"cursor" : "pointer"
		});
	});
	$(".card").on("mouseleave", function() {
		$(this).css({
			"border" : "1px solid lightgray",
			"cursor" : ""
		});
	});
});
</script>
</body>