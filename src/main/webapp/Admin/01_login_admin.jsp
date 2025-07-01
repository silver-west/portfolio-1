<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Admin/00_intergration_admin.jsp"></jsp:include>
<body>
    <div class="bg-white contentBox">
  <div class="titleBox">
	  <span class="contentTitle">✔️ 관리자 로그인</span>  
  </div>
  <div class="login-box container-fluid d-flex justify-content-center mb-5">
    <form action="${contextPath}/AdminLoginPro.do" method="post">
        <div class="logInForm my-3 pt-1">
            <label for="loginId">아이디</label>
            <input type="text" name="loginId" id="loginId" class="form-control" placeholder="아이디를 입력하세요">
        	<p id="mentId" class="mt-2 text-danger"></p>
        </div>
        <div class="logInForm my-3">
            <label for="loginPw">비밀번호</label>
            <input type="password" name="loginPw" id="loginPw" class="form-control" placeholder="비밀번호를 입력하세요">
        	<p id="mentPw" class="mt-2 text-danger"></p>
        </div>
        <div class="logInForm text-center">
            <button type="submit" class="myBtn btn my-3" id="loginBtn">로그인</button>
            <p id="ment" class="text-danger"></p>
        </div>
    </form>
  </div>
</div>
<!--Java script-->
<script src="${contextPath}/Admin/js/01_login_Admin.js"></script>
</body>
<jsp:include page="/common/05_footer.jsp"></jsp:include>
