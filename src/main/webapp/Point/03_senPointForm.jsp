<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/Point/02_mini_navi.jsp"></jsp:include>
<body>
<div class="bg-white contentBox" align="center">
    <div align="center">
	 	<span class="contentTitle">포인트 보내기</span>  
  	</div>
    <div>
        <span id="pointMent">보유 포인트 : </span><span id="myPoint">${user.myPoint}</span>
    </div>
    <div>
        <form id="sendForm" action="${contextPath}/SendPointPro.do" method="post">
            <table>
                <tr>
					<td>선택</td>
					<td>
						<input type="radio" name="type" value="id" checked="checked" >아이디
						<input type="radio" name="type" value="nick">닉네임
					</td>
				</tr>
				<tr>
					<td>받는 분</td>
					<td><input type="text" name="recieve"></td>
				</tr>
				<tr>
					<td>보낼 포인트</td>
					<td><input type="text" name="sendPoint"> P</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="sendUser" value="${user.id}">
						<input id="submitBtn" type="submit" value="보내기">
					</td>
				</tr>
            </table>
		</form>
		<div align="center">
			<p id="ment" class="text-danger my-2"></p>
		</div>
    </div>
</div>
<script src="${contextPath}/Point/js/sendPoint.js"></script>
</body>