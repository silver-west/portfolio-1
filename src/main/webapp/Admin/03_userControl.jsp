<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Admin/00_intergration_admin.jsp"></jsp:include>
<body>
<div class="wrapper">
	<div class="bg-white contentBox">
		<div class="titleBox">
	 		 <span class="contentTitle">✔️ 회원관리 페이지</span>  
  		</div>
  		<div align="center">
			<c:choose>
				<c:when test="${!empty memberList}">
					<table class="tableForm">
						<tr>
							<td class="th pb-2">아이디</td>
							<td class="th pb-2">정보</td>
							<td class="th pb-2">추방</td>
						</tr>
						<c:set var="idx" value="${0}"/>
						<c:forEach var="member" items="${memberList}">
						<tr>
							<td>${member.id}</td>
							<td><button data-url="${contextPath}/UserInfo.do?user=${idx}" class="btn btn-outline-primary">정보</button> </td>
							<td><button data-url="${contextPath}/ExpelUser.do?userId=${member.id}" class="btn btn-outline-danger">추방</button> </td>
						</tr>
						<c:set var="idx" value="${idx = idx + 1}"/>
						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<p>등록된 회원이 없습니다</p>
				</c:otherwise>
			</c:choose>	       
  		</div> 
	</div>
	<script>
		$("document").ready(function(){
			$("button").on("click", function(){
				const url = $(this).data("url");
				if (url) {
					window.location.href = url;
				}
			});
		});
	</script>
<jsp:include page="/common/05_footer.jsp"></jsp:include>
</div>
</body>