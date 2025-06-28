<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Admin/00_intergration_admin.jsp"></jsp:include>
<body>
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
				</c:otherwise>
			</c:choose>
			<div align="center">
				<button class="myBtn btn my-4" onclick="window.location.href='${contextPath}/UserControl.do'">돌아가기</button>
			</div>       
	    </div>
	</div>
</body>
