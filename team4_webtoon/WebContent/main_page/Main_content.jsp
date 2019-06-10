<%request.setCharacterEncoding("UTF-8"); %> 
<%@page import="java.util.ArrayList"%>
<%@page import="webtoon.list.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	
	WebToonListDAO dao = WebToonListDAO.getInstance();
	WebToonListVO vo = new WebToonListVO();
	ArrayList<WebToonListVO> list = dao.getWeeklyWebtoon(Integer.parseInt(week));
	//main페이지에서 인클루드 되어 week 변수는 MainPage.jsp에 있음
	//list에 이번 주 웹툰을 받아 list에 저장

	
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
          <!-- 메인 페이지 이벤트 화면 시작 -->
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active"> <!-- active가 되어있는 항목이 먼저 나온다. -->
              <img class="d-block img-fluid" src="/team4_webtoon/resources/image/main_image/webtoon1_main.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="/team4_webtoon/resources/image/main_image/webtoon2_main.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="/team4_webtoon/resources/image/main_image/webtoon3_main.jpg" alt="Third slide">
            </div>
          </div>
          
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <!-- 화면 바꾸는 아이콘 -->
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
          <!-- 화면 바꾸는 아이콘 -->
        </div>
        <!-- 메인 페이지 이벤트 화면 끝 -->
        <div>
	        <%if(week.equals("0")) {%>
	        	<h1 class="my-4">도전만화</h1>
	        <%}else if(week.equals("1")){ %>
	        	<h1>월요일</h1>
			<%}else if(week.equals("2")){ %>
	        	<h1 class="my-4">화요일</h1>
	        <%}else if(week.equals("3")){ %>
	        	<h1 class="my-4">수요일</h1>
	        <%}else if(week.equals("4")){ %>
	        	<h1>목요일</h1>
	        <%}else if(week.equals("5")){ %>
	        	<h1 class="my-4">금요일</h1>
	        <%}else if(week.equals("6")){ %>
	        	<h1 class="my-4">토요일</h1>
	        <%}else if(week.equals("7")){ %>
	        	<h1 class="my-4">일요일</h1>
			<%} %>
		</div>
		<!-- 요일을 받아 현재 무슨 요일을 출력 중인지 출력해주는 항목 -->
		<div class="row">
		<% if(list.size()==0){ %>
			<h1 style="margin:auto;">검색 결과가 없습니다.</h1>
			<!-- list가 0일 경우 웹툰이 없으므로 검색결과가 없습니다. 라는 메세지 출력 -->
		<%} %>
		<%for(int i =0; i<list.size(); i++){ 
			//list에 저장된 갯수만큼 반복
			vo = list.get(i);		//vo에 웹툰 정보를 차례대로 대입
			int star = vo.getStar(), star_p = vo.getStart_p();
			int star_point=0;
			if(star!=0 && star!=0){
				star_point = (star/star_p);
			}
			//별점 계산하는 공식, 이후 수정 필요
		%>
        
          
          <jsp:include page="Main_webtoon_list.jsp">
          		<jsp:param value="<%=vo.getTitle() %>" name="title"/>
          		<jsp:param value="<%=vo.getSub_title() %>" name="subtitle"/>
          		<jsp:param value="<%=vo.getWriter() %>" name="writer"/>
          		<jsp:param value="<%=star_point %>" name="star_point"/>
          </jsp:include>
         <!-- 웹툰 카드를 위한 리스트 파일을 include -->
         <!-- 제목, 부제목, 작가, 별점만 출력하기 위해 항목을 보냄 -->
         
		<%} %>


		</div>

  </div>
  
  
    <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/Main_page/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/Main_page/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  