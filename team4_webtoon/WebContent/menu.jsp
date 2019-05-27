<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="utf-8">
    <%
    	String id = (String)session.getAttribute("test");
    	
    %>
    
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/Main_page/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/Main_page/css/shop-homepage.css" rel="stylesheet">
</head>
    
    
    
    
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/team4_webtoon/main_page/MainPage.jsp">사이트 명</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        <%if(id ==null){ %>
          <li class="nav-item active">
            <a class="nav-link" href="#">LOGIN
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">SIGN</a>
          </li>
          <%}else{ %>
          <li class="nav-item">
            <a class="nav-link" href="#">LOGOUT</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">회원정보</a>
          </li>
          <%} %>

        </ul>
      </div>
    </div>
  </nav>