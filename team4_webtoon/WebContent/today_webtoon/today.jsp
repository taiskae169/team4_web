<%@page import="java.util.ArrayList"%>
<%@page import="webtoon.list.WebToonListVO"%>
<%@page import="webtoon.list.WebToonListDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<%
	System.out.println("시작-------------");
	SimpleDateFormat sdt = new SimpleDateFormat("MM월dd일");
	Date currentTime = new Date();
	String today = sdt.format(currentTime);
	
	WebToonListDAO dao = WebToonListDAO.getInstance();
	//테스트용
		today = "05월40일";
	//테스트용
	ArrayList<WebToonListVO> list = dao.getTodayrecom(today);
	System.out.println("리스트 사이즈 : "+list.size());
	if(list.size()==0){
		dao.setTodayrecom(today);
		response.sendRedirect("today.jsp");
	}
%>
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
  	<%@include file="/menu.jsp" %>
	<%@include file="/navigationBar.jsp" %>

  <!-- Page Content -->
   <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">오늘의 추천 웹툰
        <small><%=today %></small>
      </h1>
		
      <!-- Project One -->
      <%for(int i =0; i< list.size(); i++){
		WebToonListVO vo = list.get(i);
		%>
      	
	      <div class="row">
	        <div class="col-md-7">
	          <a href="#">
	            <img  class="img-fluid rounded mb-3 mb-md-0" src="/team4_webtoon/resources/image/webtoon/<%=vo.getTitle()%>/<%=vo.getTitle()%>_recom.jpg" alt="">
	            <%//700X300 %>
	          </a>
	        </div>
	        <div class="col-md-5">
	          <h3><%=vo.getTitle()%></h3>
	          <p><%=vo.getSub_title()%></p>
	          <p><%=vo.getWriter()%></p>
	          <a class="btn btn-primary" href="#">보러가기</a>
	        </div>
	      </div>
      <!-- /.row -->

      <hr>
	<%}%>


    </div>
    <!-- /.container -->
  
  
  <!-- Footer -->
	<%@include file="/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/Main_page/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/Main_page/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>