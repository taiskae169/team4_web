<%@ page import = "search.SearchDAO"%>
<%@ page import = "search.SearchVO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "webtoon.list.*" %>
<%request.setCharacterEncoding("UTF-8"); %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
	String search = request.getParameter("addr") == null ? "null" : request.getParameter("addr");
	String select = request.getParameter("select") == null ? "" : request.getParameter("select"); 
	SearchDAO dao = new SearchDAO();
	ArrayList<SearchVO> list = dao.getAddrs(search,select);	
	//이미지 가져오기
	String title = request.getParameter("title");
	//select box 가져오기

%>
<html>
<head>
<meta charset="UTF-8">
<title>SEARCH</title>
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
</style>
</head>
<body>

<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>

	<!-- Page Content -->
<div class="container">

  <!-- Page Heading -->
  <%if (search == "null"){%>
  	<br>
  	<h1 class="my-4" style="text-align: center">검색어를 입력하세요</h1>
  	<br><br><br>
	<form name = "out" method = "get" action="search.jsp">
	<ASIDE style="text-align: center">
	<select name = "select">
		<option value = "0">제목 </option>
		<option value = "1">작가 </option>
		<option value = "2">태그 </option>
	</select>
	<input type='text' name="addr" placeholder="내용을 입력하세요"/><input type='submit' value = "검색">
       </ASIDE>

	</form>

  <%} else if (search != "null" && list.size() != 0){%>
  <h1 class="my-4"><%=request.getParameter("addr") %>
    <small> 검색 결과 </small>
  </h1>
   <FORM name='frm' method='GET' action="search.jsp">
    <ASIDE style='float: right;'>
	<select name = "select">
		<option value = "0">제목 </option>
		<option value = "1">작가 </option>
		<option value = "2">태그 </option>
	</select>
       <input type='text' name="addr" placeholder="내용을 입력하세요"/><input type='submit' value = "검색">
       </ASIDE>
       <br>
       <br>
           	<div class = "row">

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
        </div>
      </div>
    </div>
    <%}%>   
    </div>
  </FORM>
 
	<br><br><br>
<%} else if(list.size() == 0) {%>
 
<br>
  	<h1 class="my-4" style="text-align: center">검색 결과가 없습니다.</h1>
  	<br><br><br>
	<form name = "out" method = "get" action="search.jsp">
	<ASIDE style="text-align: center">
	<select name = "select">
		<option value = "0">제목 </option>
		<option value = "1">작가 </option>
		<option value = "2">태그 </option>
	</select>
	<input type='text' name="addr" placeholder="내용을 입력하세요"/><input type='submit' value = "검색">
       </ASIDE>
	</form>

<%} %>
  <DIV class='menu_line' style='clear: both;'></DIV>
         <br><br><hr style = "border : outset 1px black;"><br>
	<h3>추천 키워드</h3><br>
	<div>
		<div>
			<table>

				<tbody>
					<tr>
						<td>#결혼생활</td>
						<td>#대학생활</td>
						<td>#반려동물</td>
						<td>#배틀</td>
					<tr>
						<td>#복수</td>
						<td>#일진</td>
						<td>#솔로</td>
						<td>#연예인 </td>

					<tr>
						<td>#음식</td>
						<td>#외계인</td>
						<td>#격투</td>
						<td>#직장생활</td>
				</tbody>
			</table>
		</div>
	</div>
	<br><br>
	
	<h3>추천 장르</h3><br>
	<div>
		<div>
			<table>
				<tbody>
					<tr>
						<td>에피소드</td>
						<td>스토리</td>
						<td>공포</td>
						<td>드라마</td>
					<tr>
						<td>무협</td>
						<td>미스터리</td>
						<td>순정만화</td>
						<td>스릴러물</td>
					<tr>
						<td>스포츠다</td>
						<td>액션</td>
						<td>일상</td>
						<td>지식</td>
					<tr>
						<td>코믹</td>
						<td>판타지</td>
						<td>학원</td>
						<td>성인</td>
				</tbody>
			</table>
		</div>
	</div>
	<br><br><br>
  
</DIV>

  <!-- /.row -->

  <!-- Pagination -->
  <!-- 
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
    </li>
  </ul>
 -->
 
 
<%@ include file="../bar/footer.jsp"%>
<!-- /.container -->
</body>
</html>