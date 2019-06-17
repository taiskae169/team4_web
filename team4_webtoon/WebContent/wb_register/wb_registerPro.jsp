<%request.setCharacterEncoding("UTF-8"); %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%@ page import = "java.util.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
    <%@ page import = "webtoon.list.*" %>
<%@ page import = "webtoon.genre.*" %>
<%@ page import = "webtoon.week.*" %>
<%



	int size = 10*1024*1024;
	String title = "";
	String sub_title = "";
	int gen = 0;
	String tag = "";
	int week = 0;
	String writer = "";
	String sum = "";
	
	String path = request.getRealPath("resources/image/webtoon/");
	String path2 = request.getRealPath("resources/image/webtoon/thumbnail");

	
	try{

		MultipartRequest multi=new MultipartRequest(request,path2,size,"UTF-8",new DefaultFileRenamePolicy());
		title = multi.getParameter("title");	
		sub_title = multi.getParameter("sub_title");
		gen = Integer.parseInt(multi.getParameter("gen"));
		tag = multi.getParameter("tag");
		week = Integer.parseInt(multi.getParameter("week"));
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
	.label1{
		width:150px;
		margin-bottom:60px;
	}
	.input1{
		margin-right:20px;
	}
	
	.input2{
		margin-right:20px;
		margin-left:20px;
	}	
</style>
</head>
<body>

<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>

	<!-- Page Content -->
<div class="container" style = "margin-top: 100px; margin-bottom : 50px;">

  <!-- Page Heading -->

  	<br>
  	<h1 class="my-4" style="text-align: center">작품 확인</h1>
  	<br><br><br>

  	<form action = "fileCheck.jsp" method="post">
		<div>
	<label class = "label1">작품 제목</label>
				<%= title %><br>
	<label class = "label1">소제목</label>
				<%= sub_title %>
				<br>
	<label class = "label1">장르</label>
	<%
	genreDAO a = genreDAO.getInstance();
	genreVO c = a.genreCheck(gen);
	
	weekDAO week1 = weekDAO.getInstance();
	weekVO week2 = week1.weekCheck(week);
	%>
	<%= c.getValue() %>
				<br>
	<label class = "label1">태그</label>			
				<%= tag %>
				<br>
	<label class = "label1">연재요일</label>
	<%= week2.getValue() %>
		
				<br>
	<label class = "label1">줄거리</label>
				<%= sum %>
				<br>
	
	<label class = "label1">작가</label>	
				<%= writer %>
				<br>
	  <input type = "hidden" name = "title" value="<%=title %>">
      <input type = "hidden" name = "sub_title" value="<%=sub_title %>">
      <input type = "hidden" name = "gen" value="<%=gen %>">
      <input type = "hidden" name = "tag" value="<%=tag %>">
      <input type = "hidden" name = "week" value="<%=week %>">
      <input type = "hidden" name = "sum" value ="<%=sum %>">
      <input type = "hidden" name = "writer" value="<%=writer %>">

				
	
</div>

<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">작품 등록</button>
</form>
</div>


<%@ include file="../bar/footer.jsp"%>
<!-- /.container -->
</body>
</html>
