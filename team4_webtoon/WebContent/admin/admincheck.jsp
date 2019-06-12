<%@page import="team4_webtoon.registerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	registerDAO levelcheck = registerDAO.getInstance();
	int level = levelcheck.level_check(id);

	if(level!=4){		
%>
		<script type="text/javascript">
			
			alert("관리자가 아닙니다..")
			location.href="/team4_webtoon/main_page/MainPage.jsp";
		</script>
		
<%}%>