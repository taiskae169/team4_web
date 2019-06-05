<%@page import="webtoon.list.WebToonListDAO"%>
<%@page import="team4_webtoon.registerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
	int ger  = Integer.parseInt(request.getParameter("ger"));
	int num = Integer.parseInt(request.getParameter("num"));
	
	WebToonListDAO dao = WebToonListDAO.getInstance();
	
	dao.updateGer(num, ger);%>
	
	
		<script type="text/javascript">
			
			alert("변경되었습니다.")
			location.href="admin_webtoon.jsp";
		</script>
	<%
	//response.sendRedirect("admin_user.jsp");
	


%>