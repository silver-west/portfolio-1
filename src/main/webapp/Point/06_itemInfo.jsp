<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
<div class="wrapper">
	<div class="bg-white contentBox">
  	<div align="center">
		<form method="post" id="itemBox" class="p-2">	
			<table id="itemForm">
				<colgroup>
					<col style="width: 40%;">
					<col style="width: 30%;">
					<col style="width: 30%;"> 
			 	</colgroup>
				<tr>
					<td rowspan="5" id="itemImgBox">
		 				<img src="${contextPath}${item.path}" id="itemInfoImg">
		 			</td>
					<td class="p" id="itemName">${item.name}</td>
		 			<td class="price"><span id="itemPrice" class="p">${item.price}</span> P</td>
				</tr>
				<tr>
		 			<td colspan="2" class="p">${item.coment}</td>
		 		</tr>
		 		<tr>
		 			<td class="p">남은 수량</td>
		 			<td id="total">${item.total}</td>
		 		</tr>
				<tr>
					<td>
						<table id="countBtnBox" class="table">
		 					<tr>
		 						<td id="minusBtn" class="countBtn">-</td>
		 						<td rowspan="2" id="orderCount">1</td>
		 						<td id="plusBtn" class="countBtn">+</td>
		 					</tr>
		 				</table>
					</td>
					<td>총 금액 : <span id="totalPrice"></span> P</td>
				</tr>
				<c:choose>
					<c:when test="${item.total eq 0}">
						<tr>
							<td colspan="2">
								<button class="btn btn-light mx-3" id="sold">구매 불가능</button>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td align="center" id="btnBox" colspan="2">
								<button id="cartBtn" class="btn btn-success orderBtn" type="button">담기</button>
								<button id="buyBtn" class="btn btn-primary orderBtn" type="button">구매</button>
							</td>		
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			
			<!-- hidden data -->
			<input type="hidden" name="itemNum" value="${item.number}">	
			<input type="hidden" name="orderPrice">
			<input type="hidden" name="orderCount">
		</form>
		<div align="center" class="mt-2">
			<p id="ment"></p>
		</div>
  	</div> 
	</div>
	
<script src="${contextPath}/Point/js/itemInfo.js"></script>
<jsp:include page="/common/05_footer.jsp"></jsp:include>
</div>
</body>