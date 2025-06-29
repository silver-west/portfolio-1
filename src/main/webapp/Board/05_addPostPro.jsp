<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<body>
	<div class="bg-white contentBox" align="center">
		<div class="titleBox">
	 		 <span class="contentTitle">❌ 게시글 추가 실패</span>  
  		</div>
  		<div class="my-5">
	  		<a href="${contextPath}/BoardMain.do">돌아가기</a>      		
  		</div>
	</div>
</body>
