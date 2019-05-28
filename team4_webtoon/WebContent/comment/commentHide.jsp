<%@page import="webtoon.comment.cmtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String state = request.getParameter("state");
	String num = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	String mw_num = request.getParameter("mw_num");
	String cl_num = request.getParameter("cl_num");
	
	
	System.out.println("----comment hide에서 변수값 확인 ---------");
	System.out.println(pageNum);
	System.out.println(num);
	System.out.println(mw_num);
	System.out.println(cl_num);
	System.out.println("==========");
	
	cmtDAO dao = cmtDAO.getinstance();
	
	dao.chState(num, state);
	
	response.sendRedirect("comment.jsp?cmtNum=" + pageNum + "&mw_num="+mw_num+"&cl_num="+cl_num);
%>