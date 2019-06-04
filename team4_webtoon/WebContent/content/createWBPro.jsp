<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%@ page import = "java.util.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
    
    <%@ page import = "webtoon.content.*" %>
    <%@ page import = "webtoon.list.*" %>
<%
	request.setCharacterEncoding("euc-kr");


	int size = 10*1024*1024;
	String title = "";
	String cl_title = "";
	String cl_content = "";
	int cl_title_id = 10;
	String cl_writer = "";
	
	
	
	String path = request.getRealPath("resources/image/webtoon/");
	String path2 = request.getRealPath("resources/image/webtoon/thumbnail");
	System.out.println(cl_title_id);
	System.out.println(path);
	try{

		MultipartRequest multi1=new MultipartRequest(request,path,size,"UTF-8",new DefaultFileRenamePolicy());
		title = multi1.getParameter("title");	
		cl_title = multi1.getParameter("cl_title");
		cl_content = multi1.getParameter("cl_content");
		cl_writer = multi1.getParameter("cl_writer");
		
		System.out.println(cl_title_id);	
		System.out.println(cl_title);

	}catch (Exception e){
		e.printStackTrace();
	}

%>
	
	<form action = "createWBPPro.jsp" method = "post">
		<input type = "hidden" name = "title" value="<%=title %>">
		<input type = "hidden" name = "cl_title" value="<%=cl_title %>">
		<input type = "hidden" name = "cl_content" value="<%=cl_content %>">
		<input type = "hidden" name = "cl_title_id" value="<%=cl_title_id %>">
		<input type = "hidden" name = "cl_writer" value="<%=cl_writer %>">
		<input type = "submit">
	</form>