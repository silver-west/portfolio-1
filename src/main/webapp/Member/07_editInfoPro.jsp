<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/common/00_intergration.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
	<c:choose>
		<c:when test="${infoEditCheck eq true}">
			<div class="titleBox">
	 		 	<span class="contentTitle">⭕ 정보수정 성공</span>  
  			</div>  
		</c:when>
		<c:otherwise>
			<div class="titleBox">
	 		 	<span class="contentTitle">❌ 정보수정 실패</span>
	 		 	<span>${joinMent }</span>
  			</div> 
		</c:otherwise>
	</c:choose>
    <div align="center">
        <p class="text-danger my-3">${editMent}</p>
    </div>
</div>
</body>