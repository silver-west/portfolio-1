<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<div align="center">
		<table border="1">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>조회수</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<c:set var="num" value="${0}"/>
			<c:forEach var="post" items="${myPostList}">
			<tr>
				<td>${num + 1}</td>
				<td><a href="${contextPath}/Post.do?boardNum=${post.number}">${post.subject}</a></td>
				<td>${post.readCount}</td>
				<td><button onclick="window.location.href='${contextPath}/EditPost.do?boardNum=${post.number}'">수정</button></td>
				<td><button onclick="window.location.href='${contextPath}/DelPost.do?boardNum=${post.number}'">삭제</button></td>
			</tr>
			<c:set var="num" value="${num + 1}"/>	
			</c:forEach>
		</table>
</div>