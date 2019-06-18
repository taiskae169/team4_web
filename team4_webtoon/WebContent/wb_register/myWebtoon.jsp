<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "search.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtoon.genre.*" %>
<!DOCTYPE html>
<%
	String mywebtoon = (String)session.getAttribute("sessionID");
	
	SearchDAO dao = new SearchDAO();
	
	ArrayList<SearchVO> list = dao.getAdd(mywebtoon);

%>

<html>
<head>
<meta charset="UTF-8">
<title>나의 웹툰</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
	table, th, td{
		border : 1px solid #bcbcbc;
	}
	table{
		width : 100%;
		height : 150px;
	}
	
	.input{
		margin-right: 10px;
	}
</style>
</head>
<body>

<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>

	<!-- Page Content -->
<div class="container" style="margin-top:150px; margin-bottom : 50px;">
  <h1 class="my-4" style="text-align: center"><%=mywebtoon %> 님의 웹툰입니다.</h1><br><br><br>

 
           	<div class = "row">
<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card h-100">
        <a href="wb_register.jsp"><img class="card-img-top" src="/team4_webtoon/resources/image/webtoon/thumbnail/new1.jpg" alt=""></a>
        <div class="card-body">

          <div class = "container">
          	<div class = "row">
          	

          </div>
          </div>
        </div>
                      	
      </div>
    </div>






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
          <div class = "container">
          	<div class = "row">
          	
          <form name = "createWB" method = "post" action = "../content/createWB.jsp?mw_num=<%=list.get(i).getNum()%>">
          <input type = "hidden" name = "title" value = "<%=list.get(i).getTitle() %>">
          <input type = "hidden" name = "writer" value = "<%=list.get(i).getWriter() %>">
          <input type = "submit" class = "btn btn-info btn-sm input" value = "회차등록">
          </form>


          <form name = "adjust" method = "post" action = "wb_adjust.jsp">
          <input type = "hidden" name = "title" value = "<%=list.get(i).getTitle() %>">
          <input type = "hidden" name = "writer" value = "<%=list.get(i).getWriter() %>">
          <input type = "submit" class = "btn btn-success btn-sm input" value = "수정">
          </form>
          
          <form name = "delete" method = "post" action = "wb_delete.jsp">
          <input type = "hidden" name = "title" value = "<%=list.get(i).getTitle() %>">
          <input type = "hidden" name = "writer" value = "<%=list.get(i).getWriter() %>">
          <input type = "hidden" name = "num" value = "<%=list.get(i).getNum() %>">
          <input type ="submit" value = "삭제" class = "btn btn-danger btn-sm input">
          
          </form>
          </div>
          </div>
        </div>
                      	
      </div>
    </div>

    <%}%>   
    </div>
  
</DIV>
<div class = "container" style = "margin-bottom : 50px;">
<center>

          	<button onclick = "location='../main_page/MainPage.jsp'" class="btn btn-primary">돌아가기</button>

          	</center>
          	</div>
<%@ include file="../bar/footer.jsp"%>
<!-- /.container -->
</body>
</html>