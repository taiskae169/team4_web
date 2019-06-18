<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "search.*" %>
<%@ page import = "java.io.File" %>
<%@ page import = "webtoon.like.*" %>
<%@ page import = "webtoon.content.*" %>
<%
	String id1 = (String)session.getAttribute("sessionID");
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	
	SearchDAO a = SearchDAO.getInstance();
	int check1 = a.deleteWB(title, writer);
	
	likeDAO dao = likeDAO.getInstance();
	contentDAO cdao = contentDAO.getInstance();
	String path = request.getRealPath("resources/image/webtoon/" + title);
	
	File Folder = new File(path);
	
	if(check1 == 1){
		dao.deleteLikeall(num);
		cdao.deleteall(num);
	%>
		
		<br><br><br><br><br>
		<h1 class="my-4" style="text-align: center">작품을 삭제중입니다.</h1>
	<% 
	Folder.delete();
	}%>
	
<meta http-equiv="Refresh" content="1;url=myWebtoon.jsp" >

<%@ include file = "../bar/menu.jsp"%>
<%@ include file = "../bar/navigationBar.jsp"%>
<%@ include file = "../bar/footer.jsp"%>