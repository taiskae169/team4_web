<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtoon.notice.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="member" class="webtoon.notice.noticeVO">
	<jsp:setProperty property="*" name="member"/>
	</jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("nt_num"));
	noticeDAO dao = noticeDAO.getInstance();
	dao.changeCategory(member);
%>
<meta http-equiv="Refresh" content="0;url=noticeView.jsp?nt_num=<%=num%>" >