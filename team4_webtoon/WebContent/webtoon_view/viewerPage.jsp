<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="webtoon.episode.WTepDAO"%>
<%@page import="webtoon.episode.WTepVO"%>
<!DOCTYPE html>
<html lang="en">

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
	#mainNav{top:0px;}
	.navbar-expand-lg .navbar-collapse {color:#808080;}
	.epTitle{color:#808080;}
</style>


</head>





<%
	int mNum=Integer.parseInt(request.getParameter("mw_num"));
	int clNum=Integer.parseInt(request.getParameter("cl_num"));
	String id=(String)session.getAttribute("sessionID");
	WTepVO wtEP=null;
	WTepDAO wtDAO=WTepDAO.getInstance();
	wtEP=wtDAO.getWTContent(clNum,mNum);

%>


<body id="page-top">

  <nav class="navbar navbar-expand-lg navbar-dark fixed-top navbar-shrink" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">WebToon</a>
      <a href="/team4_webtoon/main_wt/mainWT.jsp?mw_num=<%=mNum %>" ><%=wtEP.getMwTitle() %></a>
      <b class="epTitle">> <%=wtEP.getClTitle() %> </b>  
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
            <a class="nav-link js-scroll-trigger" href="#portfolio"><b>웹툰리그</b></a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about"><b>My</b></a>
          </li>
        </ul>
      </div>
      
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
       <ul class="navbar-nav text-uppercase ml-auto">
         <% if(id==null){%>
         <script language="JavaScript">
    		 function goLoginfirst() {
           		 alert("로그인 후 참여가능합니다.");
           	  	url = "/team4_webtoon/login/login.jsp";
           		open(url, "login",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
             	return;
         	 }
    		 </script>
        <li class="nav-item"><a href="#"  Onclick="goLoginFirst();"><b>별점주기</b></a></li>&nbsp;        
         <li class="nav-item"></li>
        <%}else{ %>
         <li class="nav-item"><b>별점주기</b></li>&nbsp;   
        <li class="nav-item">
        <%@include file="/webtoon_view/starForm.jsp" %>
        </li>
        <%} %>
        </ul>
       </div>
    </div>
  </nav>
  <br><br><br><br><br>
  

  
  
  	 <!-- Services -->
  <section class="page-section" id="services">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
        <img src="/team4_webtoon/resources/image/webtoon/wt_ep/wtContent.jpg" >
        </div>
      </div>
      </div>
    </div>
  </section>

  <%@include file="/comment/comment.jsp" %>	
  
  
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
