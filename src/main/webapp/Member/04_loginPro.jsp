

<!-- 사용 안 하는 페이지인데 혹시 오류 날까봐 일단 남김 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/common/00_intergration.jsp"></jsp:include>
<body>
<div class="wrapper">
<div class="bg-white contentBox" align="center">
	<c:choose>
		<c:when test="${!empty logId}">
			<script>
				alert("로그인 성공");
				location.href = "${contextPath}/Main.do";
			</script>
		</c:when>
		<c:otherwise>
			<div class="titleBox">
	 		    <span class="contentTitle">❌ 로그인 실패</span>  
  		    </div>
  		    <div align="center" class="mt-3">
				<a id="pageLink" href="{contextPath}/Login.do">로그인 화면</a>
				<a id="pageLink" href="{contextPath}/Main.do">메인화면</a>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<script>
	$("document").ready(function(){
		$("#pageLink").addClass("mx-3");
	});
</script>
<jsp:include page="/common/05_footer.jsp"></jsp:include>
</div>
</body>

