<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="webtoon.list.MWdetailVO"%>
  <%@ page import = "webtoon.content.contentVO" %> 
   <%@ page import = "webtoon.episode.WTepDAO" %>
    <%@ page import = "java.util.List" %>    
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

<style>
	.wtInfo .thumb{float:left; margin-right:15px;}
	.wtInfo .detail{float:left; width:554px;}
	.wtInfo h2{float:left; max-width:395px; margin:1px 0 11px -1px; font-size:18px; color:#020202; word-break:break-all; word-wrap:break-word;}
	.wtInfo h2 .wrt_nm{display:inline-block; margin:0 4px 0 7px; font-size:12px; color:#434343; font-weight:normal; vertical-align:middle;}
	p{display:block; margin-block-start:1em; margin-block-end:1em; margn-inline-start:0px; margin-inline-end:0px;}
	.bg-primary{background-color: #fff!important;}
	.info_wt .publish, .info_wt .genre, .info_wt .tag{margin-left:13px;}
	.info wt{padding:9px 0 17px; font-size:14px; color:#888; }
</style>
	<%--
	.info_wt .publish, .info_wt .genre, .info_wt .tag{display:inline-float:left;marign}
	.info_wt .publish, .info_wt .genre, .info_wt .tag{margin-left:13px;}
	.info wt{padding:9px 0 17px; font-size:14px; color:#888; }--%>

</head>


<%
		int mNum=100;//Integer.parseInt(request.getParameter("mw_num"));
	    /*
		int pageSize = 10; 
	    String pageNum = request.getParameter("pageNum");
	    if (pageNum == null) {  
	        pageNum = "1";       
	    }
	    int currentPage = Integer.parseInt(pageNum);     
	    int startRow = (currentPage - 1) * pageSize + 1;   
	    int endRow = currentPage * pageSize;            
	    int countEP = 0;   
	    int numberEP = 0; 
		*/ 
		
		MWdetailVO wtDetail=null;
	    //List webtoonEP = null;
	    
	    WTepDAO epdao = WTepDAO.getInstance();
	    wtDetail=epdao.getDetail(mNum); //웹툰 정보(장르,태그 등)
	   /*
	    countEP = epdao.getEPCount(mNum);   //웹툰의 에피소드 갯수
	    if (countEP > 0) {
	        webtoonEP = epdao.getEpisodes(mNum);
	    }

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
				<img src="https://shared-comic.pstatic.net/thumb/webtoon/703846/thumbnail/thumbnail_IMAG06_aa715a18-fe51-4adf-b21b-5fc253ed3f32.jpg" title="여신강림" alt="여신강림" width="125" height="101" onerror="this.src='https://static-comic.pstatic.net/staticImages/COMICWEB/NAVER/img/common/non125_101.gif'">
				</a>
				</div>
				<div class="detail">
					<h2><%=wtDetail.getWtTitle() %>
					<span class="wrt_nm"><%=wtDetail.getWtAuthor() %></span>
					</h2>
				</div>
				<br />
				<p></p>
				<span class="publish"><%=wtDetail.getDay() %> 연재</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span  class="genre"><%=wtDetail.getWtGenre() %></span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="tag"><%=wtDetail.getWtTag() %></span>		
				<br />
				<p>
				<%=wtDetail.getWtSumm() %>
				<br />
				"거리"
				</p>
				<div>
  				<button type="button" class="btn btn-default btn-sm">Small button</button>
				<button type="button" class="btn btn-default btn-sm">Small button</button>
				<button type="button" class="btn btn-default btn-sm">Small button</button>	
				</div>
			</div>	
	
	
	
	
	
	
	
	<div class="container">
	<table class="table table-stripped">
		<thead>
		<tr>
			<th>이미지</th>
			<th>제목</th>
			<th>별점</th>
			<th>등록일</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>
				<a href="/webtoon/viewer/66053" class="link_wt  " data-id="66053">
   				<img src="http://t1.daumcdn.net/webtoon/op/4f4685a5d28ead8610292e7785e0d3434d7ffbd4" alt="48화 호구 내일로 여행기(5)" width="71" height="41"> 
   				</a>
   			</td>
			<td>
				<a href="http://webtoon.daum.net/webtoon/viewer/66053" >48화 호구 내일로 여행기(5)</a>
			</td>
			<td></td>
			<td>2019.05.24</td>
		</tr>
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