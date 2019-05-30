<%@page import="webtoon.comment.cmtDAO"%>
<%@page import="webtoon.comment.cmtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String id = request.getParameter("id");
	int mw_num = Integer.parseInt(request.getParameter("mw_num"));
	int cl_num = Integer.parseInt(request.getParameter("cl_num"));
	String cmt = request.getParameter("comment");
	
	cmtDAO dao = cmtDAO.getinstance();
	
	dao.addCmt(id, mw_num, cl_num, cmt);
	
	
	

%>


<script type="text/javascript">
	location.href=document.referrer;
</script>