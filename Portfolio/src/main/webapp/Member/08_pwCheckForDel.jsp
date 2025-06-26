<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/common/00_intergration.jsp"></jsp:include>
<div align="center">
	<form method="post" action="${contextPath}/DelMemberPro.do">
		<h3>정말 탈퇴하시겠습니까?</h3>
		<table border="1">
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="inputPw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">확인</button>
				</td>
			</tr>
		</table>
	</form>
</div>