<%@ page import = "java.util.ArrayList" %>
<%@ page import = "team4_webtoon.registerDAO" %>
<%@ page import = "team4_webtoon.registerBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	
%>
<!DOCTYPE html>

<html>
<head>
<title>회원 정보 수정</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>

</head>
<body onload = "begin()">

<%@include file="/menu.jsp" %>
<%@include file="/navigationBar.jsp" %>

<div class="container">
  	<br>
  	
  	<h1 class="my-4" style="text-align: center"><%=session.getAttribute("sessionID") %></h1>
  	<h5 style = "text-align : center">님의 정보 수정</h5>
  	<br><br><br>
  	<form action = "changePW.jsp" method="post" name = "userinput" onSubmit="return checkIt()">
		<div>
	<b>비밀번호 변경</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "password" name = "password" required> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="changePw" value = "비밀번호 변경"> 
				<br><br><br>
				</div>
				</form>
	<form action = "changeEmail.jsp" method="post" name = "userinput">
	<b>이메일 변경</b>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type = "email" name = "email" required> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" name="changeEmail" value = "이메일 변경"> 

				<br><br><br>
				
				
				</form>
	<form action = "changeName.jsp" method="post" name = "userinput">
	<b>이름 변경</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;		
			<input type = "text" name = "name" required> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="changeName" value = "이름 변경"> 
				<br><br><br>
</form>

<form action = "changeAge.jsp" method="post" name = "userinput">
	<b>나이 변경</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type = "text" name = "age" required> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" name="changeAge" value = "나이 변경"> 
	<br><br><br><br><br>
</form>	
</div>
<div class = "container">
<button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../main_page/MainPage.jsp'">돌아가기</button>
<br><br><br><br><br><br>
</div>


<%@ include file="../footer.jsp"%>
<!-- /.container -->
</body>
</html>