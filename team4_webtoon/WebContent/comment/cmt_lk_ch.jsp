<%@page import="webtoon.comment.cmtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "admin";//session.getAttribute(arg0);
	
	int cmt_num = Integer.parseInt(request.getParameter("num"));		//코멘트 번호
	String pageNum = request.getParameter("pageNum");	//코멘트 페이지 번호
	int mw_num = Integer.parseInt(request.getParameter("mw_num"));		//웹툰 번호
	int cl_num = Integer.parseInt(request.getParameter("cl_num"));		//웹툰 회차 번호
	int like = Integer.parseInt(request.getParameter("like"));			//1일시 좋아요, 2일시 싫어요 설정
	
	System.out.println("==============");
	System.out.println("코멘트번호 : " +cmt_num);
	System.out.println("아이디 : " +id);
	System.out.println("만화 번호  :" + mw_num);
	System.out.println("만화 회차번호 : " + cl_num);
	System.out.println("좋아요 : " + like);
	System.out.println("==============");
	cmtDAO dao = cmtDAO.getinstance();
	
	dao.chLike(id, mw_num, cl_num, like, cmt_num);
	
	

%>