<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<LINK REL=StyleSheet HREF="../resources/login/css/login.css" TYPE="text/css" 	TITLE="login.css" MEDIA="screen,print">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

</head>
<body onload="begin()">
	<%
	request.setCharacterEncoding("euc-kr");
	%>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">비밀번호 찾기</h5>
            <form class="form-signin" name="loginInfo" method = "post" action="idFindPro.jsp" onsubmit="return checkIt()">
              <div class="form-label-group">
                <input type="text" id="id" class="form-control" placeholder="ID" name = "id"required autofocus>
                <label for="id">ID</label>
              </div>

                <div class="form-label-group">
                <input type="email" id="email" class="form-control" name = "email" placeholder="Email address" required>
                <label for="email">Email address</label>
              </div>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">비밀번호 찾기</button>
              <button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='idFind.jsp'">아이디 찾기</button>
              <button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../main_page/MainPage.jsp'">메인으로</button>
              <hr class="my-4">
            </form>

          </div>

        </div>

      </div>
      
    </div>

  </div>
  
</body>
</html>