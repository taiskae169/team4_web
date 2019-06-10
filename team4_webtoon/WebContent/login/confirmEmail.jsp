<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
    <%@ page import = "team4_webtoon.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email 중복 확인</title>
<%
	String email = request.getParameter("email");
	
	registerDAO manager = registerDAO.getInstance();
	int check = manager.confirmEmail(email);			//이메일 중복 확인 메서드
%>
</head>
<body>
<%
    if(check == 1) {
%>
   <%=email%> 은/는 이미 사용중인 이메일입니다

<form name="checkForm" method="post" action="confirmEmail.jsp">
	<table width="270" border="0" cellspacing="0" cellpadding="5">
  		<tr>
    		<td> 
       			<p>다른 이메일을 선택하세요.</p>
       		<input type="text" size="10" maxlength="30" name="email"> 
       		<input type="submit" value="EMAIL 중복 확인">
    	</td>
  	</tr>
	</table>
</form>
<%} else {%>
      <p>입력하신 <%=email%> 은/는 사용하실 수 있는 이메일입니다. </p>
      <input type="button" value="닫기" onclick="setemail()">
<%}%>
</body>
</html>
<script language="javascript">
  function setemail()
    {		
    	opener.document.userinput.email.value="<%=email%>";
		self.close();
		}

</script>