<%@ page import = "webtoon.content.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "webtoon.list.*" %>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int cl_title_id = 1000;
	contentDAO dao = contentDAO.getInstance();
	contentVO vo = new contentVO();

	int a = dao.getAuto(cl_title_id);
%>

<html>
<head>
<meta charset="UTF-8">
<title>작품 등록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>

</style>
</head>
<body>

<%@include file="/menu.jsp" %>
<%@include file="/navigationBar.jsp" %>

	<!-- Page Content -->
<div class="container">

  <!-- Page Heading -->

  	<br>
  	<h1 class="my-4" style="text-align: center">작품 회차를 등록하세요</h1>
  	<br><br><br>

  	<form action = "createWBPro.jsp" method="post" enctype = "multipart/form-data">
		<div>
	<b>자동회차</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%= a %>화
				<br><br><br>
	<b>소제목</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" size="100" maxlength="30" name="cl_title" placeholder="  소제목을 입력해주세요"> 
				<br><br><br>
	<b>내용</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
				<input type = "text" size = "100" name = "cl_content" placeholder = "   줄거리를 입력해주세요">
<br><br><br>
	<input type = "file" name = "contentwb"><br><br><br>


	<b>내용을 확인하셨습니까?</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type = "radio" name = "cl_writer" value = "<%=session.getAttribute("sessionID") %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;확인
	<br><br><br>
	
</div>
<div>
<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">작품 등록</button>
<button class="btn btn-lg btn-primary btn-block text-uppercase" type="reset">수정하기</button>
<button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../main_page/MainPage.jsp'">돌아가기</button>
<br><br><br>
</div>
</form>
</div>


<%@ include file="../footer.jsp"%>
<!-- /.container -->
</body>
</html>