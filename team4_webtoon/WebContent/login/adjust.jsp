<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "team4_webtoon.registerDAO" %>
<%@ page import = "team4_webtoon.registerBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id = "member" class = "team4_webtoon.registerBean"/>
<jsp:setProperty property = "*" name = "member"/>
<%
	String pw = request.getParameter("pw");					//입력받은 pw값을 가져온다
	String id1= (String)session.getAttribute("sessionID");	//메뉴에 있는 세션 아이디를 가져와 id1에 넣는다.
	registerDAO a = registerDAO.getInstance();			
	registerBean b = a.adjust(id1, pw);						//adjust 메서드 사용(id, pw 사용해 이메일, 이름, 나이 반환)
	int check1 = a.loginCheck(id1, pw);						//id1과 pw가 같으면 1, 다르면 0
	System.out.println(pw);
	/*
	전체적인 로직
	
	각 값을 입력 받아  change...jsp 페이지로 넘긴다.
	로그인 체크 메서드를 사용해서 비밀번호가 틀린다면 수정 페이지로 접근할 수 없다.
	*/
%>
<!DOCTYPE html>

<html>
<head>
<title>회원 정보 수정</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<style>
	.label1{
		width:150px;
		margin-bottom:30px;
	}
	.input1{
		margin-right:20px;
	}
	
	.input2{
		margin-right:20px;
		margin-left:20px;
	}	
	.input3{
		margin-right : 20px;
	}
	.bottom{
		margin-bottom : 50px;
	}
</style>
</head>

<body>
<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>
<%if (check1 == 1){ 
//세션 아이디와 비밀번호가 일치할 때 실행되는 문
%>
<div class="container" style="margin-top:100px;">
  	<br>  	
  	<h1 class="my-4" style="text-align: center"><%=session.getAttribute("sessionID") %></h1>
  	<h5 style = "text-align : center">님의 정보 수정</h5>
  	
  	<form action = "changePW.jsp" method="post" class = "bottom" name = "changePW" style = "margin-top:100px;">
		<div>
			<label class = "label1"><b>비밀번호 변경</b></label><br><br>
				<input type = "password" name = "password" required class = "input1">
				<input type="submit" name="changePw" value = "비밀번호 변경" class = "btn btn-outline-dark btn-sm"> 
		</div>
		<hr>
	</form>
	
	<!--  <form action = "changeEmail.jsp" method="post" name = "changeEmail" class = "bottom">
		<label class = "label1"><b>이메일 변경</b></label>
		<%=b.getEmail() %><br><br>
		<input type = "email" name = "email" required class = "input3">
		<input type="submit" name="changeEmail" value = "이메일 변경" class = "btn btn-info btn-sm">
		 <hr>
	</form>
	-->
	<form action = "changeName.jsp" method="post" name = "changeName" class = "bottom">
		<label class = "label1"><b>이름 변경</b></label><%=b.getName() %><br><br>
		<input type = "text" name = "name" class = "input3" required>
		<input type="submit" name="changeName" value = "이름 변경" class = "btn btn-outline-dark btn-sm"> 
		<hr>
	</form>

	<form action = "changeAge.jsp" method="post" name = "changeAge" class = "bottom">
		<label class = "label1"><b>나이 변경</b></label><%= b.getAge() %><br><br>
		<input type = "text" name = "age" required class = "input3">
		<input type = "hidden" name = "pw" value = "<%=pw %>">
		<input type="submit" name="changeAge" value = "나이 변경" class = "btn btn-outline-dark btn-sm"> 
		<hr>
	</form>	

	<form action = "delete.jsp" method ="post" name = "delete" class = "bottom">
	<label class = "label1"><b>회원 탈퇴</b></label>
	<br><br>
	<input type = "password" name = "pw" placeholder = "비밀번호를 입력하세요." class = "input3" required>
	<input type = "submit" name = "delete" value = "회원탈퇴" class = "btn btn-outline-dark btn-sm">
	
	</form>
</div>

<div class = "container" style = "margin-bottom : 100px;">
	<button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../main_page/MainPage.jsp'">돌아가기</button>
</div>
<%@ include file="../bar/footer.jsp"%>

<!-- 비밀번호가 틀렸을 시  -->
<%} else if (check1 == 0) {
%>	<div class = "container" style = "margin-top:130px;">
  	<h1 style = "text-align : center">비밀번호가 틀립니다.</h1>
  	<h3 style = "text-align : center">이전 페이지로 돌아갑니다.</h3>
	<meta http-equiv="Refresh" content="1;url=adjustForm.jsp" >
	</div>
<%} %>

<!-- /.container -->
</body>
</html>