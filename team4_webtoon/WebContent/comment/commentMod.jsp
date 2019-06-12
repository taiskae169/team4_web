<%@page import="webtoon.comment.cmtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	System.out.println(num);
	System.out.println(content);
	
	cmtDAO dao = cmtDAO.getinstance();
	
	dao.modifyCmt(num, content);
%>

<script script type="text/javascript" >
	alert("수정되었습니다.");
	location.href=document.referrer;

</script>