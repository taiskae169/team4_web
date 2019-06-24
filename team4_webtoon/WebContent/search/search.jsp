<%@ page import = "search.SearchDAO"%>
<%@ page import = "search.SearchVO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "webtoon.list.*" %>
<%@ page import = "webtoon.genre.*" %>
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
	.blacka{
		color : black;
	}
	
	#test a:hover{
		text-decoration:none;
		background-color: rgba(108,192,255,0.2);
	}
</style>
</head>
<body>

<%@include file="../bar/menu.jsp" %>
<%@include file="../bar/navigationBar.jsp" %>

	<!-- Page Content -->
<div class="container" style="margin-top:100px; margin-bottom : 50px;">

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
		<option value = "3">장르 </option>
	</select>
	<input type='text' style = "margin-right:5px;"name="addr" placeholder="내용을 입력하세요"/><input type='submit' value = "검색" class="btn btn-outline-dark btn-sm">
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
		<option value = "3">장르 </option>
	</select>
       <input type='text' style = "margin-right:5px;" name="addr" placeholder="내용을 입력하세요"/><input type='submit' value = "검색" class="btn btn-info btn-sm">
       </ASIDE>
       <br>
       <br>
           	<div class = "row">

    	<%for(int i = 0; i < list.size(); i++){%>

    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
      <div class="card h-100">
        <a href="/team4_webtoon/main_wt/mainWT.jsp?mw_num=<%=list.get(i).getNum()%>"><img class="card-img-top" src="/team4_webtoon/resources/image/webtoon/thumbnail/<%=list.get(i).getTitle() %>_som.jpg" alt=""></a>
        <div class="card-body">
          <h4 class="card-title">
			 <a href="/team4_webtoon/main_wt/mainWT.jsp?mw_num=<%=list.get(i).getNum()%>" style = "color : black;"><%=list.get(i).getTitle() %></a>
          </h4>
          <p class="card-text"><a href="/team4_webtoon/search/search.jsp?select=1&addr=<%=list.get(i).getWriter()%>" style = "color : black;"><%=list.get(i).getWriter() %></a></p>
          <%
genreDAO a = genreDAO.getInstance();
	genreVO c = a.genreCheck(Integer.parseInt(list.get(i).getGen()));
%>
          <p class="card-text">

        	<a href="/team4_webtoon/search/search.jsp?select=3&addr=<%=c.getValue()%>" style = "color:black"><%=c.getValue() %></a>
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
  	<h1 class="my-4" style="text-align: center"><%=request.getParameter("addr") %>의 결과가 없습니다.</h1>
  	<br><br><br>
	<form name = "out" method = "get" action="search.jsp">
	<ASIDE style="text-align: center">
	<select name = "select">
		<option value = "0">제목 </option>
		<option value = "1">작가 </option>
		<option value = "2">태그 </option>
		<option value = "3">장르 </option>
	</select>
	<input type='text' name="addr" style = "margin-right:5px;" placeholder="내용을 입력하세요"/><input type='submit' value = "검색" class="btn btn-info btn-sm">
       </ASIDE>
	</form>

<%} %>
  <DIV class='menu_line' style='clear: both;'></DIV>
         <br><br><hr style = "border : outset 1px black;"><br>
	<h3>추천 키워드</h3><br>
	<div id = "test">
		<div>
			<table>

				<tbody>
					<tr>
						<td><a href="search.jsp?select=2&addr=결혼생활" class = "blacka">#결혼생활</a></td>
						<td><a href="search.jsp?select=2&addr=대학생활" class = "blacka">#대학생활</a></td>
						<td><a href="search.jsp?select=2&addr=반려동물" class = "blacka">#반려동물</a></td>
						<td><a href="search.jsp?select=2&addr=배틀" class = "blacka">#배틀</a></td>
					<tr>
						<td><a href="search.jsp?select=2&addr=복수" class = "blacka">#복수</a></td>
						<td><a href="search.jsp?select=2&addr=일진" class = "blacka">#일진</a></td>
						<td><a href="search.jsp?select=2&addr=솔로" class = "blacka">#솔로</a></td>
						<td><a href="search.jsp?select=2&addr=결혼생활" class = "blacka">#연예인 </a></td>

					<tr>
						<td><a href="search.jsp?select=2&addr=음식" class = "blacka">#음식</a></td>
						<td><a href="search.jsp?select=2&addr=외계인" class = "blacka">#외계인</a></td>
						<td><a href="search.jsp?select=2&addr=결투" class = "blacka">#격투</a></td>
						<td><a href="search.jsp?select=2&addr=직장생활" class = "blacka">#직장생활</a></td>
				</tbody>
			</table>
		</div>
	</div>
	<br><br>
	
	<h3>추천 장르</h3><br>
	<div id = "test">>
		<div>
			<table>
				<tbody>
					<tr>
						<td><a href="search.jsp?select=3&addr=에피소드" class = "blacka">에피소드</a></td>
						<td><a href="search.jsp?select=3&addr=시대극" class = "blacka">시대극</a></td>
						<td><a href="search.jsp?select=3&addr=감성" class = "blacka">감성</a></td>
						<td><a href="search.jsp?select=3&addr=드라마" class = "blacka">드라마</a></td>
					<tr>
						<td><a href="search.jsp?select=3&addr=무협" class = "blacka">무협</a></td>
						<td><a href="search.jsp?select=3&addr=미스터리" class = "blacka">미스터리</a></td>
						<td><a href="search.jsp?select=3&addr=순정" class = "blacka">순정만화</a></td>
						<td><a href="search.jsp?select=3&addr=스릴러" class = "blacka">스릴러물</a></td>
					<tr>
						<td><a href="search.jsp?select=3&addr=스포츠" class = "blacka">스포츠다</a></td>
						<td><a href="search.jsp?select=3&addr=액션" class = "blacka">액션</a></td>
						<td><a href="search.jsp?select=3&addr=일상" class = "blacka">일상</a></td>
						<td><a href="search.jsp?select=3&addr=지식" class = "blacka">지식</a></td>
					<tr>
						<td><a href="search.jsp?select=3&addr=개그" class = "blacka">개그</a></td>
						<td><a href="search.jsp?select=3&addr=판타지" class = "blacka">판타지</a></td>
						<td><a href="search.jsp?select=3&addr=학원" class = "blacka">학원</a></td>
						<td><a href="search.jsp?select=3&addr=성인" class = "blacka">성인</a></td>
				</tbody>
			</table>
		</div>
	</div>
  
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