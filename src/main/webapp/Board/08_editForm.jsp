<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<div class="bg-white contentBox" align="center">
	<h3>게시글 수정</h3>
	<form action="${contextPath}/EditPostPro.do" method="post">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" value="${editPost.subject}" name="editSubject"></td>
				<td>작성자</td>
				<td>${logNick}</td>
				<td>조회수</td>
				<td>${editPost.readCount}</td>
			</tr>
			<tr>
				<td colspan="6">
					<textarea rows="10" cols="50" name="editContent">${editPost.content}</textarea>
				</td>
			</tr>
		</table>
		<input type="hidden" name="postNum" value="${editPost.number}">
		<input type="submit" value="수정">
	</form>

</div>