<%@page import="webtoon.comment.cmtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String state = request.getParameter("state");				// 변환할 상태정보 0일시 정상, 1일시 신고된 댓글
	String num = request.getParameter("num");					// 댓글 번호
	String pageNum = request.getParameter("pageNum");			// 변환 후 돌아가기 위한 페이지 번호
	String mw_num = request.getParameter("mw_num");				// 웹툰 번호
	String cl_num = request.getParameter("cl_num");				// 회차 번호
	
	
	
	cmtDAO dao = cmtDAO.getinstance();
	
	dao.chState(num, state);
	
	//작업 완료 후 다시 돌아가기 위한 항목
	//이후 컨텐츠/웹툰 상세 페이지 완성 시 해당페이지로 변경 필요
%>


<script type="text/javascript">
	alert("변경완료");
	location.href = document.referrer;
</script>