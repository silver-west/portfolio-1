<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/00_intergration_board.jsp"></jsp:include>
<div align="center">
		<h1>포인트</h1>
		<c:if test="${empty logId}">
			<p>회원만 이용 가능</p>
		</c:if>
		<c:if test="${!empty logId}">
			<div align="center">
				<table border="1">
					<tr>
						<td><a href="${contextPath}/BoardIndex.do">내역</a></td>
						<td><a href="${contextPath}/SendPoint.do">선물하기</a></td>
						<td><a href="${contextPath}/PointStore.do">상점</a></td>
					</tr>
				</table>
			</div>
		</c:if>
</div>