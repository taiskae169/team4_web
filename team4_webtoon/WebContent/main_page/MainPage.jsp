<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>사이트명</title>

  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/Main_page/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/Main_page/css/shop-homepage.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  	<jsp:include page="../menu.jsp"></jsp:include>


  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">카테고리</h1>
        <div class="list-group">
          <a href="MainPage.jsp?week=1" class="list-group-item">월요일</a>
          <a href="MainPage.jsp?week=2" class="list-group-item">화요일</a>
          <a href="MainPage.jsp?week=3" class="list-group-item">수요일</a>
          <a href="MainPage.jsp?week=4" class="list-group-item">목요일</a>
          <a href="MainPage.jsp?week=5" class="list-group-item">금요일</a>
          <a href="MainPage.jsp?week=5" class="list-group-item">토요일</a>
          <a href="MainPage.jsp?week=6" class="list-group-item">일요일</a>
          <a href="#" class="list-group-item">도전만화</a>
        </div>
        <%// %>

      </div>
      <!-- /.col-lg-3 -->

	<jsp:include page="Main_content.jsp"></jsp:include>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resource/Main_page/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resource/Main_page/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
