<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/common/00_intergration.jsp"></jsp:include>
<body>
    <div class="bg-white contentBox">
  <div class="titleBox">
	  <span class="contentTitle">🐤 로그인</span>  
  </div>
  <div class="login-box">
    <form action="${contextPath}/LoginPro.do" method="post">
        <div class="joinForm">
            <label for="loginId">아이디</label>
            <input type="text" name="loginId" id="loginId" class="form-control">
        	<p id="mentId"></p>
        </div>
        <div class="joinForm">
            <label for="loginPw">비밀번호</label>
            <input type="password" name="loginPw" id="loginPw" class="form-control">
        	<p id="mentPw"></p>
        </div>
        <div class="joinForm" align="center">
            <button type="submit" class="myBtn btn my-3" id="loginBtn">로그인</button>
        </div>
    </form>
  </div>
</div>
<!--Java script-->
<script src="${contextPath}/Member/js/02_login.js"></script>
</body>
<jsp:include page="/common/05_footer.jsp"></jsp:include>