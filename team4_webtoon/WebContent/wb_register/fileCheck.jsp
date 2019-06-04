<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtoon.list.*" %>
<jsp:useBean id = "member" class = "webtoon.list.WebToonListVO">
<jsp:setProperty property = "*" name = "member"/>
</jsp:useBean>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	WebToonListDAO dao = WebToonListDAO.getInstance();
	dao.insertWebtoon(member);
	response.sendRedirect("final.jsp");

%>