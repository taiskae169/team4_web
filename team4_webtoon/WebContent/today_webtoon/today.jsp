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
	SimpleDateFormat sdt = new SimpleDateFormat("MM월dd일");
	Date currentTime = new Date();
	String today = sdt.format(currentTime);
	
	WebToonListDAO dao = WebToonListDAO.getInstance();
	//테스트용
	//테스트용
	ArrayList<WebToonListVO> list = dao.getTodayrecom(today);
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
  	<%@include file="/bar/menu.jsp" %>
	<%@include file="/bar/navigationBar.jsp" %>
	<%@include file="../bar/session_url.jsp" %>

  <!-- Page Content -->
   <div class="container" style="margin-top:100px; margin-bottom:50px;">

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
	          <a href="/team4_webtoon/main_wt/mainWT.jsp?mw_num=<%=vo.getNum()%>">
	            <img  class="img-fluid rounded mb-3 mb-md-0" src="/team4_webtoon/resources/image/webtoon/thumbnail/<%=vo.getTitle()%>_recom.jpg" alt="">
	            <%//700X300 %>
	          </a>
	        </div>
	        <div class="col-md-5">
	          <h3><%=vo.getTitle()%></h3>
	          <p><%=vo.getSub_title()%></p>
	          <p><%=vo.getWriter()%></p>
	          <a class="btn btn-primary" href="/team4_webtoon/main_wt/mainWT.jsp?mw_num=<%=vo.getNum()%>">보러가기</a>
	        </div>
	      </div>
      <!-- /.row -->

      <hr>
	<%}%>


    </div>
    <!-- /.container -->
  
  
  <!-- Footer -->
	<%@include file="/bar/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/Main_page/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/Main_page/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
