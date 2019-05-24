<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "team4_webtoon.registerBean" %>
<%@ page import = "team4_webtoon.registerDAO" %>


	<%
		request.setCharacterEncoding("euc-kr");
		
	%>
	<jsp:useBean id="registerBean" class="team4_webtoon.registerBean"/>
	<jsp:setProperty property="*" name="registerBean"/>
	

	
	<%
		registerDAO dao = registerDAO.getInstance();
		dao.insertMember(registerBean);
	%>
	
		<%=registerBean.getId() %>님 가입을 축하합니다.
	<br>
