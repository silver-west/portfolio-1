<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/common/00_intergration.jsp"></jsp:include>
<div align="center">
	<c:choose>
		<c:when test="${delCheck eq true}">
			<h1>탈퇴 성공</h1>
		</c:when>
		<c:otherwise>
			<h1>탈퇴 실패</h1>
		</c:otherwise>
	</c:choose>
</div>
