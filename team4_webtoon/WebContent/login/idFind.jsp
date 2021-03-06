<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import ="team4_webtoon.*" %>
<%
/*
전체적인 로직

아이디 찾기 페이지
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<LINK REL=StyleSheet HREF="../resources/login/css/login.css" TYPE="text/css" 	TITLE="login.css" MEDIA="screen,print">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>
</head>
<body>
  <div class="container"style = "margin-top: 150px; margin-bottom : 110px;">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5"><br>
          <div class="card-body">
            <h5 class="card-title text-center">아이디 찾기</h5>
            <form class="form-signin" name="loginInfo" method = "post" action = "idFindPro.jsp">
            	<div class="form-label-group">
                	<input type="text" id="name" name = "name" class="form-control" placeholder="NAME" required autofocus>
                	<label for="name">NAME</label>
            	</div>
				<div class="form-label-group">
                	<input type="text" id="email" name = "email" class="form-control" placeholder="email" required autofocus>
                	<label for="email">EMAIL</label>
              	</div>

				<hr class="my-4">
            	<button class="btn btn-lg btn-primary btn-block text-uppercase" type = "submit" >아이디 찾기</button>
            	</form>
                <div class="form-label-group">
           			<br><p class="text-center"><a href="pwFind.jsp" style = "color : black;">비밀번호 찾기</a></p><p class="text-center">
           			<a href="../main_page/MainPage.jsp" style = "color:black;">돌아가기</a></p>
               	</div>
              <hr class="my-4">
          </div>
        </div>
      </div>
    </div>
  </div>
  <%@include file="../bar/footer.jsp" %>  
</body>
</html>