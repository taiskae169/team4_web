<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="webtoon.list.MWdetailVO"%>
  <%@ page import = "webtoon.content.contentVO" %> 
   <%@ page import = "webtoon.episode.WTepDAO" %>
    <%@ page import = "java.util.List" %>    
    <%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>웹툰 테이블 테스트</title>

  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/main_webtoon/scrolling/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/main_webtoon/scrolling/css/scrolling-nav.css" rel="stylesheet">

<style type="text/css">
	.wtInfo .thumb{float:left; margin-right:15px;}
	.wtInfo .detail{float:left; width:554px;}
	.wtInfo h2{float:left; max-width:395px; margin:1px 0 11px -1px; font-size:18px; color:#020202; word-break:break-all; word-wrap:break-word;}
	.wtInfo h2 .wrt_nm{display:inline-block; margin:0 4px 0 7px; font-size:12px; color:#434343; font-weight:normal; vertical-align:middle;}
	p{display:block; margin-block-start:1em; margin-block-end:1em; margn-inline-start:0px; margin-inline-end:0px;}
	.bg-primary{background-color: #fff!important;}
	.info_wt .publish, .info_wt .genre, .info_wt .tag{margin-left:13px;}
	.info wt{padding:9px 0 17px; font-size:14px; color:#888; }
	.link_wtAuthor{text-decoration: none; color: #212529;}
	.link_wtAuthor:hover{text-decoration: underline; color: #212529;}
	.link_genre{text-decoration: none; color: #212529;}
	.link_genre:hover{text-decoration: underline; color: #212529;}
	.link_tag{text-decoration: none; color: #212529;}
	.link_tag:hover{text-decoration: underline; color: #212529;}
	.link_wt{text-decoration: none; color: #212529;}
	.link_wt:hover{text-decoration: underline; color: #212529;}
</style>
	<%--
	.info_wt .publish, .info_wt .genre, .info_wt .tag{display:inline-float:left;marign}
	.info_wt .publish, .info_wt .genre, .info_wt .tag{margin-left:13px;}
	.info wt{padding:9px 0 17px; font-size:14px; color:#888; }--%>

</head>


<%
		int mNum=109;//Integer.parseInt(request.getParameter("mw_num"));
	    /*
		int pageSize = 10; 
	    String pageNum = request.getParameter("pageNum");
	    if (pageNum == null) {  
	        pageNum = "1";       
	    }
	    int currentPage = Integer.parseInt(pageNum);     
	    int startRow = (currentPage - 1) * pageSize + 1;   
	    int endRow = currentPage * pageSize;  
	    */ 
	    int countEP = 0;   
	   // int numberEP = 0; 
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	   
		MWdetailVO wtDetail=null;
	    List webtoonEP = null;
	    
	    WTepDAO epdao = WTepDAO.getInstance();
	    wtDetail=epdao.getDetail(mNum); //웹툰 정보(장르,태그 등)
	  
	    countEP = epdao.getEPCount(mNum);   //웹툰의 에피소드 갯수
	    if (countEP > 0) {
	        webtoonEP = epdao.getEpisodes(mNum);
	    }
	    /*
	   numberEP = countEP-(currentPage-1)*pageSize;
		*/


%>















<body id="page-top">
  <!-- Navigation -->
  	<%@include file="/bar/menu.jsp" %>
	<%@include file="/bar/navigationBar.jsp" %>	
	
		  <div class="container">
 			<div class="wtInfo" >
				<div class="thumb">
				<a>
				<img src="/team4_webtoon/resources/image/webtoon/thumbnail/<%=wtDetail.getWtTitle() %>_som.jpg" title="여신강림" alt="여신강림" width="125" height="101" onerror="this.src='https://static-comic.pstatic.net/staticImages/COMICWEB/NAVER/img/common/non125_101.gif'">
				</a>
				</div>
				<div class="detail">
					<h2><%=wtDetail.getWtTitle() %>
					<span class="wrt_nm"><a class="link_wtAuthor"  href="/team4_webtoon/search/search.jsp?select=1&addr=<%=wtDetail.getWtAuthor() %>"><%=wtDetail.getWtAuthor() %></a></span>
					</h2>
				</div>
				<br />
				<p></p>
				<span class="publish"><%=wtDetail.getDay() %> 연재</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="link_genre"  href=""><%=wtDetail.getWtGenre() %></a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="link_tag"  href=""><%=wtDetail.getWtTag() %></a>	
				<br />
				<p>
				<%=wtDetail.getWtSumm() %>
				<br />
				"거리"
				
				
				
				
				<%--   총 별점
				<%for(int j=5;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}%>

				<%for(int j=4;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}%>
				<%for(int i=0;i<1;i++){ %>
					<small class="text-muted">&#9734;</small>
				<%} %>
				
				<%for(int j=3;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}%>
				<%for(int i=0;i<2;i++){ %>
					<small class="text-muted">&#9734;</small>
				<%} %>
				
				<%for(int j=2;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}%>
				<%for(int i=0;i<3;i++){ %>
					<small class="text-muted">&#9734;</small>
				<%} %>
				
				<%for(int j=1;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}%>
				<%for(int i=0;i<4;i++){ %>
					<small class="text-muted">&#9734;</small>
				<%}%>
				
				<%for(int j=5;j >0;j--){%>
					<small class="text-muted">&#9734;</small>
				<%}%>
				
				--%>
				
				
				
				
				
				
				
				
				
				
				
				
				</p>
				<div>
  				<button type="button" class="btn btn-outline-dark btn-sm">관심웹툰</button>
				<button type="button" class="btn btn-outline-dark btn-sm">첫회보기</button>
				<button type="button" class="btn btn-outline-dark btn-sm">작가의 다른 작품</button>	
				</div>
			</div>
			</div>	
	<br />
	
	<div class="container">
	<%
    if (countEP == 0) {
%>
<table cellpadding="0" cellspacing="0" >
<tr>
    <td align="center">
    게시판에 저장된 글이 없습니다.
    </td>
</table>
<%  } else { }   %>
	<table class="table table-stripped">
		<thead>
		<tr>
			<th>이미지</th>
			<th>제목</th>
			<th>별점</th>
			<th>등록일</th>
		</tr>
		</thead>
		<%
        for (int i = 0 ; i < webtoonEP.size() ; i++) {
          contentVO episode = (contentVO)webtoonEP.get(i);
		%>		
		<tbody>
		<tr>
			<th>
				<a href="" class="link_wt" data-id="66053">
   				<img src="/team4_webtoon/resources/image/webtoon/wt_ep/<%=episode.getWt_ep_img()%>" alt="<%=episode.getCl_title() %>" width="71" height="41"> 
   				</a>
   			</th>
			<th>
				<a href=""  class="link_wt"><%=episode.getCl_title() %></a>
			</th>
			<th><%=episode.getMw_star() %></th>
			<th><%=sdf.format(episode.getCl_reg())%></th>
		</tr>
		<%-- 	
		<tr>
			<td>
				<a href="*" class="link_wt" data-id="66053">
   				<img src="http://t1.daumcdn.net/webtoon/op/4f4685a5d28ead8610292e7785e0d3434d7ffbd4" alt="48화 호구 내일로 여행기(5)" width="71" height="41"> 
   				</a>
   			</td>
			<td>
				<a href="http://webtoon.daum.net/webtoon/viewer/66053" class="link_wt">48화 호구 내일로 여행기(5)</a>
			</td>
			<td></td>
			<td>2019.05.24</td>
		</tr>
		--%>
		<%}%>
		</tbody>
	
	
	
	</table>
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	  <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom JavaScript for this theme -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/js/scrolling-nav.js"></script>
	
</body>
</html>