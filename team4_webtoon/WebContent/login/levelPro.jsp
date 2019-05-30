<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "team4_webtoon.*" %>
	<jsp:useBean id="member" class="team4_webtoon.registerBean">
	<jsp:setProperty property="*" name="member"/>
	</jsp:useBean>
	<%
		request.setCharacterEncoding("euc-kr");
		String id = (String)session.getAttribute("sessionID");
		
		registerDAO dao = registerDAO.getInstance();
		registerBean c = dao.getMember(id);
		
		dao.updateMember(member);
		
	%>
바뀜!!!
	