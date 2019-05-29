<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="team4_webtoon.registerDAO" %>
<!DOCTYPE html>


	<jsp:useBean id="registerBean" class="team4_webtoon.registerBean"/>
	<jsp:setProperty property="*" name="registerBean"/>

	<%
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	registerDAO dao = registerDAO.getInstance();
	int check = dao.idCheck(name, email);
	
	String msg = "";
	
	if(check == 1)
	{%>
		<%=  %>
		
<% %>	}else if(check==0){ %>
	<script> 
	  alert("이메일이 맞지 않습니다.");
      history.go(-1);
	</script>
<%	}else{ %>
	<script>
	  alert("이름이 맞지 않습니다.");
	  history.go(-1);
	</script>
<%}	%>	
