<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/common/00_intergration.jsp"></jsp:include>
<div align="center">
	<form method="post" action="${contextPath}/LoginPro.do">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="loginId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="loginPw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">로그인</button>
				</td>
			</tr>
		</table>
	</form>
</div>