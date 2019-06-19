<%request.setCharacterEncoding("UTF-8"); %> 
<%@ page import = "team4_webtoon.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="team4_webtoon.registerBean">
<jsp:setProperty property ="*" name = "member"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>

</body>
</html>

<%
	String id1 = (String)session.getAttribute("sessionID");
	member.setId(id1);
	member.setState(0);			//DB에서 삭제하는 것이 아니라 상태를 0으로 만들어준다.
	
	registerDAO a = registerDAO.getInstance();
	a.deleteMember(member);
	session.invalidate();
	/*
	전체적인 로직
	
	회원 탈퇴 페이지
	테이블에 0 회원 탈퇴 항목이 있기 때문에 DB에서 데이터를 삭제하는 것이 아니라 state 값을 0으로 변경시켜준다
	*/
%>

<h1>회원탈퇴에 성공하였습니다.</h1>
<meta http-equiv="Refresh" content="1;url=../main_page/MainPage.jsp" >

