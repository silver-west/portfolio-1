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
<script>
$("document").ready(function(){
	$("form").addClass("mt-5");
	$("label").addClass("form-label text-start w-100");
	$("#mentPw").addClass("text-danger mt-2");
	
	$("#submitBtn").click(function(e) {
		e.preventDefault();
		
		let inputPw = $("#inputPw").val();

		if (nullCheck($("#inputPw"))) {
            $("#inputPw").focus();
            $("#mentPw").text("비밀번호를 입력하세요");
            
            return;
        }
		
		$.ajax({
			url: "PwCheck.do",
			method: "POST",
			data: { pw: inputPw },
			success: function (response) {
				if (response == "pass") {
					$("form").submit();
				} else {
					$("#mentPw").text("틀린 비밀번호 입니다");
				}
			}
		});
	});
});

    function nullCheck(obj) {
        if (obj.val()) {
            return false;
        } else {
            return true;
        }
    }
</script>
</body>