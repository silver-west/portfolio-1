<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div align="center">
	<table>
		<tr>
			<td><a href="${contextPath}/BoardIndex.do">게시판</a></td>
			<td><a href="${contextPath}/PointIndex.do">포인트</a></td>
			<td><a href="#">준비중</a></td>
			<td><a href="#">준비중</a></td>
		</tr>
	</table>
</div>