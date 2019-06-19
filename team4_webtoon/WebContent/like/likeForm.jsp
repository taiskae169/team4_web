<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "webtoon.like.*" %>
<%@ page import = "search.*" %>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import = "webtoon.genre.*" %>
<%

	String id1 = (String)session.getAttribute("sessionID");
	likeDAO dao1 = likeDAO.getInstance();


	SearchDAO dao = new SearchDAO();
	ArrayList<SearchVO> list = dao.getlike(id1);
	
	/*
	전체적인 로직
	
	찜한 작품을 보여주는 메서드
	getlike 메서드를 통해 찜을 누른 작품들을 보여준다.
	
	*/


%>


<html>
<head>
<meta charset = "UTF-8">
<title>찜한 목록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>

</style>
</head>

<body>
<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>

<div class = "container" style = "margin-top : 100px; margin-bottom : 50px;">
<h1 class = "my-4" style = "text-align : center">찜한 작품</h1>
<div class = "row" style = "margin-top : 50px;">
<%if (list.size() == 0) {%>
<div class = "container" style = "margin-bottm : 1000px;">
<h2 class = "my-4" style = "text-align : center">찜한 작품이 없습니다.</h2>
</div>
<%} else { %>
    	<%for(int i = 0; i < list.size(); i++){%>

    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card h-100">
        <a href="#"><img class="card-img-top" src="/team4_webtoon/resources/image/webtoon/thumbnail/<%=list.get(i).getTitle() %>_som.jpg" alt=""></a>
        <div class="card-body">
          <h4 class="card-title">
			 <a href="#" style = "color : black;"><%=list.get(i).getTitle() %></a>
          </h4>
          <p class="card-text"><a href = "#" style = "color : black;"><%=list.get(i).getWriter() %></a></p>
          <p class="card-text">
			<%
			genreDAO a = genreDAO.getInstance();
			genreVO c = a.genreCheck(Integer.parseInt(list.get(i).getGen()));
			%>
			<%=c.getValue() %>
          </p>
          <p class="card-text"><%=list.get(i).getTag() %></p>
        <form method = "post" action = "../like/like.jsp">
        <input type = "hidden" name = "lwb_wb_num" value = "<%=list.get(i).getNum() %>">
       <input type = "hidden" name = "lwb_id" value = "<%= id1%>">
         <input type = "submit" value = "찜" class = "btn btn-info">
     
                </form>
          <div class = "container">
          	<div class = "row">
          	
          </div>
          </div>
        </div>
                      	
      </div>
    </div>

    <%}
    
    }%>   
    
    </div>
    </div>
	<br><br><br>
<div class = "container" style = "margin-bottom : 50px;">
<center>

          	<button onclick = "location='../mypage/mypage.jsp'" class = "btn btn-outline-dark btn-lg">돌아가기</button>

          	</center>
          	</div>

<%@ include file="../bar/footer.jsp"%>
</body>

</html>
