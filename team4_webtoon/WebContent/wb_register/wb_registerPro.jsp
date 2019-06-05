<%request.setCharacterEncoding("UTF-8"); %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%@ page import = "java.util.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
    <%@ page import = "webtoon.list.*" %>

<%

	int size = 10*1024*1024;
	String title = "";
	String sub_title = "";
	String gen = "";
	String tag = "";
	String week = "";
	String writer = "";
	String sum = "";
	
	String path = request.getRealPath("resources/image/webtoon/");
	String path2 = request.getRealPath("resources/image/webtoon/thumbnail");

	
	try{

		MultipartRequest multi=new MultipartRequest(request,path2,size,"UTF-8",new DefaultFileRenamePolicy());
		title = multi.getParameter("title");	
		sub_title = multi.getParameter("sub_title");
		gen = multi.getParameter("gen");
		tag = multi.getParameter("tag");
		week = multi.getParameter("week");
		sum = multi.getParameter("sum");
		writer = multi.getParameter("writer");
		
		path += title;
		File Folder = new File(path);
		Folder.mkdir();
		
	}catch (Exception e){
		e.printStackTrace();
	}

%>

<html>
<head>
<meta charset="UTF-8">
<title>작품 등록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
	table, th, td{
		border : 1px solid #bcbcbc;
	}
	table{
		width : 100%;
		height : 150px;
	}
</style>
</head>
<body>

<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>

	<!-- Page Content -->
<div class="container">

  <!-- Page Heading -->

  	<br>
  	<h1 class="my-4" style="text-align: center">작품 확인</h1>
  	<br><br><br>

  	<form action = "fileCheck.jsp" method="post">
		<div>
	<b>작품제목</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%= title %><br><br><br>
	<b>소제목</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%= sub_title %>
				<br><br><br>
	<b>장르</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%= gen %>
				<br><br><br>
	<b>태그</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
				<%= tag %>
				<br><br><br>
	<b>연재요일</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
				<%= week %>
				<br><br><br>
	<b>줄거리</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%= sum %>
				<br><br><br>
	
	<b>작가</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
				<%= writer %>
				<br><br><br>
	  <input type = "hidden" name = "title" value="<%=title %>">
      <input type = "hidden" name = "sub_title" value="<%=sub_title %>">
      <input type = "hidden" name = "gen" value="<%=gen %>">
      <input type = "hidden" name = "tag" value="<%=tag %>">
      <input type = "hidden" name = "week" value="<%=week %>">
      <input type = "hidden" name = "sum" value ="<%=sum %>">
      <input type = "hidden" name = "writer" value="<%=writer %>">
				
	
</div>
<div>
<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">작품 등록</button>
<button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../main_page/MainPage.jsp'">돌아가기</button>
<br><br><br>
</div>
</form>
</div>


<%@ include file="../bar/footer.jsp"%>
<!-- /.container -->
</body>
</html>
