<%request.setCharacterEncoding("UTF-8"); %> 
<%@page import="java.util.Date"%>
<%@ page import = "webtoon.notice.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- 메인 페이지!! -->
	<%
		//요일을 받아와 금일에 해당되는 웹툰을 출력하기 위한 코드	
	
		String week = request.getParameter("week");
		// 요일 선택시 숫자를 받아옴, 0 = 일요일, 1=월요일~
		if(week==null){
			Date dt = new Date();
			week = Integer.toString(dt.getDay());
		}
		//선택한 요일이 없었을 때 오늘 날자를 받아온다. 0 = 일요일, 1=월요일~
		
				
		int end = 3;
		List noticeList = null;
		noticeDAO notice = noticeDAO.getInstance();
		noticeList = notice.getNotice1(end);
		
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
  	<%@include file="../bar/menu.jsp" %>
  	<!-- menu에서 session을 받음, id와 회원 등급을 체크 -->
  	<!-- 
  		포함된 변수 
  		id : 세션 ID를 담고 있음
  		check : ID의 회원 등급을 받아 저장
  	
  	 -->
	<%@include file="../bar/navigationBar.jsp" %>

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
          <a href="MainPage.jsp?week=6" class="list-group-item">토요일</a>
          <a href="MainPage.jsp?week=7" class="list-group-item">일요일</a>
          <a href="MainPage.jsp?week=0" class="list-group-item">도전만화</a>
        </div><!-- 카테고리 DIV 종료 -->
        <!-- 메인페이지에 요일을 보내서 클릭한 요일의 웹툰이 나오게 한다.  -->
		<h1 class="my-4">공지사항</h1>
		<%for (int j = 0; j < noticeList.size(); j++){ 
			noticeVO notice2 = (noticeVO)noticeList.get(j);
		%>
		<div class="list-group">
          <a href="../notice/noticeView.jsp?nt_num=<%=notice2.getNt_num() %>" class="list-group-item"><%=notice2.getNt_title() %></a>
        </div><!-- 공지사항 DIV 종료 -->
              <%} %>
      </div>

      <!-- /.col-lg-3 -->
      <%@include file="Main_content.jsp" %>
	  <!-- 메인 컨텐츠 추가 -->

   </div>
   
  </div>
  
  
  <!-- Footer -->
	<%@include file="../bar/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/Main_page/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/Main_page/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
