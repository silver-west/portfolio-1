<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Admin/00_intergration_admin.jsp"></jsp:include>
<body>
<div class="wrapper">
	<div class="bg-white contentBox">
		<div align="center">
			<c:choose>
				<c:when test="${delCheck eq true}">
					<div class="titleBox">
						<span class="contentTitle">⭕ 회원 추방 성공</span>  
  					</div>
				</c:when>
				<c:otherwise>
					<div class="titleBox">
						<span class="contentTitle">❌ 회원 추방 실패</span>
  					</div>
  					<div align="center" class="mt-3">
  						<p class="text-danger">시스템 오류</p> 
  					</div>
				</c:otherwise>
			</c:choose>
			<div align="center">
				<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/UserControl.do">회원관리</button>
				<button class="myBtn btn my-4 transBtn" data-url="${contextPath}/Main.do">메인화면</button>
			</div>       
	    </div>
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
<jsp:include page="/common/05_footer.jsp"></jsp:include>
</div>
</body>
