<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Board/02_mini_navi.jsp"></jsp:include>
<body>
<div class="wrapper">
<div class="bg-white contentBox" align="center">
	<div align="center">
	 	<span class="contentTitle">게시글 추가하기</span>  
  	</div>
	<form id="formSt" action="${contextPath}/AddPostPro.do" method="post">
		<table>
			<tr>
				<td class="th">작성자</td>
				<td>${logNick}</td>
			</tr>
			<tr>
				<td class="th">제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td class="th noneLine" >내용</td>
				<td class="noneLine"><textarea cols="50" rows="10" name="content"></textarea></td>
			</tr>
		</table>
        <div align="center">
            <button id="sumitBtn" type="submit">작성 완료</button>
        </div>
	</form>
    <div align="center">
        <p id="nullMent"></p>
    </div>
</div>
<!-- java Script -->
<script src="${contextPath}/Board/js/addPostForm.js"></script>
<jsp:include page="/common/05_footer.jsp"></jsp:include>
</div>
</body>
