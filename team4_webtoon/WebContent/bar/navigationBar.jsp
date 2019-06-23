<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ page import = "team4_webtoon.*"  %>

<%
	String navID = (String)session.getAttribute("sessionID");
	registerDAO manager2 = registerDAO.getInstance();

	int check2 = manager2.level_check(navID);	
	
%>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Agency - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/main_webtoon/agency/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/team4_webtoon/resources/main_webtoon/agency/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/main_webtoon/agency/css/agency.min.css" rel="stylesheet">

<style>
	.ml-center {margin-left:350px; }
	#box {float:left; padding:30px;margin-left:550px;margin-top:200px; margin-bottom:500px;}
	#box {float:left; }
</style>


</head>

<body id="page-top">

  <nav class="navbar navbar-expand-lg navbar-dark fixed-top navbar-shrink" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="/team4_webtoon/main_page/MainPage.jsp">WebToon</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-center">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#services"><b>랭킹</b></a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/team4_webtoon/today_webtoon/today.jsp"><b>추천 웹툰</b></a>
          </li>
          <li class="nav-item" style="width:50px;">
          <%if (navID != null) {%>
            <a class="nav-link js-scroll-trigger" href="/team4_webtoon/mypage/mypage.jsp"><b>My</b></a>
            <%} else {%>
            <a class="nav-link js-scroll-trigger" href="/team4_webtoon/login/login.jsp"><b>My</b></a>
            <%} %>
          </li>
        </ul>
      </div>
      <% if (check2 == 3){%>
      <div>
		 <ul class="navbar-nav text-uppercase ml-center">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="../wb_register/myWebtoon.jsp"><b>내 웹툰</b></a>
          </li>
          </ul>
      </div>
      <%} %>
            <% if (check2 == 4){%>
      <div>
		 <ul class="navbar-nav text-uppercase ml-center">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/team4_webtoon/admin/admin.jsp"><b>관리자</b></a>
          </li>
          </ul>
      </div>
      <%} %>
    </div>
  </nav>
  <%--<br><br><br><br><br>--%>
  
 <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoonagency/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/main_webtoon/agency/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/agency/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/agency/js/jqBootstrapValidation.js"></script>
  <script src="/team4_webtoon/resources/main_webtoon/agency/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/team4_webtoon/resources/main_webtoon/agency/js/agency.min.js"></script>

</body>

</html>
