<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
	<div align="center" class="mb-3">
	 	<span class="contentTitle">🛒 장바구니</span>  
  	</div>      
<c:choose>
<c:when test="${empty myCart}">
	<div class="mt-5" align="center">
        <p class="text-dark fs-4">장바구니가 비어있습니다</p>
    </div>
    <div align="center" class="mt-3">
		<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/PointStore.do">포인트 상점</button>
	</div>	
</c:when>
<c:otherwise>
<div align="center">
<form method="post">
	<table class="w-70" id="cartTable">
	<colgroup>
	    <col style="width:10%">
	    <col style="width:30%">
	    <col style="width:60%">
  </colgroup>
	<tr class="tdL">
		<td><input type="checkBox" name="check"></td>
		<td colspan="2" >전체선택</td>
	</tr>
	<c:forEach var="item" items="${myCart}">
				<tr class="tdL tL">
					<td><input type="checkbox" name="check"></td>
					<td class="itemName">${item.itemName}</td>
					<td colspan="4" align="right" class="my-2 py-2">
						<button type="button" class="delBtn" class="mx-3">X</button>
					</td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2">
						<img src="${contextPath}/Point/img/comingImg.jpg">
					</td>
					<td class="px-4">
						${item.coment}
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<table class="mx-2">
							<tr>
								<td colspan="3" class="pb-2 orTo">( 주문 가능 재고 : <span>${item.itemTotal} )</span></td>
							</tr>
							<tr>
								 <td class="countBtn minusBtn">-</td>
								 <td class="countBtn orderCount">${item.orderCount}</td>
								 <td class="countBtn plusBtn">+</td>
							</tr>
							<tr>
								<td colspan="3" class="orderPrice">=> <span>0</span> P</td>
							</tr>
						</table>
					</td>
				</tr>
	</c:forEach>
	</table>
</form>
</div>
<div align="right" id="div2" class="w-100 px-5 mt-3">
	<p>선택 상품 총 가격</p>
	<p id="totalPrice"><span></span> P</p>
</div>
</c:otherwise>
</c:choose>	
	
</div>
<script>
$(document).ready(function(){
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
	
	$(".orderPrice").addClass("fs-5 text-danger text-center pt-3");
	$(".itemName").addClass("fs-5");
	$("#totalPrice").addClass("fs-2 fw-bold");
	$(".delBtn").addClass("btn btn-danger me-3");
});
</script>
</body>