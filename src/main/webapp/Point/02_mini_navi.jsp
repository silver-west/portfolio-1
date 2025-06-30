<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/00_intergration_board.jsp"></jsp:include>
<body>
	<div class="bg-white miniHeader">
		<div class="titleBox">
	 		<span class="contentTitle">🍀 포인트</span>  
            <c:if test="${empty logId}">
                <p class="coment">회원만 이용 가능</p>
            </c:if>     
  		</div>
        <c:if test="${!empty logId}">
        <div align="center">
            <table class="navTable">
            	<tr>
            		<td>
            			<a href="${contextPath}/PointIndex.do" class="navLink">내역</a>
            		</td>
            		<td>
            			<a href="${contextPath}/SendPoint.do" class="navLink">선물하기</a>
            		</td>
            		<td>
            			<a href="${contextPath}/PointStore.do" class="navLink">상점</a>
            		</td>
            	</tr>
            </table>
        </div>
        </c:if>
	</div>
</body>