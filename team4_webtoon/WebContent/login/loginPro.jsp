<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="team4_webtoon.registerDAO" %>
<!DOCTYPE html>


	<jsp:useBean id="registerBean" class="team4_webtoon.registerBean"/>
	<jsp:setProperty property="*" name="registerBean"/>

	<%
	request.setCharacterEncoding("euc-kr");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	registerDAO dao = registerDAO.getInstance();
	int check = dao.loginCheck(id,pw);
	
	String msg = "";
	
	if(check == 1)
	{
		session.setAttribute("sessionID",id);
		response.sendRedirect("../search.jsp");
		
	}else if(check==0){%>
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%	}else{ %>
	<script>
	  alert("아이디가 맞지 않습니다.");
	  history.go(-1);
	</script>
<%}	%>	
