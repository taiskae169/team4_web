<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "search.*" %>
<jsp:useBean id = "member" class = "search.SearchVO"/>
<jsp:setProperty property = "*" name = "member"/>
<%
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	SearchDAO a = SearchDAO.getInstance();
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>