<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "team4_webtoon.registerBean" %>
<%@ page import = "team4_webtoon.registerDAO" %>
    <%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="member" class="team4_webtoon.registerBean">
	<jsp:setProperty property="*" name="member"/>
	</jsp:useBean>
	<%
		String y = request.getParameter("id1");
		String y1 = request.getParameter("email1");
		if(y.equals("y") && y1.equals("y1")){
		registerDAO dao = registerDAO.getInstance();
		dao.insertMember(member);
		response.sendRedirect("loginFinal.jsp");

		}
		
		else {
			%>
			<script>
			alert("아이디와 이메일 중복 검사를 하세요");
			history.go(-1);
			</script>
			<%
		}
		
	
	%>