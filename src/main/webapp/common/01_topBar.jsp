<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div align="right">
	<c:if test="${empty logNick}">
		<button onclick="window.location.href='${contextPath}/Join.do'">회원가입</button>
		<button onclick="window.location.href='${contextPath}/Login.do'">로그인</button>
		<button onclick="window.location.href='${contextPath}/AdminLogin.do'">관리자</button>	
	</c:if>
	<c:if test="${!empty logNick}">
		<c:choose>
			<c:when test="${logId eq 'admin'}">
				<span>${logNick} 페이지</span>
				<button onclick="window.location.href='${contextPath}/AdminIndex.do'">게시글 관리</button>
				<button onclick="window.location.href='${contextPath}/UserControl.do'">회원관리</button>
				<button onclick="window.location.href='${contextPath}/Logout.do'">로그아웃</button>
			</c:when>
			<c:otherwise>
				<span>${logNick}님</span>
				<button onclick="window.location.href='${contextPath}/EditInfo.do'">정보수정</button>
				<button onclick="window.location.href='${contextPath}/Logout.do'">로그아웃</button>
				<button onclick="window.location.href='${contextPath}/DelMember.do'">탈퇴</button>
			</c:otherwise>
		</c:choose>
	</c:if>
</div>