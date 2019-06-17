<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtoon.like.*" %>
<%@ page import = "java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="member" class="webtoon.like.likeVO">
	<jsp:setProperty property="*" name="member"/>
	</jsp:useBean>
	
    <%
    	String id1 = (String)session.getAttribute("sessionID");
    	int num = Integer.parseInt(request.getParameter("lwb_wb_num"));
    	likeDAO like = new likeDAO();
    	ArrayList<likeVO> list = like.getAddrs(num);
    	
    	likeDAO dao = likeDAO.getInstance();
    	likeVO b = dao.like(id1, num);
    	
	%>
	
	<%

	if (b.getLwb_id().equals(id1)){
		dao.insertlikeWebtoon(member);
	}
	else{%>
	<script>
	alert("ddd");
	history.go(-1);
	</script>
		
	<%}

	%>