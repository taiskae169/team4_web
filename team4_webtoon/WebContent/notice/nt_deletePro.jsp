<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtoon.notice.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="member" class="webtoon.notice.noticeVO">
	<jsp:setProperty property="*" name="member"/>
	</jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("nt_num"));
	String title = request.getParameter("nt_writer");
	noticeDAO dao = noticeDAO.getInstance();
	dao.deleteNotice(member);
	response.sendRedirect("notice.jsp");
%>