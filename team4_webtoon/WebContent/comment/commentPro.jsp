<%@page import="webtoon.comment.cmtDAO"%>
<%@page import="webtoon.comment.cmtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String id = request.getParameter("id");							//아이디
	int mw_num = Integer.parseInt(request.getParameter("mw_num"));	//웹툰 번호
	int cl_num = Integer.parseInt(request.getParameter("cl_num"));	//회차 번호
	String cmt = request.getParameter("comment");					//코멘트 내용
	
	cmtDAO dao = cmtDAO.getinstance();
	
	dao.addCmt(id, mw_num, cl_num, cmt);
	//코멘트 추가
	
	

%>


<script type="text/javascript">
	location.href=document.referrer;
</script>

<!-- document.referrer로 뒤로가기 + 새로고침 실시 -->