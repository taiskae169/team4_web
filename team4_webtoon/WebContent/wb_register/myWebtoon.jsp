<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "search.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			 <a href="#"><%=list.get(i).getTitle() %></a>
          </h4>
          <p class="card-text"><a href = "#"><%=list.get(i).getWriter() %></a></p>
          <p class="card-text">
          <%switch (list.get(i).getGen()){ 
        	  case "0" : %>일상<%break;
        	  case "1" : %>개그<%break;
        	  case "2" : %>판타지<%break;
        	  case "3" : %>액션<%break;
        	  case "4" : %>드라마<%break;	
        	  case "5" : %>순정<%break;
        	  case "6" : %>감성<%break;
        	  case "7" : %>스릴러<%break;
        	  case "8" : %>시대극<%break;
        	  case "9" : %>스포츠<%break;
        	  }%>
          </p>
          <p class="card-text"><%=list.get(i).getTag() %></p>
          <div class = "container">
          	<div class = "row">
          	
          <form name = "createWB" method = "post" action = "../content/createWB.jsp?mw_num=<%=list.get(i).getNum()%>">
          <input type = "hidden" name = "title" value = "<%=list.get(i).getTitle() %>">
          <input type = "hidden" name = "writer" value = "<%=list.get(i).getWriter() %>">
          <input type = "submit" class = "input" value = "회차등록">
          </form>


          <form name = "adjust" method = "post" action = "wb_adjust.jsp">
          <input type = "hidden" name = "title" value = "<%=list.get(i).getTitle() %>">
          <input type = "hidden" name = "writer" value = "<%=list.get(i).getWriter() %>">
          <input type = "submit" class = "input" value = "수정">
          </form>
          
          <form name = "delete" method = "post" action = "wb_delete.jsp">
          <input type = "hidden" name = "title" value = "<%=list.get(i).getTitle() %>">
          <input type = "hidden" name = "writer" value = "<%=list.get(i).getWriter() %>">
          <input type ="submit" value = "삭제">
          
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

          	<button onclick = "location='../main_page/MainPage.jsp'">돌아가기</button>

          	</center>
          	</div>
<%@ include file="../bar/footer.jsp"%>
<!-- /.container -->
</body>
</html>