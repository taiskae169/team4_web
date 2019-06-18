<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "search.*" %>
<%@ page import = "webtoon.genre.*" %>
<%@ page import = "webtoon.week.*" %>
<jsp:useBean id = "member" class = "search.SearchVO"/>
<jsp:setProperty property = "*" name = "member"/>
<%
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	
	SearchDAO a = SearchDAO.getInstance();
	SearchVO b = a.adjust(title, writer);
	

%>

<%= title %>
<%= writer %>
<%= b.getTag() %>
<%= b.getGen() %>
<%= b.getSub_title() %>
<%= b.getSum() %>
<%= b.getWeek() %>

<!DOCTYPE html>

<html>
<head>
<title>웹툰 정보 변경</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<style>
  	.label1{
		width:110px;
		margin-bottom:40px;
	}
	.input1{
		margin-right:20px;
	}
	
	.input2{
		margin-right:20px;
		margin-left:20px;
	}	
	.bottom{
		margin-bottom : 50px;
	}
</style>
</head>

<body>
<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>


<div class="container" style = "margin-top:100px; margin-bottom : 100px;">
  	<br>  	
  	<h1 class="my-4" style="text-align: center"><%=title %></h1>
  	<h5 style = "text-align : center">웹툰 수정</h5>
  	
  	<form action = "changeTag.jsp" method="post" name = "tag" class = "bottom" style = "margin-top:50px;">
		<div>
			<label class = "label1"><b>태그 변경</b></label><%=b.getTag() %><br>
				<input type = "text" name = "tag" required >
				<input type = "hidden" name = "title" value = "<%=title %>">
				<input type = "hidden" name = "writer" value = "<%=writer %>">
				<input type="submit" name="tag" value = "태그 변경" class = "btn btn-info btn-sm"> 
				<hr>
		</div>
	</form>
	
	<form action = "changeWeek.jsp" method="post" name = "week" class = "bottom">
		<label class = "label1"><b>요일 변경</b></label>
		<%
		weekDAO week1 = weekDAO.getInstance();
		weekVO week2 = week1.weekCheck(b.getWeek());
		%>
		<%= week2.getValue() %><br>
		<input type = "radio" name = "week" value = "1" checked class = "input1">월요일
		<input type = "radio" name = "week" value = "2" class = "input2">화요일
		<input type = "radio" name = "week" value = "3" class = "input2">수요일
		<input type = "radio" name = "week" value = "4" class = "input2">목요일
		<input type = "radio" name = "week" value = "5" class = "input2">금요일
		<input type = "radio" name = "week" value = "6" class = "input2">토요일
		<input type = "radio" name = "week" value = "7" class = "input2">일요일
		<input type = "hidden" name = "title" value = "<%=title %>">
		<input type = "hidden" name = "writer" value = "<%=writer %>">
		<input type="submit" name="genre" value = "요일 변경" class = "btn btn-info btn-sm input2">
		<hr>
	</form>
	
	<form action = "changeSub.jsp" method="post" name = "sub_title" class = "bottom">
		<label class = "label1"><b>소제목 변경</b></label>
		<%=b.getSub_title() %><br>
		<input type = "text" name = "sub_title" required>
		<input type = "hidden" name = "title" value = "<%=title %>">
		<input type = "hidden" name = "writer" value = "<%=writer %>">
		<input type="submit" name="sub_title" value = "소제목 변경" class = "btn btn-info btn-sm"> 
		<hr>
	</form>

	<form action = "changeGen.jsp" method="post" name = "genre" class = "bottom">
		<label class = "label1"><b>장르 변경</b></label>
		      <%
		      	genreDAO c = genreDAO.getInstance();
		      	genreVO d = c.genreCheck(Integer.parseInt(b.getGen()));
		      %>
		      <%=d.getValue() %>
		<br>
		<input type = "radio" name = "genre" id = "0" value = "0"checked class = "input1">일상
				<input type = "radio" name = "genre" id = "0" value = "1" class = "input2">개그
				<input type = "radio" name = "genre" id = "0" value = "2" class = "input2">판타지
				<input type = "radio" name = "genre" id = "0" value = "3" class = "input2">액션
				<input type = "radio" name = "genre" id = "0" value = "4" class = "input2">드라마
				<input type = "radio" name = "genre" id = "0" value = "5" class = "input2">순정
				<input type = "radio" name = "genre" id = "0" value = "6" class = "input2">감성
				<input type = "radio" name = "genre" id = "0" value = "7" class = "input2">스릴러
				<input type = "radio" name = "genre" id = "0" value = "8" class = "input2">시대극
				<input type = "radio" name = "genre" id = "0" value = "9" class = "input2">스포츠
		<input type = "hidden" name = "title" value = "<%=title %>">
		<input type = "hidden" name = "num" value = "<%=b.getNum() %>">
        <input type = "hidden" name = "writer" value = "<%=writer %>">
		<input type="submit" name="genre" value = "장르 변경" class = "btn btn-info btn-sm input2"> 
		<hr>
	</form>	

	<form action = "changeSum.jsp" method ="post" name = "sum" class = "bottom">
	<label class = "label1"><b>줄거리 변경</b></label><%= b.getSum() %><br>
	
	<input type = "text" name = "sum" required>
	<input type = "hidden" name = "title" value = "<%=title %>">
	<input type = "hidden" name = "writer" value = "<%=writer %>">
	<input type = "submit" name = "sum" value = "줄거리 변경" class = "btn btn-info btn-sm">
	<hr>
	</form>
</div>

<div class = "container" style = "margin-bottom:100px;">
	<button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../wb_register/myWebtoon.jsp'">돌아가기</button>
	
</div>
<%@ include file="../bar/footer.jsp"%>

<!-- 비밀번호가 틀렸을 시  -->
<!-- /.container -->
</body>
</html>