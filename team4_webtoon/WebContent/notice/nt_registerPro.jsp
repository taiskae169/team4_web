<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "webtoon.notice.*" %>
<jsp:useBean id = "member" class = "webtoon.notice.noticeVO"/>
<jsp:setProperty property = "*" name = "member"/>
<%
	noticeDAO dao = noticeDAO.getInstance();
	dao.insertNotice(member);
	response.sendRedirect("notice.jsp");
	
	
%>