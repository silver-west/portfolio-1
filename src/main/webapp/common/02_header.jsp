<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="mainHeader container-fluid d-flex justify-content-center py-4">
        <h1 class="title fw-bold">PointSquare</h1>
</div>
<script>
	$("document").ready(function() {
		$(".mainHeader").click(function() {
			window.location.href = "${contextPath}/Main.do";
		});
		
		$(".mainHeader").css("cursor", "pointer");
	});
</script>