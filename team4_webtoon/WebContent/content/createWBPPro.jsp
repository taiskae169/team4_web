<%request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtoon.content.*" %>
<jsp:useBean id = "member" class = "webtoon.content.contentVO">
<jsp:setProperty property = "*" name = "member"/>
</jsp:useBean>

<%
	contentDAO dao = contentDAO.getInstance();
	dao.insertwb(member);
	response.sendRedirect("final.jsp");
	
	/*
	전체적인 로직
	
	받은 파라미터를 DB에 저장
	저장 후 final 페이지로 이동
	*/
%>