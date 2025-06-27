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
			<!-- 게시글 -->
			<c:forEach var="i" begin="${startIdx}" end="${endIdx - 1}">
			<tr>
				<td>${i + 1}</td>
				<td><a href="${contextPath}/Post.do?boardNum=${boardList[i].number}">${boardList[i].subject}</a></td>
				<td>${boardList[i].writer}</td>
				<td>${boardList[i].readCount}</td>
			</tr>
			</c:forEach>
		</table>
		<!-- 버튼 -->
		<div>
			<c:if test="${startBtn > 1}">
				<button onclick="window.location.href='${contextPath}/PasingPro.do?nextPage=${startBtn - 1}'">이전</button>
			</c:if>
			<c:forEach var="i" begin="${startBtn}" end="${endBtn}">
				<button onclick="window.location.href='${contextPath}/PasingPro.do?nextPage=${i}'">${i}</button>
			</c:forEach>
			<c:if test="${endBtn < lastBtn}">
				<button onclick="window.location.href='${contextPath}/PasingPro.do?nextPage=${endBtn + 1}'">이후</button>
			</c:if>
		</div>
</div>