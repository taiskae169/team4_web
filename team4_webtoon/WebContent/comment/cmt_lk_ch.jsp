<%@page import="java.awt.Window"%>
<%@page import="webtoon.comment.cmtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "admin"; //(String)session.getAttribute("sessionID");
	
	int cmt_num = Integer.parseInt(request.getParameter("num"));		//코멘트 번호
	String pageNum = request.getParameter("pageNum");	//코멘트 페이지 번호
	int mw_num = Integer.parseInt(request.getParameter("mw_num"));		//웹툰 번호
	int cl_num = Integer.parseInt(request.getParameter("cl_num"));		//웹툰 회차 번호
	int like = Integer.parseInt(request.getParameter("like"));			//1일시 좋아요, 2일시 싫어요 설정
	int ch = Integer.parseInt(request.getParameter("ch"));				//0일시 삭제, 1일시 추가
	

	cmtDAO dao = cmtDAO.getinstance();
	if(ch==1){
		dao.chLike(id, mw_num, cl_num, like, cmt_num);
		//1일시 추가를 위한 메소드
	}else{
		dao.chLike(id, cmt_num, like);
		//삭제를 위한 메소드
	}
	
	//response.sendRedirect("/team4_webtoon/comment/comment.jsp");
%>
<script type="text/javascript">
	location.href = document.referrer;
</script>