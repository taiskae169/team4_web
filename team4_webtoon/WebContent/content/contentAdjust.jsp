<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "webtoon.content.*" %>
<jsp:useBean id = "member" class = "webtoon.content.contentVO"/>
<jsp:setProperty property = "*" name = "member"/>
<%
	int cl_num = Integer.parseInt(request.getParameter("cl_num"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회차 수정</title>
</head>
<body>

</body>
</html>