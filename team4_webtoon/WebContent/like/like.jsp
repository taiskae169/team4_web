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
    	ArrayList<likeVO> list = like.getAddrs(num, id1);
    	
    	likeDAO dao = likeDAO.getInstance();
    	likeVO b = dao.like(num, id1);
    	
	%>
	
	<%


		if(list.size() == 0){
			dao.insertlikeWebtoon(member);
			%>
			<script>
			alert("작품을 찜하셨습니다.");
			location.href = document.referrer;
			</script>
			<%
		}
		else if (list.size() != 0){
			dao.deleteLike(num, id1);
			%>
			<script>
			alert("찜한 작품을 삭제하였습니다.");
			location.href = document.referrer;
			
			</script>
			<%
		}

	%>
