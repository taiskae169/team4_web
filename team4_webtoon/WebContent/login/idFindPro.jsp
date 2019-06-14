<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import ="team4_webtoon.*" %>
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
	<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	registerDAO manager1 = registerDAO.getInstance();
	registerBean c = manager1.idCheck(email, name);		//아이디 반환 메서드 (아이디 자체를 반환한다.), 동명이인으로 인해 검색 안될 시 대비 -> 이메일로 체크한다.(이메일은 중복값 안되기 때문)
	
	int check1 = manager.idCheck1(email, name);			//아아디 반환 메서드 (맞으면  if 틀리면 else)
	%>
	
	<% if (check1 == 1){%>
  <div class="container"style = "margin-top: 150px; margin-bottom : 110px;">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5"><br>
          <div class="card-body">
            <h5 class="card-title text-center">아이디 찾기</h5>
            <form class="form-signin">
              <div class="form-label-group">
   				회원님의 아이디는 <%= c.getId() %> 입니다.
              </div>
        </form>
              <hr class="my-4">
              <button class="btn btn-lg btn-primary btn-block text-uppercase" onclick="location='login.jsp'">Login 페이지로</button>
              <button class="btn btn-lg btn-warning btn-block text-uppercase" onclick="location='../main_page/MainPage.jsp'">돌아가기</button><br>
             
              <div class="form-label-group">
             	 <p class="text-center"><a href="pwFind.jsp">비밀번호 찾기</a></p>
              </div>
              <hr class="my-4">
          </div>
        </div>
      </div>
    </div>

  </div>
  <%} else if (check1 == 0){ %>
  
  <script>
  	alert("이메일이 맞지 않습니다.");
  	history.go(-1);
  </script>
  <%} else { %>
  <script>
  	alert("이름이 맞지 않습니다.");
  	history.go(-1);
  </script>
  <%} %>
      <br><br><br><br><br>
  <%@include file="../bar/footer.jsp" %>  
</body>
</html>