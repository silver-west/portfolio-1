<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<div align="center">
	<h1>포인트 보내기</h1>
	<span>보유 포인트 : </span> <span>${user.myPoint}</span>
	<div align="center">
		<form action="${contextPath}/SendPointPro.do" method="post">
			<table>
				<tr>
					<td>선택</td>
					<td>
						<input type="radio" name="type" value="id" checked="checked" >아이디
						<input type="radio" name="type" value="nick">닉네임
					</td>
				</tr>
				<tr>
					<td>받는 분</td>
					<td><input type="text" name="recieve"></td>
				</tr>
				<tr>
					<td>보낼 포인트</td>
					<td><input type="text" name="sendPoint"> P</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="sendUser" value="${user.id}">
						<input type="submit" value="보내기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>