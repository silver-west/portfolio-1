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
				<td>작성자</td>
				<td>조회수</td>
			</tr>
			<c:set var="num" value="${0}"/>
			<c:forEach var="post" items="${boardList}">
			<tr>
				<td>${num + 1}</td>
				<td><a href="${contextPath}/Post.do?boardNum=${post.number}">${post.subject}</a></td>
				<td>${post.writer}</td>
				<td>${post.readCount}</td>
			</tr>
			<c:set var="num" value="${num + 1}"/>	
			</c:forEach>
		</table>
</div>