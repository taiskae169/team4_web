<%@page import="webtoon.list.WebToonListDAO"%>
<%@page import="team4_webtoon.registerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
	int mag  = Integer.parseInt(request.getParameter("mag"));
	int num = Integer.parseInt(request.getParameter("num"));
	
	WebToonListDAO dao = WebToonListDAO.getInstance();
	dao.updateMag(num, mag);
	
	%>
		<script type="text/javascript">
			
			alert("변경되었습니다.");
			location.href="admin_webtoon.jsp";
		</script>
