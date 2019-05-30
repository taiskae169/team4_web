<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "team4_webtoon.registerBean" %>
<%@ page import = "team4_webtoon.registerDAO" %>

	<%
		request.setCharacterEncoding("euc-kr");
		
	%>
	<jsp:useBean id="member" class="team4_webtoon.registerBean">
	<jsp:setProperty property="*" name="member"/>
	</jsp:useBean>

	
	<%
		registerDAO dao = registerDAO.getInstance();
		dao.insertMember(member);
		response.sendRedirect("login.jsp");
	%>
	
	<br>
