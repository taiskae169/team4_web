<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
    <%@ page import = "team4_webtoon.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email 중복 확인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>

<LINK REL=StyleSheet HREF="../resources/login/css/login.css" TYPE="text/css" 	TITLE="login.css" MEDIA="screen,print">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">


<%
	String email = request.getParameter("email");
	
	registerDAO manager = registerDAO.getInstance();
	int check = manager.confirmEmail(email);			//이메일 중복 확인 메서드
	String y1 = "y1";
	/*
	전체적인 로직
	
	이메일 중복 확인 메서드
	confirmEmail 메서드를 통해 입력받은 이메일이 중복되는지 확인한다.
	
	*/
%>
</head>
<body>
<%
    if(check == 1) {
%>
   <div class = "container"  style = "background-color:black;">
   <div class = "row">
   <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5"><br>
          <div class="card-body">
   <%=email%> 은/는 이미 사용중인 이메일입니다

<form name="checkForm" method="post" action="confirmEmail.jsp">
	<table width="270" border="0" cellspacing="0" cellpadding="5">
  		<tr>
    		<td> 
       			<p>다른 이메일을 선택하세요.</p>
       		<input type="text" size="10" maxlength="30" name="email"> 
       		<input type="submit" value="EMAIL 중복 확인" class = "btn btn-info btn-sm">
    	</td>
  	</tr>
	</table>
</form>
</div>
</div>
</div>
</div>
</div>
<%} else {%>
<div class = "container"  style = "background-color:black;">
   <div class = "row" style = "background-color:black;">
   <div class="col-sm-9 col-md-7 col-lg-5 mx-auto" style = "background-color:black;">
        <div class="card card-signin my-5"><br>
          <div class="card-body">
      <p>입력하신 <%=email%> 은/는 사용하실 수 있는 이메일입니다. </p>
      <input type="button" value="닫기" onclick="setemail()">
      </div>
</div>
</div>
</div>
</div>
<%}%>
</body>
</html>
<script language="javascript">
  function setemail()
    {		
    	opener.document.userinput.email.value="<%=email%>";
    	opener.document.userinput.email1.value="<%=y1%>";
		self.close();
		}

</script>