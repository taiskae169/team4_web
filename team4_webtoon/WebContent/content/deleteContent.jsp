<%@page import="webtoon.content.contentDAO"%>
<%@page import="webtoon.comment.cmtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	contentDAO dao = contentDAO.getInstance(); 
	dao.deleteContent(num);
%>


		<script type="text/javascript">
			
			alert("삭제되었습니다.")
			location.href=document.referrer;
		</script>