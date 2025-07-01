<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/common/00_intergration.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
    <div class="titleBox">
	    <span class="contentTitle">비밀번호 확인</span>  
    </div>
    <form method="post" action="${contextPath}/EditForm.do">
        <div class="joinForm">
            <label for="inputPw">비밀번호 입력</label>
            <input type="password" name="inputPw" id="inputPw" class="form-control">
        	<p id="mentPw">${checkMent}</p>
        </div>
        <div class="joinForm" align="center">
            <button type="submit" class="myBtn btn my-3" id="submitBtn">확인</button>
        </div>
    </form>
</div>
<script src="${contextPath}/Member/js/04_pwCheck.js"></script>
</body>