
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "team4_webtoon.registerDAO" %>
    <%@ page import = "team4_webtoon.registerBean" %>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<%

%>

<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">


</script>
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
  	
  	<h1 class="my-4" style="text-align: center"><%=session.getAttribute("sessionID") %></h1>
  	<h5 style = "text-align : center">님의 정보 수정</h5>
  	<br><br><br>
  	<form action = "changePW.jsp" method="post" name = "userinput">
		<div>
	<b>비밀번호 변경</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "password" name = "password">
				<input type="button" name="changePw" value = "비밀번호 변경"> 
				<br><br><br>
				</div>
				</form>
	<form>
	<b>이메일 변경</b>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type = "text" name = "email">
	<input type="button" name="changeEmail" value = "이메일 변경"> 

				<br><br><br>
				
				
				</form>
	<form>
	<b>이름 변경</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;		
			<input type = "text" name = "name">
				<input type="button" name="changeName" value = "이름 변경"> 
				<br><br><br>
</form>
<form>
	<b>나이 변경</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type = "text" name = "age">
	<input type="button" name="changeAge" value = "나이 변경"> 
	<br><br><br>
</form>	
</div>
<div>
<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">작품 등록</button>
<button class="btn btn-lg btn-primary btn-block text-uppercase" type="reset">수정하기</button>
<button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../main_page/MainPage.jsp'">돌아가기</button>
<br><br><br>
</div>


<%@ include file="../footer.jsp"%>
<!-- /.container -->
</body>
</html>