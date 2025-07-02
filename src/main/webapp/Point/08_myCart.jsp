<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
		<div align="center">
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
</c:choose>	
	
</div>
<script>
$(document).ready(function() {
	$(".transBtn").on("click", function(){
	let url = $(this).data("url");
		if (url) {
			window.location.href = url;
		}
	});
});
</script>
</body>