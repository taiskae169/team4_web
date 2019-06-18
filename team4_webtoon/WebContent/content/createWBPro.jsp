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
	
	ArrayList<String> contentwb = new ArrayList<String>();

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
<html>
<head>
<meta charset="UTF-8">
<title>회차등록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
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
<%@include file = "../bar/menu.jsp" %>
<%@include file = "../bar/navigationBar.jsp" %>

<div class = "container" style = "margin-top:100px; margin-bottom : 50px;">
<br>

<h1 class = "my-4" style = "text-align : center">작품확인</h1>


	<form action = "createWBPPro.jsp" method = "post">
	<div>
		<label class = "label1">작품 제목</label>
		<%=title %><br>
		<label class = "label1">내용</label>
		<%=cl_content %><br>
		<label class = "label1">소제목</label>
		<%=cl_title_id %><br>
		<label class = "label1">작가</label>
		<%=cl_writer %><br>
	</div>
		<input type = "hidden" name = "title" value="<%=title %>">
		<input type = "hidden" name = "cl_title" value="<%=cl_title %>">
		<input type = "hidden" name = "cl_content" value="<%=cl_content %>">
		<input type = "hidden" name = "cl_title_id" value="<%=cl_title_id %>">
		<input type = "hidden" name = "cl_writer" value="<%=cl_writer %>">
		<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">회차 등록</button>
	</form>
	</div>
	<%@ include file ="../bar/footer.jsp" %>
	</body>
</html>
	