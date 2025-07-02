<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<!-- button icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
	<div class="bg-white contentBox">
  	<div align="center">
		<form action="" method="post" id="itemBox" class="p-2">	
			<table id="itemForm">
				<colgroup>
					<col style="width: 40%;">
					<col style="width: 40%;">
					<col style="width: 20%;"> 
			 	</colgroup>
				<tr>
					<td rowspan="5" id="itemImgBox">
		 				<img src="${contextPath}/Point/img/comingImg.jpg" id="itemInfoImg">
		 			</td>
					<td class="p" id="itemName">${item.name}</td>
		 			<td class="price"><span id="itemPrice">${item.price}</span> P</td>
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
					<td id="totalPrice"></td>
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
							<td align="center" id="btnBox">
								<button id="cartBtn" class="btn btn-success orderBtn">
									<i class="fas fa-shopping-cart"></i>
								</button>
							</td>
							<td>
								<button id="buyBtn" class="btn btn-primary orderBtn">바로 구매</button>
							</td>
						</tr>
					
					</c:otherwise>
				</c:choose>
			</table>
		</form>
		<div align="center">
			<p id="ment"></p>
		</div>
  	</div> 
	</div>
	
<script src="${contextPath}/Point/js/itemInfo.js"></script>
</body>