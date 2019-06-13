<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1문의</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


<LINK REL=StyleSheet HREF="../resources/register/css/register.css" TYPE="text/css" 	TITLE="register.css" MEDIA="screen,print">
<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-body">
            <h5 class="card-title text-center">1대1문의</h5>
            <form class="form-signin" method="post" action="registerPro.jsp" name="userinput" style="text-align:center;">
              <div class="form-label-group" >
                <legend style="margin:auto;">제목</legend>
                <input type="text" id = "id" class="form-control" placeholder="ID" name = "id" size = "10" maxlength="10" required autofocus>                
              </div>
              <div class="form-label-group">
                <legend style="margin:auto;">내용</legend>
                <textarea id="content" class="form-control" name = "textarea" required> </textarea>
                
              </div>
                <hr>
                <div class="form-label-group">
                <input type="email" id="email" class="form-control" name = "email" placeholder="Email address" required autofocus>
                <label for="email">Email address</label>
                <input type = "button" value = "중복확인" onclick="openConfirmemail(this.form)">
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
                <input type="radio" value = "2" id="state" name = "state" placeholder="state" autofocus> 독자
                <br>
                <input type="radio" value = "3" id="state" name = "state" placeholder="state" autofocus> 작가

   				</div>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Register</button>
              <button class="btn btn-default btn-warning btn-block text-uppercase" type="button" onclick = "location.href = '../main_page/MainPage.jsp'">돌아가기</button>
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@include file="../bar/footer.jsp" %>
</body>
</html>