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
</script>

<LINK REL=StyleSheet HREF="../resources/login/css/login.css" TYPE="text/css" 	TITLE="login.css" MEDIA="screen,print">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

</head>
<body onload="begin()">
	<%

	%>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto"><br><br><br><br><br><br><br><br><br><br><br><br>
        <div class="card card-signin my-5"><br>
          <div class="card-body">
            <h5 class="card-title text-center">웹툰 등록이 완료되었습니다.</h5>
            <form class="form-signin" name="loginInfo" method = "post" action="../content/createWB.jsp" onsubmit="return checkIt()">

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">1화 올리기</button><br>
            </form>
         	     <p class="text-center"><a href="../main_page/MainPage.jsp">돌아가기</a></p>   
              <br>
              


          </div>

        </div>

      </div>
      
    </div>

  </div>
  
</body>
</html>