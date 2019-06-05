<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
 function begin(){
	 document.loginInfo.id.focus();
 }
 function checkIt(){
	 if(!document.loginInfo.id.value){
		 alert("아이디를 입력하세요");
		 document.loginInfo.id.focus();
		 return false;
	 }
	 if(!document.loginInfo.pw.value){
		 alert("비밀번호를 입력하세요");
		 doument.loginInfo.pw.focus();
		 return false;
	 }
 }

</script>
<style>
	body{
		background-color:#FFFFFF;
	}
</style>
<LINK REL=StyleSheet  TYPE="text/css" 	TITLE="login.css" MEDIA="screen,print">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>
</head>
<body>
	<%
	
	%>

  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body"><br>
            <h5 class="card-title text-center">로그인</h5><br>
            <form class="form-signin" name="loginInfo" method = "post" action="loginPro.jsp" onsubmit="return checkIt()">
              <div class="form-label-group">
                <input type="text" id="id" name = "id" class="form-control" placeholder="ID" required autofocus>
              </div>
				<br>
              <div class="form-label-group">
                <input type="password" id="password" name = "pw" class="form-control" placeholder="Password" required>
              </div>
              <hr class="my-4">
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Login</button>
              <button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='register.jsp'">Register</button>
              <button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../main_page/MainPage.jsp'">돌아가기</button>
              <br>
              <p class="text-center"><a href="idFind.jsp">아이디 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="pwFind.jsp">비밀번호 찾기</a></p>
              <hr class="my-4">
              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button>
              
            </form>

          </div>

        </div>

      </div>
      
    </div>

  </div>
  <%@include file="../bar/footer.jsp" %>
</body>
</html>