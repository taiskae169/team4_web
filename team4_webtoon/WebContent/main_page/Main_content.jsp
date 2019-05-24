<%@page import="java.util.ArrayList"%>
<%@page import="webtoon.list.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String week = request.getParameter("week");
	WebToonListDAO dao = WebToonListDAO.getInstance();
	WebToonListVO vo = new WebToonListVO();
	
	ArrayList<WebToonListVO> list = dao.getWeeklyWebtoon(Integer.parseInt(week));
	

	
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

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="/team4_webtoon/resources/image/webtoon/webtoon1/webtoon1_main.jpg" alt="First slide">
         									     <%//team4_webtoon/resources/image/webtoon/<웹툰명>/<웹툰명>_main.jpg 으로 변경할 예정 %>
         									     <%//A태그로 리스트로 가도록 할 예정 %>
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="/team4_webtoon/resources/image/webtoon/webtoon2/webtoon2_main.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="/team4_webtoon/resources/image/webtoon/webtoon3/webtoon3_main.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">

		<%for(int i =0; i<list.size(); i++){ 
			vo = list.get(i);
			int star_point = vo.getStar()/vo.getStart_p();
		%>

          <jsp:include page="Main_webtoon_list.jsp">
          		<jsp:param value="" name="title"/>
          		<jsp:param value="" name="subtitle"/>
          		<jsp:param value="" name=""/>
          </jsp:include>



        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  
  
    <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/Main_page/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/Main_page/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  