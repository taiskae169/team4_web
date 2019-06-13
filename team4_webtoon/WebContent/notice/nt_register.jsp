<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtoon.notice.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	String id1 = (String)session.getAttribute("sessionID");
%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>NOTICE</title>

  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/main_webtoon/scrolling/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/main_webtoon/scrolling/css/scrolling-nav.css" rel="stylesheet">


</head>
<body id="page-top">
  <!-- Navigation -->
     <%@include file="/bar/menu.jsp" %>
   <%@include file="/bar/navigationBar.jsp" %>   

        <div class="container">

            <div class="detail">
                 <h1 class="my-4" style="text-align: center">공지 등록</h1><br><br><br>
         </div>   

   </div>
   
   <div class="container">
   <form method = "post" action = "nt_registerPro.jsp">
	카테고리 : 
	<select name = "nt_category">
		<option value = "0">서비스공지</option>
		<option value = "1">컨텐츠공지</option>
		<option value = "2">결제 관련</option>
		<option value = "3">안내</option>
		<option value = "4">문의</option>
	</select><br><br>
	제목 : 
	<input type = "text" name = "nt_title" placeholder = "제목을 입력해주세요"><br><br>
	내용 :<br>
	<textarea name = "nt_content" rows="13" cols="40"></textarea><br><br>
	<input type = "hidden" name = "nt_writer" value = "<%=id1 %>">
	<input type="submit" value = "공지 등록">
	<input type = "reset" value ="수정하기">
	<input type = "button" onclick = "location.href='notice.jsp'" value = "돌아가기">
	</form>
      </div><br><br>
	

   

   			
     <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom JavaScript for this theme -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/js/scrolling-nav.js"></script>

</body>

</html>
<%@include file="/bar/footer.jsp" %>