<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<div align="center">
	<c:choose>
		<c:when test="${sendCheck eq true}">
			<h3>포인트 전송 성공</h3>
		</c:when>
		<c:otherwise>
			<h3>포인트 전송 실패</h3>
		</c:otherwise>
	</c:choose>
	<span>잔여 포인트 : </span> <span>${user.myPoint} P</span>
</div>