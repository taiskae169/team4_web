<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "team4_webtoon.*"%>

	<jsp:useBean id="member" class="team4_webtoon.registerBean"/>
	<jsp:setProperty property="*" name="member"/>
	
	<%
		String id = (String)session.getAttribute("sessionID");
		member.setId(id);
		
		registerDAO manager = registerDAO.getInstance();
		manager.changeEmail(member);
	%>
	
바뀜!!
      3초후에 메인으로 이동합니다.<meta http-equiv="Refresh" content="1;url=../main_page/MainPage.jsp" >