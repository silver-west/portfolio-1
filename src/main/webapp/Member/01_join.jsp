<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/common/00_intergration.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
    <div class="titleBox">
	  <span class="contentTitle">🧸 회원가입</span>  
    </div>
    <form action="${contextPath}/JoinPro.do" method="post" class="joinForm my-3 pt-1">
	    <div class="joinForm my-3 pt-1">
	        <label for="joinId">아이디</label>
	        <div class="input-group">
	        <input class="form-control" id="joinId" name="joinId">
	        <button class="idCheck" type="button">중복확인</button>
	        </div>
            <p id="mentId"></p>
	    </div>
        <div class="joinForm my-3 pt-1">
            <label for="joinPw">비밀번호</label>
            <input class="form-control" id="joinPw" name="joinPw">
            <p id="mentPw"></p>
        </div>
	    <div class="joinForm my-3 pt-1">
            <label for="rePw">비밀번호 확인</label>
            <input class="form-control" id="rePw" name="rePw">
            <p id="mentRe"></p>
        </div>
        <div class="joinForm my-3 pt-1">
	        <label for="joinNick">닉네임</label>
	        <div class="input-group">
	        <input class="form-control" id="joinNick" name="joinNick">
	        <button class="nickCheck" type="button">중복확인</button>
	        </div>
            <p id="mentNick"></p>
	    </div>
	    <div align="center">
	    	<p id="ment" class="my-3"></p>
	    </div>
	    <div class="joinForm" align="center">
	        <button id="submitBtn" type="submit" class="myBtn btn my-3">가입하기</button>
	    </div>
    </form>
</div>
<!-- Java script -->
<script src="${contextPath}/Member/js/01_join.js"></script>
</body>