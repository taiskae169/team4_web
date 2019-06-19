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
    	
    	
    	/*
    	전체적인 로직
    	
    	아이디와 웹툰 번호를 받아온다
    	
    	getaddrs 메서드를 통해 리스트를 조건에 맞는 리스트를 받아온다.
    	
    	리스트가 없을 경우에는 insertlikeWebtoon 메서드를 통해 DB에 넣은다
    	
    	만약 리스트가 이미 있을 경우 (이름과 웹툰 번호를 둘 다 받기 때문에 중복이 불가능함.)
    	
    	deleteLike 메서드를 통해 DB에서 삭제한다.
    	*/
	%>
	
	<%


		if(list.size() == 0){
			dao.insertlikeWebtoon(member);
			%>
			<script type="text/javascript">
			alert("작품을 찜하셨습니다.");
			location.href = document.referrer;
			</script>
			<%
		}
		else if (list.size() != 0){
			dao.deleteLike(num, id1);
			%>
			<script type="text/javascript">
			alert("찜한 작품을 삭제하였습니다.");
			location.href = document.referrer;
			
			</script>
			<%
		}

	%>
