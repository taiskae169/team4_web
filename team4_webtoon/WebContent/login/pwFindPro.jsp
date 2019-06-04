<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="team4_webtoon.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
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
</head>
<body>
	<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	registerDAO manager = registerDAO.getInstance();
	registerBean c = manager.pwCheck(id, email);
	
	int check = manager.pwCheck1(id, email);
	%>
	<% if (check == 1){ %>
  <div class="container">
    <div class="row"><br><br><br><br><br><br>
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto"><br><br><br>
        <div class="card card-signin my-5"><br>
          <div class="card-body">
            <h5 class="card-title text-center">아이디 찾기</h5>
            <form class="form-signin">
              <div class="form-label-group">
   				회원님의 비밀번호는 <%= c.getPassword() %> 입니다.
                
              </div>
        </form>
              <hr class="my-4">
              <button class="btn btn-lg btn-primary btn-block text-uppercase" onclick="location='login.jsp'">Login 페이지로</button>
              <button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='register.jsp'">Register</button>
              <button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../main_page/MainPage.jsp'">돌아가기</button><br>
                            <div class="form-label-group">
                
              </div>
              
              <hr class="my-4">
              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button>
              
    

          </div>

        </div>

      </div>
      
    </div>

  </div>
  <% } else if (check == 0){ %>
  <script>
  	alert("이메일이 맞지 않습니다.");
  	history.go(-1);
  </script>
  <%} else { %>
  <script>
  	alert("아이디가 맞지 않습니다.");
  	history.go(-1);
  </script>
  <%} %>
</body>
</html>