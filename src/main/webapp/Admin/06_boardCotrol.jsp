<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Admin/00_intergration_admin.jsp"></jsp:include>
<body>
	<div class="bg-white contentBox">
		<div class="titleBox">
	 		 <span class="contentTitle">✔️ 게시판 관리</span>  
  		</div>
  		<div align="center">
			<table class="table tableForm">
                <tr>
					<td class="th" width="10%">번호</td>
					<td class="th">제목</td>
					<td class="th" width="20%">작성자</td>
					<td class="th" width="10%">조회수</td>
					<td class="th" width="10%">삭제</td>
				</tr>
                <!-- 게시글 -->
					<c:forEach var="i" begin="${startIdx}" end="${endIdx - 1}">
					<tr>
						<td>${i + 1}</td>
						<td><a href="${contextPath}/Post.do?boardNum=${boardList[i].number}">${boardList[i].subject}</a></td>
						<td>${boardList[i].writer}</td>
						<td>${boardList[i].readCount}</td>
						<td><button class="btn btn-outline-danger" data-url="${contextPath}/DelPost.do?boardNum=${boardList[i].number}">X</button></td>
					</tr>
					</c:forEach>
			</table>
            <div>
				<c:if test="${startBtn > 1}">
					<button class="btn myBtnGray" data-url="${contextPath}/NextPage.do?nextPage=${startBtn - 1}">이전</button>
				</c:if>
				<c:forEach var="i" begin="${startBtn}" end="${endBtn}">
					<button class="btn myBtn" data-url="${contextPath}/NextPage.do?nextPage=${i}">${i}</button>
				</c:forEach>
				<c:if test="${endBtn < lastBtn}">
					<button class="btn myBtnGray" data-url= "${contextPath}/NextPage.do?nextPage=${endBtn + 1}">이후</button>
				</c:if>
			</div>
  		</div> 
	</div>
	<script>
		$("document").ready(function(){
			$("button").on("click", function(){
				const url = $(this).data("url");
				if (url) {
					window.location.href = url;
				}
			});
		});
	</script>
</body>
