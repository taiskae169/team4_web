<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>변경</title>
</head>
<body>
	<%
		String num = request.getParameter("num");
	%>

	<div style="margin:auto 0;">
		<form action="stateChPro.jsp">
			<select name="state">
				<option value=0>탈퇴</option>
				<option value=1>휴먼</option>
				<option value=2>할동중</option>
				<option value=3>작가</option>
				<option value=4>관리자</option>
			</select>
			<input type="hidden" value="<%=num %>" name="num" />
			<input type="submit" value="변경" />
			
		</form>
	</div>
</body>
</html>