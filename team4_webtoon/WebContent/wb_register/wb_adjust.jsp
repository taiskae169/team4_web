<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "search.*" %>
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
<title>회원 정보 수정</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
</head>

<body>
<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>


<div class="container">
  	<br>  	
  	<h1 class="my-4" style="text-align: center"><%=title %></h1>
  	<h5 style = "text-align : center">웹툰 수정</h5>
  	<br><br><br>
  	
  	<form action = "changeTag.jsp" method="post" name = "tag">
		<div>
			<b>태그 변경</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=b.getTag() %>
			<br><br>
				<input type = "text" name = "tag" required> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "hidden" name = "title" value = "<%=title %>">
				<input type="submit" name="tag" value = "태그 변경"> 
				<br><br><br>
		</div>
	</form>
	
	<form action = "changeWeek.jsp" method="post" name = "week">
		<b>요일 변경</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%switch (b.getWeek()){ 
		case 1 : %>월요일<%break;
		case 2 : %>화요일<%break;
		case 3 : %>수요일<%break;
		case 4 : %>목요일<%break;
		case 5 : %>금요일<%break;
		case 6 : %>토요일<%break;
		case 7 : %>일요일<%break;
		}%>
		<br><br>
		<input type = "radio" name = "week" value = "1" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "radio" name = "week" value = "2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;화요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "radio" name = "week" value = "3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "radio" name = "week" value = "4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "radio" name = "week" value = "5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;금요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "radio" name = "week" value = "6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;토요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "radio" name = "week" value = "7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일요일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "hidden" name = "title" value = "<%=title %>"><br><br>
		<input type="submit" name="genre" value = "요일 변경"> 
		<br><br><br>
	</form>
	
	<form action = "changeSub.jsp" method="post" name = "sub_title">
		<b>소제목 변경</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;<%=b.getSub_title() %><br><br>
		<input type = "text" name = "sub_title" required> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "hidden" name = "title" value = "<%=title %>">
		<input type="submit" name="sub_title" value = "소제목 변경"> 
		<br><br><br>
	</form>

	<form action = "changeGen.jsp" method="post" name = "genre">
		<b>장르 변경</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      <%switch (b.getGen()){ 
        	  case "0" : %>일상<%break;
        	  case "1" : %>개그<%break;
        	  case "2" : %>판타지<%break;
        	  case "3" : %>액션<%break;
        	  case "4" : %>드라마<%break;	
        	  case "5" : %>순정<%break;
        	  case "6" : %>감성<%break;
        	  case "7" : %>스릴러<%break;
        	  case "8" : %>시대극<%break;
        	  case "9" : %>스포츠<%break;
        	  }%>
		<br><br>
		<input type = "radio" name = "genre" id = "0" value = "0"checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "genre" id = "0" value = "1" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개그&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "genre" id = "0" value = "2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;판타지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "genre" id = "0" value = "3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액션&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "genre" id = "0" value = "4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;드라마&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "genre" id = "0" value = "5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;순정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "genre" id = "0" value = "6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;감성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "genre" id = "0" value = "7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스릴러&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "genre" id = "0" value = "8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시대극&nbsp;&nbsp;&nbsp;
				<input type = "radio" name = "genre" id = "0" value = "9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스포츠&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br><br>
		<input type = "hidden" name = "title" value = "<%=title %>">
		<input type = "hidden" name = "num" value = "<%=b.getNum() %>">
		<input type="submit" name="genre" value = "장르 변경"> 
		<br><br><br>
	</form>	

	<form action = "changeSum.jsp" method ="post" name = "sum">
	<b>줄거리 변경</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= b.getSum() %>
	<br><br>
	
	<input type = "text" name = "sum" required> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type = "hidden" name = "title" value = "<%=title %>">
	<input type = "submit" name = "sum" value = "줄거리 변경">
	<br><br><br><br><br>
	</form>
</div>

<div class = "container">
	<button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../main_page/MainPage.jsp'">돌아가기</button>
	<br><br><br><br><br><br>
</div>
<%@ include file="../bar/footer.jsp"%>

<!-- 비밀번호가 틀렸을 시  -->
<!-- /.container -->
</body>
</html>