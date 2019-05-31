<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "team4_webtoon.*" %>
	<jsp:useBean id="member" class="team4_webtoon.registerBean">
	<jsp:setProperty property="*" name="member"/>
	</jsp:useBean>
	<%
		request.setCharacterEncoding("euc-kr");
		String id = (String)session.getAttribute("sessionID");
		member.setId(id);
		member.setState(3);

		registerDAO dao = registerDAO.getInstance();

		dao.updateMember(member);
		
	%>
	
	
	
바뀜!!
      5초후에 메인으로 이동합니다.<meta http-equiv="Refresh" content="3;url=../main_page/MainPage.jsp" >
	
	