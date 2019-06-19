<%@page import="webtoon.content.contentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cl_num = Integer.parseInt(request.getParameter("cl_num"));
	

	contentDAO dao = contentDAO.getInstance();
	
	dao.deleteContent(cl_num);
	
%>

		<script type="text/javascript">
			
			alert("삭제되었습니다..");
			location.href=document.referrer;
		</script>