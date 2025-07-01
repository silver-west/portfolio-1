<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
	<div class="titleBox">
	 	<span class="contentTitle">게시글</span>  
  	</div>
    <div align="center">
        <table class="tableForm">
            <colgroup>
                <col style="width: 10%;">
                <col style="width: 40%;">
                <col style="width: 10%;">
                <col style="width: 20%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
            </colgroup>
            <tr>
                <td class="th">제목</td>
                <td>${post.subject}</td>
                <td class="th">작성자</td>
                <td>
                    <c:if test="${nextNum eq 1}">${adminPost}</c:if>
                    <c:if test="${nextNum eq 2}">${writer.nickName}</c:if>
                </td>
                <td class="th">조회수</td>
                <td>${post.readCount}</td>
            </tr>
            <tr>
                <td colspan="6" width="370px" height="160px">
                    ${post.content}
                </td>
            </tr>
        </table>
    </div>    
        <div>
		<c:if test="${logId eq writer.id or logId eq 'admin'}">
            <c:if test="${logId eq writer.id or nextNum eq 1}">
                <button id="editBtn" data-url='${contextPath}/EditPost.do?boardNum=${post.number}'>수정</button>		
            </c:if>
                <button id="delBtn" data-url='${contextPath}/DelPost.do?boardNum=${post.number}'>삭제</button>
		</c:if>
				<button id="backBtn" onclick="history.back()">이전</button>
        </div>

    <script>
        $("document").ready(function(){
        	$("button").addClass("my-3 mx-2");
        	$("#editBtn").addClass("btn btn-outline-success");
            $("#delBtn").addClass("btn btn-outline-danger");
            $("#backBtn").addClass("btn btn-outline-warning");
        	$(".th").css("white-space", "nowrap");
            
            $("button").on("click", function(){
                const url = $(this).data("url");
                if (url) {
                    window.location.href = url;
                }
            });
        });
    </script>
</div>
</body>