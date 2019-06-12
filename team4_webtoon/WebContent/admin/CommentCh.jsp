<%@page import="webtoon.comment.cmtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String state = request.getParameter("state");
	String num = request.getParameter("num");
	
	
	cmtDAO dao = cmtDAO.getinstance();
	
	dao.chState(num, state);
	
	response.sendRedirect("admin_comment.jsp");
%>