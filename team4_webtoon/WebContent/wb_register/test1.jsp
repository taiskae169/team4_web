<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "search.*" %>
<%@ page import = "java.io.File" %>
<%@ page import = "webtoon.like.*" %>
<%@ page import = "webtoon.content.*" %>

<%

	String id1 = (String)session.getAttribute("sessionID");

	String title = (String)session.getAttribute("sessionTitle");
	int num = (int)session.getAttribute("sessionnum");
	String writer = (String)session.getAttribute("sessionwriter");

	%>