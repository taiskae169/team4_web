    <%@ page import = "search.SearchDAO"%>
    <%@ page import = "search.SearchVO" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "webtoon.list.*" %>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%


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

<%@include file="/menu.jsp" %>
<%@include file="/navigationBar.jsp" %>

	<!-- Page Content -->
<div class="container">

  <!-- Page Heading -->

  	<br>
  	<h1 class="my-4" style="text-align: center">작품을 등록하세요</h1>
  	<br><br><br>
  	<form action = "wb_registerPro.jsp" method="post">
		<div>
	<b>작품제목</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" size="100" maxlength="30" name="title" placeholder="  제목을 입력해주세요"> 
				<br><br><br>
	<b>소제목</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" size="100" maxlength="30" name="sub_title" placeholder="  소제목을 입력해주세요"> 
				<br><br><br>
	<b>장르</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "gen" id = "0" value = "0"checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "gen" id = "0" value = "1" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개그&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "gen" id = "0" value = "2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;판타지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "gen" id = "0" value = "3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액션&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "gen" id = "0" value = "4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;드라마&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "gen" id = "0" value = "5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;순정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "gen" id = "0" value = "6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;감성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "gen" id = "0" value = "7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스릴러&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "gen" id = "0" value = "8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시대극&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "gen" id = "0" value = "9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스포츠&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
	<b>태그</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
				<input type="text" size="30" maxlength="30" name="tag" placeholder="  태그를 입력해주세요"> 
				<br><br><br>
	<b>연재요일</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	

				<input type = "radio" name = "week" value = "1" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "week" value = "2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;화요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "week" value = "3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "week" value = "4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "week" value = "5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;금요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "week" value = "6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;토요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "week" value = "0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<br><br><br>
	<b>썸네일 이미지</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;크기 (700 x 400)에 맞게 올려주세요 (jpg 파일)<br>
	<input type = "file" name = "file">
	<br><br>
	<b>원고 등록</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  원고를 등록해주세요 <br><br><br>
	<b>내용을 확인하셨습니까?</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type = "radio" name = "writer" value = "<%=session.getAttribute("sessionID") %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;확인
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