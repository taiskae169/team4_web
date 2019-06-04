<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtoon.content.*" %>
<jsp:useBean id = "member" class = "webtoon.content.contentVO">
<jsp:setProperty property = "*" name = "member"/>
</jsp:useBean>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	contentDAO dao = contentDAO.getInstance();
	dao.insertwb(member);
	response.sendRedirect("../main_page/MainPage.jsp");

%>