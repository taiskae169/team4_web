<%@page import="team4_webtoon.registerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
	int state = Integer.parseInt(request.getParameter("state"));
	int num = Integer.parseInt(request.getParameter("num"));
	
	registerDAO dao = registerDAO.getInstance();
	
	dao.updateMemberState(state, num);%>
	<!-- 현재 회원 상태 변경 -->
	
	
		<script type="text/javascript">
			
			alert("변경되었습니다.")
			location.href="admin_user.jsp";
		</script>
	<%
	//response.sendRedirect("admin_user.jsp");
	


%>
