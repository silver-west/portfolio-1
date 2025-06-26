<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<div align="center">
	<h3>게시글 확인</h3>
	<table border="1">
		<tr>
			<td>제목</td>
			<td>${post.subject}</td>
			<td>작성자</td>
			<td>${writer.nickName}</td>
			<td>조회수</td>
			<td>${post.readCount}</td>
		</tr>
		<tr>
			<td colspan="6">
				<textarea rows="10" cols="50" readonly="readonly">${post.content}</textarea>
			</td>
		</tr>
	</table>

</div>