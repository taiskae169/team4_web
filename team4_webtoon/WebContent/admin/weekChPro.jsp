<%@page import="webtoon.list.WebToonListDAO"%>
<%@page import="team4_webtoon.registerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
	int week  = Integer.parseInt(request.getParameter("week"));
	int num = Integer.parseInt(request.getParameter("num"));
	
	WebToonListDAO dao = WebToonListDAO.getInstance();
	dao.updateWeek(num, week);
	
	%>
		<script type="text/javascript">
			
			alert("변경되었습니다.");
			location.href="admin_webtoon.jsp";
		</script>
	<%
	//response.sendRedirect("admin_user.jsp");
	


%>