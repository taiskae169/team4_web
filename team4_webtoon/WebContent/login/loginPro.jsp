<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%request.setCharacterEncoding("UTF-8"); %>
<%@ page import ="team4_webtoon.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
	<jsp:useBean id="member" class="team4_webtoon.registerBean"/>
	<jsp:setProperty property="*" name="member"/>

	<%
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	registerDAO dao = registerDAO.getInstance();
	int check = dao.loginCheck(id,pw);
	int level = dao.level_check(id);				//상태 체크 메서드

	String msg = "";
	%>	
	<%if(check == 1)
	{
		if(level==0){%>
			<script>
			alert("탈퇴회원입니다. 새로 가입하세요");
			history.go(-1);
			</script>
		<%}
		else if(level == 1){%>
		<script>
			alert("휴면회원입니다. 해제하시겠습니까?");

			location.href="levelPro.jsp";
		</script>
		<%session.setAttribute("sessionID",id); %>
		<%} else{
		session.setAttribute("sessionID",id);		//로그인 성공하면 아이디와 회원 등급을 세션으로 넘긴다.
		session.setAttribute("sessionSTATE",level);
		
		response.sendRedirect("../main_page/MainPage.jsp");
		}
		
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
