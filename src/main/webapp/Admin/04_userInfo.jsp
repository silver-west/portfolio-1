<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Admin/00_intergration_admin.jsp"></jsp:include>
<body>
<div class="wrapper">
<div class="bg-white contentBox">
	<div class="titleBox">
		<span class="contentTitle">✔️ 회원 정보</span>  
  	</div>
  		<div align="center">
			<table class="table userInfotable">
				<tr>
					<td class="tdB">아이디</td>
					<td>${userInfo.id}</td>
				</tr>
				<tr>
					<td class="tdB">닉네임</td>
					<td>${userInfo.nickName}</td>
				</tr>
				<tr>
					<td class="tdB">보유 포인트</td>
					<td>${point.myPoint}</td>
				</tr>			
			</table>     
  		</div> 
  		<div align="center">
  			<button class="myBtn btn my-3" onclick="window.location.href='${contextPath}/UserControl.do'">돌아가기</button>
		</div>
</div>
<jsp:include page="/common/05_footer.jsp"></jsp:include>
</div>
</body>
	

