<%request.setCharacterEncoding("UTF-8"); %>    
<%@ page import = "webtoon.content.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "webtoon.list.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	
	int cl_title_id = Integer.parseInt(request.getParameter("mw_num"));		
	contentDAO dao = contentDAO.getInstance();
	contentVO vo = new contentVO();

	String title = request.getParameter("title");
	int a = dao.getAuto(cl_title_id);			//자동회차를 생성하는 메서드
	
	/*
	전체적인 로직
	
	자동 회차를 위해 mw_num을 받아와서 cl_title_id에 넣는다.
	웹툰 폴더에 이미지를 넣기 위해 제목을 받아온다. 제목을 받아서 세션으로 넘긴다. (경로상 ../../title 이 되게 하기 위해)
	
	=>createWBPro 로 넘어감
	*/
%>

<html>
<head>
<meta charset="UTF-8">
<title>작품 등록</title>
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

<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>

	<!-- Page Content -->
<div class="container" style="margin-top:100px;">

  <!-- Page Heading -->

  	<br>
  	<h1 class="my-4" style="text-align: center">작품 회차를 등록하세요</h1>
  	<br><br><br>
  	<form action = "createWBPro.jsp" method="post" enctype = "multipart/form-data">
		<div>
	<label class = "label1">자동회차</label><%= a %>화 <br><br>
	<label class = "label1">소제목</label>
	<input type="text" size="100" maxlength="30" name="cl_title" placeholder="  소제목을 입력해주세요"> 
	
	<label class = "label1">회차 썸네일</label>
	<input type = "file" name = "thum"><br><br><br>
	
	<label class = "label1">웹툰 등록</label>
	<input type = "file" name = "contentwb"><br><br><br>


	<b>내용을 확인하셨습니까?</b>
	<input type = "radio" name = "cl_writer" value = "<%=session.getAttribute("sessionID") %>" class = "input2" style = "margin-bottom:50px;" required>확인
	<br><br><br>
	<input type = "hidden" name = "title" value = "<%=title %>">
	<input type = "hidden" name = "cl_title_id" value = "<%=cl_title_id %>">
</div>

<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">작품 등록</button><br>
<button class="btn btn-lg btn-primary btn-block text-uppercase" type="reset">수정하기</button>
</form>
<br><br><br>
</div>
<% 
session.setAttribute("sessionTitle",title);		//생성된 웹툰 폴더에 웹툰을 집어넣기 위해 title 값을 넘김 
%>
<%@ include file="../bar/footer.jsp"%>
<!-- /.container -->
</body>
</html>