<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
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
<div class="bg-white contentBox" align="center">
    <div>
        <form action="${contextPath}/PointMain.do">
        	<table class="table-responsive" id="pointTable">
        		<tr>
        			<td width="40%" align="left">
					    <p id="myPoint" class="px-3">${logNick}님 보유 포인트 : ${totalPoint}</p>        			
        			</td>
        			<td width="60%" align="right" class="px-3">
						<button type="submit" name="sort" value="ASC">오래된순</button>
						<button type="submit" name="sort" value="DESC">최신순</button>
        			</td>
        		</tr>
        	</table>
		</form>
    </div>
    <div align="center" class="table-responsive">
        <table class="table tableForm">
            <tr>
				<td class="th" width="20%">번호</td>
				<td class="th" width="60%">내용</td>
				<td class="th" width="20%">금액</td>
			</tr>
            <!-- 내역 -->
			<c:forEach var="i" begin="${startIdx}" end="${endIdx - 1}">
			<tr>
				<td>${i + 1}</td>
				<td>${historyList[i].coment}</td>
				<td>
					<c:if test="${historyList[i].option eq 'plus'}">
						<span class="plus">+ ${historyList[i].price}</span>
					</c:if>
					<c:if test="${historyList[i].option eq 'minus'}">
						<span class="minus">- ${historyList[i].price}</span>
					</c:if>
				</td>
			</tr>
			</c:forEach>
        </table>
    </div>
    <!-- 버튼 -->
	<div align="center">
		<c:if test="${startBtn > 1}">
			<button class="btn myBtnGray pageBtn" data-url="${contextPath}/NextPoint.do?nextPage=${startBtn - 1}">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startBtn}" end="${endBtn}">
			<button class="btn myBtn pageBtn" data-url="${contextPath}/NextPoint.do?nextPage=${i}">${i}</button>
		</c:forEach>
		<c:if test="${endBtn < lastBtn}">
			<button class="btn myBtnGray pageBtn" data-url="${contextPath}/NextPoint.do?nextPage=${endBtn + 1}">이후</button>
		</c:if>
	</div>
</div>
</c:otherwise>
</c:choose>
<script>
$("document").ready(function(){
    //bootStrap
    $("[name='sort']").addClass("myBtn btn");
    $("#myPoint").addClass("text-success fs-6 text-start w-100");
    $("#pointTable td").css("border-bottom", "none");
    $(".plus").addClass("text-primary");
    $(".minus").addClass("text-danger");
    
    $(".pageBtn").click(function(){
    	const url = $(this).data("url");
    	if (url) {
    		window.location.href = url;
    	}
    });
    
});
</script>
</body>