<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "search.*" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    
    <jsp:useBean id = "member" class = "search.SearchVO"/>
    <jsp:setProperty property = "*" name = "member" />
    
    <%
    	String title = request.getParameter("title");
    	member.setTitle(title);
    	
    	SearchDAO a = SearchDAO.getInstance();
    	a.changeSub(member);    
    %>
<!DOCTYPE html>
<html>
<head>
<title>웹툰 정보 수정</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>
</head>
<body>

<div class="container">
  	<br>
  	<h1 class="my-4" style="text-align: center">소제목이 변경되었습니다.</h1>
  	<h5 style = "text-align : center">메인페이지로 돌아갑니다.</h5>
  	<meta http-equiv="Refresh" content="1;url=../main_page/MainPage.jsp" >
</div>
<!-- /.container -->
</body>
</html>	