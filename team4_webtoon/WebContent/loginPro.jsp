<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="team4_webtoon.registerDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("euc-kr");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	
	registerDAO dao = registerDAO.getInstance();
	int check = dao.loginCheck(id,pw);
	
	String msg = "";
	
	if(check == 1)
	{
		session.setAttribute("sessionID",id);
		msg = "menu.jsp";
	}
	else if(check == 0)
	{
		msg = "login.jsp?msg=0";
	}
	else
	{
		msg = "login.jsp?msg=-1";
	}
	response.sendRedirect(msg);
	%>
</body>
</html>