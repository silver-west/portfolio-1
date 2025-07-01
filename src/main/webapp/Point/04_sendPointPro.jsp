<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
<body>
<div class="bg-white contentBox" align="center">
	<c:choose>
		<c:when test="${sendCheck eq true}">
			<div class="titleBox">
	 		 	<span class="contentTitle">⭕ 포인트 전송 성공</span>
  			</div>  
            <div class="mt-3">
                <span class="text-success">잔여 포인트 : ${user.myPoint} P</span>
            </div>
		</c:when>
		<c:otherwise>
			<div class="titleBox">
	 		 	<span class="contentTitle">❌ 포인트 전송 실패</span>
	 		 	<p class="coment mt-3">시스템 오류</p>
  			</div> 
		</c:otherwise>
	</c:choose>
	<div align="center">
		<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/PointIndex.do">포인트 내역</button>
		<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/SendPoint.do">포인트 전송</button>
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