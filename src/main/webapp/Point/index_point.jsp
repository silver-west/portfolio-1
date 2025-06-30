<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("currentPage", 1);
	session.setAttribute("historyCount", 5);
	session.setAttribute("btnCount", 3);
	
	String path = request.getContextPath();
	response.sendRedirect(path + "/PointMain.do");

%>