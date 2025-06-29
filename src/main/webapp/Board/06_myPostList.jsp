<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<body>
	<div class="bg-white contentBox" align="center">
		<c:choose>
		<c:when test="${empty myPostList}">
			<div class="titleBox">
				<span class="contentTitle">작성 게시글이 없습니다</span>
			</div>
		</c:when>   
		<c:otherwise>
			<div align="center" class="table-responsive">
			  <table class="table tableForm">
				  <tr>
					  <td class="th" width="10%">번호</td>
					  <td class="th">제목</td>
					  <td class="th" width="10%">조회수</td>
					  <td class="th" width="10%">수정</td>
					  <td class="th" width="10%">삭제</td>
				  </tr>
					<c:set var="num" value="${0}"/>
					<c:forEach var="post" items="${myPostList}">
						<tr>
						<td>${num + 1}</td>
						<td><a href="${contextPath}/Post.do?boardNum=${post.number}">${post.subject}</a></td>
						<td>${post.readCount}</td>
						<td><button class="editBtn" data-url="${contextPath}/EditPost.do?boardNum=${post.number}">✏️</button></td>
						<td><button class="delBtn" data-url="${contextPath}/DelPost.do?boardNum=${post.number}">X</button></td>
					</tr>
					<c:set var="num" value="${num + 1}"/>
					</c:forEach>
			  </table>
			</div> 
		</c:otherwise>
		</c:choose>
	</div>
	
	<script>
		$("document").ready(function(){
			$(".miniheader").css("margin", "0");
			$("table").addClass("mt-3 w-100");
			$(".editBtn").addClass("btn btn-outline-primary");
			$(".delBtn").addClass("btn btn-outline-danger");
	
			$("button").on("click", function(){
				const url = $(this).data("url");
				if (url) {
					window.location.href = url;
				}
			});
		});
	</script>
</body>