<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
	<c:choose>
		<c:when test="${delPostCheck eq true}">
			<div class="titleBox">
		 		 <span class="contentTitle">⭕ 게시글 삭제 성공</span> 
	  		</div> 
		</c:when>
		<c:otherwise>
			<div class="titleBox">
		 		 <span class="contentTitle">❌ 게시글 삭제 실패</span>
		 		 <div>
		 		 	<p class="text-danger my-3">시스템 오류</p>
		 		 </div>  
	  		</div> 
		</c:otherwise>
	</c:choose>
	<div align="center">
		<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/BoardMainDesc.do">게시글 목록</button>
		<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/MyPostList.do">작성글 목록</button>
	</div>     
</div>
<script>
	$(document).ready(function() {
		$(".transBtn").on("click", function() {
			let url = $(this).data("url");
			if (url) {
				window.location.href = url;
			}
		});
	});
</script>
</body>
