<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<div align="center">
	<c:choose>
		<c:when test="${delPostCheck eq true}">
			<h3>게시글 삭제 성공</h3>
		</c:when>
		<c:otherwise>
			<h3>게시글 삭제 실패</h3>
		</c:otherwise>
	</c:choose>
	<a href="${contextPath}/MyPostList.do">돌아가기</a>
</div>