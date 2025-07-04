<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<body>
	<div class="bg-white contentBox" align="center">
		<div class="titleBox">
	 		 <span class="contentTitle">❌ 게시글 추가 실패</span>  
  		<div align="center">
			<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/AddPost.do">재작성</button>
			<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/BoardMainDesc.do">목록</button>
		</div> 
  		</div>
	</div>
	
	<script>
		$("document").ready(function(){
			$(".transBtn").on("click", function() {
				let url = $(this).data("url");
				if (url) {
					window.location.href = url;
				}
			});
		});
	</script>
</body>
