<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="team4_webtoon.*" %>

    <%
    	String id = (String)session.getAttribute("sessionID");
    
		registerDAO manager = registerDAO.getInstance();
		
		int check = manager.level_check(id);
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
      <a class="navbar-brand" href="http://www.daum.net/?nil_profile=mini&amp;nil_src=daum" ><img src="/team4_webtoon/resources/image/webtoon/wt_ep/logo2.png" width=10% height="32px"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        <%if(id ==null){ %>
          <li class="nav-item active">
            <a class="nav-link" href="/team4_webtoon/login/login.jsp">LOGIN
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/login/register.jsp">SIGN</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/notice/notice.jsp">NOTICE</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/search/search.jsp">SEARCH</a>
          </li>
          <%}else if (id != null && check == 3){ %>
           <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/mypage/mypage.jsp"><%=id %> 님</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/notice/notice.jsp">NOTICE</a>
          </li>        
          <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/search/search.jsp">SEARCH</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/login/logoutPro.jsp">LOGOUT</a>
          </li>



          <%} else { %>
           <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/mypage/mypage.jsp"><%=id %> 님</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/notice/notice.jsp">NOTICE</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/search/search.jsp">SEARCH</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/login/logoutPro.jsp">LOGOUT</a>
          </li>



          <%} 
          if(check==4){
          %>
          <li class="nav-item">
            <a class="nav-link" href="/team4_webtoon/admin/admin.jsp"> 관리자</a>
          </li>
          <%} %>
		
        </ul>
      </div>
    </div>
  </nav>