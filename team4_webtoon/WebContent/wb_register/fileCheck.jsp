<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtoon.list.*" %>
<jsp:useBean id = "member" class = "webtoon.list.WebToonListVO">
<jsp:setProperty property = "*" name = "member"/>
</jsp:useBean>

<%
	WebToonListDAO dao = WebToonListDAO.getInstance();
	dao.insertWebtoon(member);
	response.sendRedirect("../main_page/MainPage.jsp");

%>