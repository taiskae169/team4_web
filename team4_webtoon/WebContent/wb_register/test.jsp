<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id1 = (String)session.getAttribute("sessionID");
int num = Integer.parseInt(request.getParameter("num"));
String title = request.getParameter("title");
String writer = request.getParameter("writer");

session.setAttribute("sessionnum",num);
session.setAttribute("sessionTitle",title);
session.setAttribute("sessionwriter",writer);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language = "javascript">
var test = confirm("삭제하시겠습니까?")
if(test){
	location.replace('wb_delete.jsp');
}
else{
	history.go(-1);
}

</script>
</head>
<body>

</body>
</html>

