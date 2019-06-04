<%@page import="team4_webtoon.registerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
	int state = Integer.parseInt(request.getParameter("state"));
	int num = Integer.parseInt(request.getParameter("num"));
	
	registerDAO dao = registerDAO.getInstance();
	
	dao.updateMemberState(state, num);
	
	


%>
<h1>변경되었습니다.</h1>
<script type="text/javascript">
	
	window.opener.location.reload();
	setTimeout('close()',3000)
	
</script>