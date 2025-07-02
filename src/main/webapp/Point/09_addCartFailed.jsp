<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
<body>
<div class="bg-white contentBox" align="center">
	<div class="titleBox">
	 	<span class="contentTitle">❌ 장바구니 추가 실패</span>
	 	<p class="coment mt-3">시스템 오류</p>
  	</div> 	
	<div align="center">
		<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/PointStore.do">포인트 상점</button>
		<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/SendPoint.do">장바구니</button>
	</div> 
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