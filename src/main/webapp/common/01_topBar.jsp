<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<c:if test="${empty logNick}">
        <div class="top container-fluid d-flex justify-content-end">
            <button class="btn btn-danger me-2 mt-2 topBtn" data-url="${contextPath}/Join.do">회원가입</button>
            <button class="btn btn-warning me-2 mt-2 topBtn" data-url="${contextPath}/Login.do">로그인</button>
            <button class="btn btn-primary me-3 mt-2 topBtn" data-url="${contextPath}/AdminLogin.do">관리자</button>
        </div>
	</c:if>
	<c:if test="${!empty logNick}">
		<c:choose>
			<c:when test="${logId eq 'admin'}">
				<span>${logNick} 페이지</span>
                <div class="top container-fluid d-flex justify-content-end">
                    <button class="btn btn-danger me-2 mt-2 topBtn" data-url="${contextPath}/AdminIndex.do">게시글 관리</button>
                    <button class="btn btn-warning me-2 mt-2 topBtn" data-url="${contextPath}/UserControl.do">회원관리</button>
                    <button class="btn btn-primary me-3 mt-2 topBtn" data-url="${contextPath}/Logout.do">로그아웃</button>
                </div>
			</c:when>
			<c:otherwise>
				<span>${logNick}님</span>
                <div class="top container-fluid d-flex justify-content-end">
                    <button class="btn btn-danger me-2 mt-2 topBtn" data-url="${contextPath}/EditInfo.do">정보수정</button>
                    <button class="btn btn-warning me-2 mt-2 topBtn" data-url="${contextPath}/Logout.do">로그아웃</button>
                    <button class="btn btn-primary me-3 mt-2 topBtn" data-url="${contextPath}/DelMember.do">탈퇴</button>
                </div>
			</c:otherwise>
		</c:choose>
	</c:if>

    <script>
        $(document).ready(function() {
            
        	$(".topBtn").on("click", function () {
        		const url = $(this).data("url");
        		if (url) {
        			window.location.href = url;
        		}
        	});
           

        });
    </script>