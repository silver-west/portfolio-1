<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Admin/00_intergration_admin.jsp"></jsp:include>
<div align="center">
	<h1>회원관리 페이지</h1>
	<c:choose>
		<c:when test="${!empty memberList}">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>정보</td>
					<td>추방</td>
				</tr>
				<c:set var="idx" value="${0}"/>
				<c:forEach var="member" items="${memberList}">
				<tr>
					<td>${member.id}</td>
					<td><button onclick="window.location.href='${contextPath}/UserInfo.do?user=${idx}'">정보</button> </td>
					<td><button onclick="window.location.href='${contextPath}/ExpelUser.do?userId=${member.id}'">추방</button> </td>
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