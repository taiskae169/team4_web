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

<style>
	.label1{
		width:80px;
		margin-bottom:40px;
	}
	.input1{
		margin-right:20px;
	}
	
	.input2{
		margin-right:20px;
		margin-left:20px;
	}	
	.bottom{
		margin-bottom : 50px;
	}
</style>

</head>
<body id="page-top">
  <!-- Navigation -->
     <%@include file="/bar/menu.jsp" %>
   <%@include file="/bar/navigationBar.jsp" %>   

        <div class="container" style = "margin-top : 100px;">

            <div class="detail">
                 <h1 class="my-4" style="text-align: center;">공지 등록</h1>
         </div>   

   </div>
   
   <div class="container" style = "margin-top : 80px;">
   <form method = "post" action = "nt_registerPro.jsp">
	<label class = "label1">카테고리</label>
	<select name = "nt_category">
		<option value = "0">서비스공지</option>
		<option value = "1">컨텐츠공지</option>
		<option value = "2">결제 관련</option>
		<option value = "3">안내</option>
		<option value = "4">문의</option>
	</select><br>
	<label class="label1">제목</label>
	<input type = "text" name = "nt_title" placeholder = "제목을 입력해주세요"><br>
	<label>내용을 입력해주세요</label><br>
	<textarea name = "nt_content" rows="13" cols="40"></textarea><br><br>
	<input type = "hidden" name = "nt_writer" value = "<%=id1 %>">
	<input type="submit" value = "공지 등록" class="btn btn-info btn-lg">
	<input type = "reset" value ="수정하기" class="btn btn-success btn-lg">
	<input type = "button" onclick = "location.href='notice.jsp'" value = "돌아가기" class="btn btn-warning btn-lg">
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