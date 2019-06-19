<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
    <%@ page import = "team4_webtoon.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 중복 확인</title>
<%
	String id = request.getParameter("id");
	
	registerDAO manager = registerDAO.getInstance();
	int check = manager.confirmId(id);					//id 중복 확인 메서드
	/*
	전체적인 로직
	
	아이디 중복 확인 메서드
	*/
%>
</head>
<body>
<%
    if(check == 1) {
%>
   <%=id%> 은/는 이미 사용중인 아이디입니다
<form name="checkForm" method="post" action="confirmId.jsp">
	<table width="270" border="0" cellspacing="0" cellpadding="5">
  		<tr>
    		<td> 
       			<p>다른 아이디를 선택하세요.</p>
       			<input type="text" size="10" maxlength="30" name="id"> 
       			<input type="submit" value="ID중복확인">
    		</td>
  		</tr>
	</table>
</form>
<%
    } else {
%>
	<p>입력하신 <%=id%> 는 사용하실 수 있는 ID입니다. </p>
    <input type="button" value="닫기" onclick="setid()">

<%
    }
%>
</body>
</html>
<script language="javascript">

  function setid()
    {		
    	opener.document.userinput.id.value="<%=id%>";
		self.close();
		}
  
</script>