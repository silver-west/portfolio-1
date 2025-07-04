<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<body>
<div class="wrapper">
	<div class="bg-white contentBox" align="center">
		<div class="titleBox">
	 		 <span class="contentTitle">❌ 게시글 수정 실패</span>  
  		</div>
  		<div align="center" class="mt-3">
  			<p class="text-danger">시스템 오류</p>
  		</div>
  		<div align="center">
			<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/BoardMainDesc.do">게시판</button>
			<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/MyPostList.do">작성글</button>
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
<jsp:include page="/common/05_footer.jsp"></jsp:include>
</div>
</body>
