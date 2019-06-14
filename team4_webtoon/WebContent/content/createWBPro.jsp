<%request.setCharacterEncoding("UTF-8"); %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%@ page import = "java.util.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
  
    <%@ page import = "webtoon.content.*" %>
    <%@ page import = "webtoon.list.*" %>
<%


	int size = 10*1024*1024;
	String title = (String)session.getAttribute("sessionTitle");// title 안에 이미지 저장 위해 세션으로 받아옴
	String cl_title = "";
	String cl_content = "";
	int cl_title_id = 0;
	String cl_writer = "";
	
	

	String path = request.getRealPath("resources/image/webtoon/" + title);		//받아온 sessionTitle 값으로 경로 설정

	try{

		MultipartRequest multi1=new MultipartRequest(request,path,size,"UTF-8",new DefaultFileRenamePolicy());	//경로에 이미지 저장
		title = multi1.getParameter("title");	
		cl_title = multi1.getParameter("cl_title");
		cl_content = multi1.getParameter("cl_content");
		cl_writer = multi1.getParameter("cl_writer");
		cl_title_id = Integer.parseInt(multi1.getParameter("cl_title_id"));

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