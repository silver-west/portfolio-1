<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
<div class="wrapper">
<div class="bg-white contentBox" align="center">
	<div>
	 		<span class="contentTitle">✔️ 포인트 상점</span>  
  	</div>
  	<div class="container my-5 mx-1">
  		<div class="row">
  	<c:forEach var="item" items="${itemList}">
  				<div class=" col-sm-4 col-6" align="center" id="cardBoard">
	  				<div class="card mb-3 myCard">
	  					<img src="${contextPath}${item.path}" class="card-img-top border-bottom storeItemImg">
	  					<div class="card-body py-1">
	  						<p class="card-title mt-2">
	  							<a href="${contextPath}/ItemInfo.do?itemNum=${item.number}">${item.name}</a>
	  						</p>
	  						<div class="card-text pb-2">
	  							<p>${item.coment}</p>
	  							<span class="text" id="price">${item.price} P</span><br>
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
	const contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${contextPath}/Point/js/pointStore.js"></script>
<jsp:include page="/common/05_footer.jsp"></jsp:include>
</div>
</body>