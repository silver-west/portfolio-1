<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/common/00_intergration.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
	<c:choose>
		<c:when test="${joinCheck eq true}">
			<div class="titleBox">
	 		    <span class="contentTitle">⭕ 회원가입 성공</span>  
  		    	<div align="center" class="mt-3">
					<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/Main.do">메인화면</button>
				</div>
  		    </div>
		</c:when>
		<c:otherwise>
			<div class="titleBox">
	 		 	<span class="contentTitle">❌ 회원가입 실패</span>
  			</div> 
  			<div>
  				<span class="coment my-3">시스템 오류</span>
  			</div>
  			<div align="center">
				<button class="myBtn btn my-3 transBtn" data-url="${contextPath}/Join.do">회원가입</button>
				<button class="myBtn btn my-3 transBtn" data-url="${contextPath}/Main.do">메인화면</button>
			</div> 
		</c:otherwise>
	</c:choose>
</div>
<script>
$("document").ready(function() {
	$(".transBtn").on("click", function(){
		let url = $(this).data("url");
						
		if (url) {
			window.location.href = url;
		}
	});
});
</script>
</body>
