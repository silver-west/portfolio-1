<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
	session.setAttribute("logId", null);
	session.setAttribute("logNick", null);
	
	session.setAttribute("memberList", null);
%>

<script>
	location.href = "${contextPath}/Main.do";
</script>