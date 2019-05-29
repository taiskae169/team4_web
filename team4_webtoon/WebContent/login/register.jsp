<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<LINK REL=StyleSheet HREF="../resources/register/css/register.css" TYPE="text/css" 	TITLE="register.css" MEDIA="screen,print">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		
	%>
  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto"><br><br>
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">회원가입</h5>
            <form class="form-signin" method="post" action="registerPro.jsp" name="user_info" onsubmit="return checkValue()">
              <div class="form-label-group">
                <input type="text" id="id" class="form-control" placeholder="ID" name = "id"required autofocus>
                <label for="id">ID</label>
              </div>
              <div class="form-label-group">
                <input type="password" id="password" class="form-control" name = "password" placeholder="Password" required>
                <label for="password">Password</label>
              </div>
                <hr>
                <div class="form-label-group">
                <input type="email" id="email" class="form-control" name = "email" placeholder="Email address" required>
                <label for="email">Email address</label>
              </div>
                <div class="form-label-group">
                <input type="text" id="age" class="form-control" name = "age" placeholder="age" required autofocus>
                <label for="age">AGE</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="name" class="form-control" name = "name" placeholder="name" required autofocus>
                <label for="name">NAME</label>
              </div>
                <div class="form-label-group">
                <input type="radio" value = "3" id="state" name = "state" placeholder="state" autofocus> 독자
                <br>
                <input type="radio" value = "4" id="state" name = "state" placeholder="state" autofocus> 작가

   				</div>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Register</button>
              <button class="btn btn-default btn-warning btn-block text-uppercase" type="button" onclick = "location.href = '../main_page/MainPage.jsp'">돌아가기</button>
              
              <a class="d-block text-center mt-2 small" href="login.jsp">Sign In</a>
              <hr class="my-4">
              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign up with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign up with Facebook</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>