<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Admin/00_intergration_admin.jsp"></jsp:include>
<div align="center">
	<c:choose>
		<c:when test="${delCheck eq true}">
			<h2>회원 추방 성공</h2>
		</c:when>
		<c:otherwise>
			<h2>회원 추방 실패</h2>
		</c:otherwise>
	</c:choose>
	<div>
		<button onclick="window.location.href='${contextPath}/UserControl.do'">돌아가기</button>
	</div>
</div>