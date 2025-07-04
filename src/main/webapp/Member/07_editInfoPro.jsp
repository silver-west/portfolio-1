<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/common/00_intergration.jsp"></jsp:include>
<body>
<div class="wrapper">
<div class="bg-white contentBox" align="center">
	<c:choose>
		<c:when test="${editcheck eq true}">
			<script>
				alert("정보수정 성공!");
				location.href = "${contextPath}/Main.do"
			</script>
		</c:when>
		<c:otherwise>
			<div class="titleBox">
	 		 	<span class="contentTitle">❌ 정보수정 실패</span>
	 		 	<div class="mt-2">
	 		 		<p class="text-danger">시스템 오류</p>
	 		 	</div>
  			</div> 
		</c:otherwise>
	</c:choose>  
</div>
<jsp:include page="/common/05_footer.jsp"></jsp:include>
</div>
</body>