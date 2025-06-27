<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Silver's Portfolio</title>

<link rel="stylesheet" href="${contextPath}/common/common.css">
<link rel="stylesheet" href="${contextPath}/Board/board.css">


</head>
<body>
<jsp:include page="/common/01_topBar.jsp"></jsp:include>
<%@ include file="/common/02_header.jsp"%>
<jsp:include page="/common/03_navi.jsp"></jsp:include>
</body>
</html>