<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script language = "JavaScript">
	var idck = 0;
	function openConfirmid(userinput){
		var regx = /^[a-zA-Z0-9]*$/;
		if(userinput.id.value == ""){
			alert("아이디를 입력하세요");
			return;
		}
		if(!regx.test(userinput.id.value)){
			alert("아이디는 숫자와 영어만 가능합니다.");
			return;
		}
		url = "confirmId.jsp?id="+userinput.id.value;
		
		open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500, height=250");
	}
	
	function openConfirmemail(userinput){
		var mail = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+$/;
		if(userinput.email.value == ""){
			alert("이메일을 입력하세요");
			return;
		}
		if(!mail.test(userinput.email.value)){
			alert("이메일 형식을 지켜주세요");
			return;
		}
		
		url = "confirmEmail.jsp?email="+userinput.email.value;
		
		open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500, height=250");
	
	}
	
	
	
</script>
<%

%>
<LINK REL=StyleSheet HREF="../resources/register/css/register.css" TYPE="text/css" 	TITLE="register.css" MEDIA="screen,print">
<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>
</head>
<body>
  <div class="container"style = "margin-top: 100px">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">회원가입</h5>
            <form class="form-signin" method="post" action="registerPro.jsp" name="userinput">
              <div class="form-label-group">
                <input type="text" id = "id" class="form-control" placeholder="ID" name = "id" size = "10" maxlength="12" required autofocus>                

				<label for="id">ID</label>
                <input type = "button" value = "중복확인" onclick="openConfirmid(this.form)" class = "btn btn-info btn-sm input2">
              </div>

              <div class="form-label-group">
                <input type="password" id="password" class="form-control" name = "password" placeholder="Password" required autofocus>
                <label for="password">Password</label>
              </div>
                <hr>
                <div class="form-label-group">
                <input type="email" id="email" class="form-control" name = "email" placeholder="Email address" required autofocus>
                <label for="email">Email address</label>
                <input type = "button" value = "중복확인" onclick="openConfirmemail(this.form)" class = "btn btn-info btn-sm input2">
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
                <input type="radio" value = "2" name = "state" placeholder="state" autofocus style = "margin-right : 10px;" required> 독자
                <br>
                <input type="radio" value = "3" name = "state" placeholder="state" autofocus style = "margin-right : 10px;" required> 작가

   				</div>
   				<input type = "hidden"  name = "id1">
   				<input type = "hidden" name = "email1">
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Register</button>
              <button class="btn btn-default btn-warning btn-block text-uppercase" type="button" onclick = "location.href = '../main_page/MainPage.jsp'">돌아가기</button>
              
              <a class="d-block text-center mt-2 small" href="login.jsp" style = "color : black">Sign In</a>
              <hr class="my-4">
              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign up with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign up with Facebook</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@include file="../bar/footer.jsp" %>
</body>
</html>