<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="navBar container-fluid bg-white d-flex justify-content-center">
    <div class="row w-120 text-center">
        <div class="nav-item col-6 col-sm-3 p-1">
            <a href="${contextPath}/BoardIndex.do" class="nav-link">게시판</a>
        </div>
        <div class="nav-item col-6 col-sm-3 p-1">
            <a href="${contentPath}/PointAdmin.do" class="nav-link">포인트</a>
        </div>
        <div class="nav-item col-6 col-sm-3 p-1">
            <a href="#" class="nav-link">준비중</a>
        </div>
        <div class="nav-item col-6 col-sm-3 p-1">
            <a href="${contextPath}/Admin.do" class="nav-link">관리자 메인</a>
        </div>
    </div>
</div>