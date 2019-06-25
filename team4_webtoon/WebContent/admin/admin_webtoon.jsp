<%@page import="java.util.ArrayList"%>
<%@page import="webtoon.list.WebToonListDAO"%>
<%@page import="java.util.Date"%>
<%@page import="webtoon.cash.CashDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>관리자</title>

  <!-- Custom fonts for this template-->
  <link href="/team4_webtoon/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/team4_webtoon/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>



<body id="page-top">
  	<%@include file="/bar/menu.jsp" %>
  	<%@include file="../bar/session_url.jsp" %>
  	
  	
  	<% 
  		ArrayList<Integer> MView = new ArrayList<Integer>();
		String mw_num = request.getParameter("mw_num");
		
		int num=0;
		if(mw_num!=null){
			num=Integer.parseInt(mw_num);
		}
		

		
	
	%>
	
	<%@include file="admincheck.jsp" %>
  	<!-- 메뉴바 올려놓기 -->


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

  <!-- Page Wrapper -->
  <div id="wrapper">
    <!-- Sidebar -->
	<%@include file="sidebar.jsp" %>
    <!-- End of Sidebar -->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
      <%if(num==0){ %>
			<%@include file="webtoon_table.jsp" %>
	  <%}else{ %>
	  		<%@include file="content_table.jsp" %>
	  <%} %>
	  </div>
	</div>
  </div>
  </div>

      <!-- End of Main Content -->

      <!-- Footer -->
		<%@include file="/bar/footer.jsp" %>
      <!-- End of Footer -->


	
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>




 

</body>

</html>
