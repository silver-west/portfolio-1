<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/00_intergration_board.jsp"></jsp:include>
<div align="center">
		<h1>게시판</h1>
		<p>글 작성 및 관리는 회원만 가능</p>
	<div align="center">
		<table border="1">
			<tr>
				<td><a href="#">전체 글 목록</a></td>
				<c:if test="${!empty logId}">
					<td><a href="#">글 작성</a></td>
					<td><a href="#">작성 글 관리</a></td>
				</c:if>
			</tr>
		</table>
	</div>
</div>