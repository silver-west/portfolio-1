<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
<div class="wrapper">
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
<form method="post" id="cartForm">
	<table class="w-70" id="cartTable">
	<colgroup>
	    <col style="width:10%">
	    <col style="width:35%">
	    <col style="width:35%">
	    <col style="width:20%">
  </colgroup>
	<tr class="tdL">
		<td style="border-bottom: 1px solid black"><input type="checkBox" id="allCheck" checked="checked" class="ms-3"></td>
		<td colspan="4" style="border-bottom: 1px solid black">전체선택</td>
	</tr>
	<c:forEach var="item" items="${myCart}">
				<tr class="tL">
					<td><input type="checkbox" name="check" class="checkBox" checked="checked" value="${item.itemNumber}"></td>
					<td class="itemName" colspan="2">${item.itemName}</td>
					<td><span class="itemPrice">${item.itemPrice}</span> P</td>
					<td colspan="3" align="right" class="my-2 py-2">
						<button type="button" class="delBtn mx-3" onclick="window.location.href='${contextPath}/DelCart.do?itemNum=${item.itemNumber}'">
						X
						</button>
					</td>
				</tr>
				<tr class="tL">
					<td colspan="2" rowspan="2" style="border-bottom: 1px solid black">
						<img src="${contextPath}${item.itemPath}"> 
					</td>
					<td class="p-2" colspan="3" style="border: none">
						${item.coment}
					</td>
				</tr>
				<tr class="tL">
					<td colspan="4" align="center" style="border-bottom: 1px solid black">
						<table class="mx-2">
							<tr>
								<td colspan="3" class="pb-2 orTo">( 주문 가능 재고 : <span class="itemTotal">${item.itemTotal} )</span></td>
							</tr>
							<tr>
								 <td class="countBtn minusBtn">-</td>
								 <td class="countBtn orderCount">${item.orderCount}
					<!-- hidden -->	<input type="hidden" name="count" value="${item.orderCount}">								 
								 </td>
								 <td class="countBtn plusBtn">+</td>
							</tr>
							<tr>
								<td colspan="3" class="priceText" style="border: none">=> <span class="totalPrice">0</span> P</td>
							</tr>
						</table>
					</td>
				</tr>
	</c:forEach>
	</table>
	<!-- hidden -->
	<input type="hidden" name="totalPoint">
</form>
</div>
<div align="right" id="div2" class="w-100 px-5 mt-3">
	<p>선택 상품 총 가격</p>
	<p id="orderText"><span id="orderTotal"></span> P</p>
</div>
<div align="center" class="my-3">
	<button type="submit" onclick="" id="checkDelBtn">선택삭제</button>
	<button type="submit" id="cartBuyBtn">결제</button>
</div>
<div align="center">
	<p id="ment" class="text-danger"></p>
</div>
</c:otherwise>
</c:choose>	
	
</div>
<script src="${contextPath}/Point/js/myCart.js"></script>
<jsp:include page="/common/05_footer.jsp"></jsp:include>
</div>
</body>