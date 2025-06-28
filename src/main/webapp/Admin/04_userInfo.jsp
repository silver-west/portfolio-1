<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Admin/00_intergration_admin.jsp"></jsp:include>
<div align="center">
	<h1>회원 정보</h1>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>${userInfo.id}</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${userInfo.nickName}</td>
			</tr>
			<tr>
				<td>보유 포인트</td>
				<td>${point.myPoint}</td>
			</tr>
		</table>
		<div align="center">
			<button onclick="window.location.href='${contextPath}/UserControl.do'">돌아가기</button>
		</div>
</div>