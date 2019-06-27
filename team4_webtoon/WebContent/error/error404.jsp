<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
		response.setStatus(HttpServletResponse.SC_OK);
%>   

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>에러 페이지 Code404</title>

  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/Main_page/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/Main_page/css/shop-homepage.css" rel="stylesheet">

<style>
.error {text-align:center;}
</style>

</head>

<body class="error">

<div class="container" >
<img src=" /team4_webtoon/resources/image/errorIMG/404-error.gif" />
</div>

<div id="alert" >
<button type="button" class="btn btn-outline-primary btn-lg"  onclick="location.href='/team4_webtoon/main_page/MainPage.jsp'">
<b>Home</b>
</button>
</div>

  <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/Main_page/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/Main_page/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>