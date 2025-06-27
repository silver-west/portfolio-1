<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<div align="center">
	<h2>게시글 추가하기</h2>
	<form action="${contextPath}/AddPostPro.do" method="post">
		<table border="1">
			<tr>
				<td>작성자</td>
				<td>${logNick}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="10" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center" align="center"><input type="submit" value="작성완료"></td>
			</tr>
		</table>
	</form>
</div>