<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/common/00_intergration.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
    <div class="titleBox">
	  <span class="contentTitle">🧸 정보 수정</span>  
    </div>
    <form action="${contextPath}/EditInfoPro.do" method="post" class="joinForm my-3 pt-1">
	    <div class="joinForm my-3 pt-1">
	        <label>아이디</label>
	        <input name="id" disabled="disabled" value="${logId}">
	    </div>
        <div class="joinForm my-3 pt-1">
            <label for="editPw">비밀번호</label>
            <input id="editPw" name="editPw" value="${member.getPw()}">
            <p id="mentPw"></p>
        </div>
	    <div class="joinForm my-3 pt-1">
            <label for="rePw">비밀번호 확인</label>
            <input id="rePw" name="rePw" value="${member.getPw()}">
            <p id="mentRe"></p>
        </div>
        <div class="joinForm my-3 pt-1">
	        <label for="editNick">닉네임</label>
	        <div class="input-group">
	        <input id="editNick" name="editNick" value="${logNick}">
	        <button class="nickCheck">중복확인</button>
	        </div>
            <p id="mentNick"></p>
	    </div>
	    <div class="joinForm" align="center">
	        <button id="submitBtn" type="submit" class="myBtn btn my-3">수정하기</button>
	    </div>
    </form>
    <p id="ment">${joinMent}</p>
</div>
<!--Java Script -->
<script src="${contextPath}/Member/js/03_editInfo.js"></script>
</body>
