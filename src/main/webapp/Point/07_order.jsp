<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
	<c:choose>
		<c:when test="${buyCheck eq true}">
			<div class="titleBox">
	 		 	<span class="contentTitle">⭕ 아이템 구매 완료</span>
  			</div>  
		</c:when>
		<c:otherwise>
			<div class="titleBox">
	 		 	<span class="contentTitle">❌ 아이템 구매 실패</span>
	 		 	<p class="coment mt-3">시스템 오류</p>
  			</div> 
		</c:otherwise>
	</c:choose>
	<div align="center">
		<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/PointIndex.do">포인트 내역</button>
		<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/PointStore.do">포인트 상점</button>
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