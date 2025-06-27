<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<c:choose>
	<c:when test="${empty logId}">
		<div align="center">
			<script>
				alert("로그인 시 이용 가능");
				location.href = "${contextPath}/Main.do";
			</script>
		</div>
	</c:when>
	<c:otherwise>
		<div align="center">
			<h3>보유 포인트 : ${totalPoint}</h3>
		</div>
		<div align="center">
		<form action="${contextPath}/PointMain.do">
			<button type="submit" name="sort" value="ASC">오래된순</button>
			<button type="submit" name="sort" value="DESC">최신순</button>
		</form>
		</div>
		<div align="center">
		<table border="1">
			<tr>
				<td>번호</td>
				<td>내용</td>
				<td>금액</td>
			</tr>
			<!-- 내역 -->
			<c:forEach var="i" begin="${startIdx}" end="${endIdx - 1}">
			<tr>
				<td>${i + 1}</td>
				<td>${historyList[i].coment}</td>
				<td>
					<c:if test="${historyList[i].option eq 'plus'}">
						<span>+ ${historyList[i].price}</span>
					</c:if>
					<c:if test="${historyList[i].option eq 'minus'}">
						<span>- ${historyList[i].price}</span>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
		</div>
		<!-- 버튼 -->
		<div align="center">
			<c:if test="${startBtn > 1}">
				<button onclick="window.location.href='${contextPath}/NextHistory.do?nextPage=${startBtn - 1}'">이전</button>
			</c:if>
			<c:forEach var="i" begin="${startBtn}" end="${endBtn}">
				<button onclick="window.location.href='${contextPath}/NextHistory.do?nextPage=${i}'">${i}</button>
			</c:forEach>
			<c:if test="${endBtn < lastBtn}">
				<button onclick="window.location.href='${contextPath}/NextHistory.do?nextPage=${endBtn + 1}'">이후</button>
			</c:if>
		</div>
		
		</div>	
	</c:otherwise>
</c:choose>