<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<div class="bg-white contentBox">
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
			<td colspan="6" width="370px" height="160px">
				${post.content}
			</td>
		</tr>
	</table>
	<c:if test="${logId eq writer.id or logId eq 'admin'}">
		<c:if test="${logId eq writer.id}">
			<button onclick="window.location.href='${contextPath}/EditPost.do?boardNum=${post.number}'">수정</button>		
		</c:if>
		<button onclick="window.location.href='${contextPath}/DelPost.do?boardNum=${post.number}'">삭제</button>
	</c:if>

</div>