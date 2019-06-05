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

<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>

<div class="container">
  	<br>
  	
  	<h1 class="my-4" style="text-align: center"><%=session.getAttribute("sessionID") %></h1>
  	<h5 style = "text-align : center">님의 정보 수정</h5>
  	<br><br><br>
  	<form action = "adjust.jsp" method="post" name = "userinput" onSubmit="return checkIt()">
		<div><br><br><br>
	<b>비밀번호를 입력하세요</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "password" name = "pw" required>
				<br><br><br><br><br><br><br><br><br>

				</div>
				<button class="btn btn-lg btn-warning btn-block text-uppercase" value ="submit">확인</button>
				<button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../main_page/MainPage.jsp'">돌아가기</button>
				</form>

</div>


<br><br><br><br><br><br>



<%@ include file="../bar/footer.jsp"%>
<!-- /.container -->
</body>
</html>