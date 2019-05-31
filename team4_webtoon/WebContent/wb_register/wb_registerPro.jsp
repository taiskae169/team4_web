<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%@ page import = "java.util.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
    
    <%@ page import = "webtoon.list.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	
%>

<jsp:useBean id = "member" class = "webtoon.list.WebToonListVO">
<jsp:setProperty property = "*" name = "member"/>
</jsp:useBean>

<%
	WebToonListDAO dao = WebToonListDAO.getInstance();
	dao.insertWebtoon(member);
	response.sendRedirect("../main_page/MainPage.jsp");
	
	%>