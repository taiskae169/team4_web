<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="webtoon.bookmark.BookmarkDAO" %> 
<%@page import="webtoon.episode.WTepVO" %> 
<%@page import="webtoon.content.contentVO" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책갈피 등록 후 책갈피 페이지로 가기 </title>

<%
	BookmarkDAO DAObm=BookmarkDAO.getInstance();
	String bmid=(String)session.getAttribute("sessionID");
	int Ncl=Integer.parseInt(request.getParameter("cl_num"));
	int Nmw=Integer.parseInt(request.getParameter("mw_num"));	
	
	WTepVO info=null;
	info=DAObm.getInfo(Nmw,Ncl);
	//System.out.println("WTepVO에서 info 가져오기 성공");
	
	String wtT=info.getMwTitle();  //웹툰 제목
	String clT=info.getClTitle(); //에피소드 제목
	String wtW=info.getClWriter(); //웹툰 작가명
	String img=null; 
	img=DAObm.getThumbIMG(Ncl); //에피소드 대표 썸네일

	DAObm.addBMtoDB(bmid,Nmw,Ncl,wtT,clT,wtW,img);
	//System.out.println("BookmarkVO에 등록 성공");

	//System.out.println("[시작] like_check 테이블 bm_ch에 등록 시작");
	DAObm.addBMch(bmid,Nmw,Ncl);
	//System.out.println("[끝] like_check 테이블 bm_ch에 등록 끝");
	
%>
	<script>
	location.href= "/team4_webtoon/bookmark/bmPage.jsp";
	</script>

<!--	<title>책갈피 등록 후 뷰어페이지로 가기</title>
<script>	location.href=document.referrer; </script>  -->





</head>
<body>

</body>
</html>