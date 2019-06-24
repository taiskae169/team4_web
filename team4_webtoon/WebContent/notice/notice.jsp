<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtoon.notice.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
	<%!
		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	%>
    <%
    
    	String pageNum = request.getParameter("pageNum");
    	if(pageNum == null){
    		pageNum = "1";
    	}
    	
    	int currentPage = Integer.parseInt(pageNum);
    	int startRow = (currentPage - 1) * pageSize + 1;
    	int endRow = currentPage * pageSize;
    	int count = 0;
    	int number = 0;
    	
    	
    	List noticeList = null;
    	noticeDAO notice = noticeDAO.getInstance();
    	count = notice.count();
    	if(count > 0){
    		noticeList = notice.getNotice(startRow, endRow);

    	}
    	number = count - (currentPage - 1)*pageSize;
    	String id1 = (String)session.getAttribute("sessionID");
    	registerDAO manager1 = registerDAO.getInstance();
    	int check1 = manager1.level_check(id1);
    	
    	/*
    	전체적인 로직
    	
    	공지를 보여주는 페이지
    	페이지당 10개의 게시물을 보여준다.
    	관리자만 수정 가능하다.
    	
    	*/
    %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>NOTICE</title>

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
   
   
   			.modal-window {
		  position: fixed;
		  background-color: rgba(1, 1, 1, 0.15);
		  top: 0;
		  right: 0;
		  bottom: 0;
		  left: 0;
		  z-index: 999;
		  opacity: 0;
		  pointer-events: none;
		  -webkit-transition: all 0.3s;
		  -moz-transition: all 0.3s;
		  transition: all 0.3s;
		}
		
		.modal-window:target {
		  opacity: 1;
		  pointer-events: auto;
		}
		
		.modal-window>div {
		  width: 400px;
		  position: relative;
		  margin: 10% auto;
		  padding: 2rem;
		  background: #f3f3f3;
		  color: #444;
		}
		
		.modal-window header {
		  font-weight: bold;
		}
		
		.modal-close {
		  color: #aaa;
		  line-height: 50px;
		  font-size: 80%;
		  position: absolute;
		  right: 0;
		  text-align: center;
		  top: 0;
		  width: 70px;
		  text-decoration: none;
		}
		
		.modal-close:hover {
		  color: #000;
		}
		
		.modal-window h1 {
		  font-size: 150%;
		  margin: 0 0 15px;
		}

	
   
   
</style>
   <%--
   .info_wt .publish, .info_wt .genre, .info_wt .tag{display:inline-float:left;marign}
   .info_wt .publish, .info_wt .genre, .info_wt .tag{margin-left:13px;}
   .info wt{padding:9px 0 17px; font-size:14px; color:#888; }--%>



</head>
<body id="page-top">
  <!-- Navigation -->
     <%@include file="/bar/menu.jsp" %>
   <%@include file="/bar/navigationBar.jsp" %>   
   <%
   	if (count == 0 ){
   		if(check == 4){%>
   		<h1 class="my-4" style="text-align: center; margin-top:50px;">공지사항</h1>
   				<form name = "register" method = "post" action ="nt_register.jsp">
	<input type = "submit" value = "등록">
	</form>
<%   		}
   		
   	} else {
   %>
   
        <div class="container">

            <div class="detail" style="margin-top:150px; margin-bottom : 100px;">
                 <h1 class="my-4" style="text-align: center">공지사항</h1>
         </div>   

   </div>

   <div class="container">
	<%if (check1 == 4){%>
	<form name = "register" method = "post" action ="nt_register.jsp">
	<div style = "float : right; margin-bottom:10px; margin-right: 40px;">
	<input type = "submit" value = "공지사항 등록" class="btn btn-info">
	</div>
	</form>
	<%} %>
   <table class="table table-stripped">
      <thead>
      <tr>
         <th>카테고리</th>
         <th>번호</th>
         <th>제목</th>
         <th>글쓴이</th>
         <th>등록일</th>
         <%if (check1 == 4){ %>
         <th>관리</th>
         <%} %>
      </tr>
      </thead>
    
      <tbody>
          <% for (int j = 0; j < noticeList.size(); j++){ 
      	noticeVO notice1 = (noticeVO)noticeList.get(j);
      %> 
      <tr>
         <td>
         <%switch(notice1.getNt_category()){
         case 0 : %>서비스 공지<%break;
         case 1 : %>컨텐츠 공지<%break; 
         case 2 : %>결제 관련<%break;
         case 3 : %>안내<%break;
         case 4 : %>문의<%break;
         }%>
            </td>
         <td>
           	<%= notice1.getNt_num() %>
         </td>

         <td>
         <a style="color:black"href = "<%=request.getContextPath()%>/notice/noticeView.jsp?nt_num=<%=notice1.getNt_num()%>">	
         	<%= notice1.getNt_title() %>
		</a>
         </td>

         <td>
         	<%= notice1.getNt_writer() %>
         </td>
         <td>
			<%= sdf.format(notice1.getNt_reg()) %>
		</td>
		<%

		%>
		<%if (check1 == 4){ %>
		<td>	
			<a href = "<%=request.getContextPath()%>/notice/nt_adjust.jsp?nt_num=<%=notice1.getNt_num()%>">
			<input type = "submit" value = "수정" class="btn btn-success">
			</a>
			<a href = "#open-stateModa">
			<input type = "button" value = "삭제" class="btn btn-danger">
			</a>
		</td>
	<%} %>
      </tr>
      <div id = "open-stateModa" class="modal-window">
      	<div>
      		<a href="#modal-close" title = "Close" class = "modal-close">Close</a>
      		<form action = "nt_deletePro.jsp" style = "margin:0 auto;">
      		<p>공지를 삭제하시겠습니까?</p>
	<input type = "hidden" name = "nt_writer" value = "<%=id1 %>">
	<input type = "hidden" name = "nt_num" value = "<%=notice1.getNt_num() %>">
	<input type = "submit" value = "삭제" />
	</form>
      	</div>
      </div>
     
      <%} %>
      

      </tbody>

   
   
   
   </table>

      </div>
<div style="margin-bottom:50px;">
   <center>
   
      <%} %>
      <hr>
    <%
   
   	if(count > 0){
   		int pageCount = count/pageSize + (count % pageSize == 0 ? 0 : 1);
   		
   		int startPage = (int)(currentPage/10)*10+1;
   		int pageBlock = 10;
   		int endPage = startPage + pageBlock - 1;
   		if(endPage > pageCount) endPage = pageCount;
   		if(startPage > 10){ %>
   		<a href = "notice.jsp?pageNum=<%= startPage-10 %>">[이전]</a>
   		<%}
   		for (int i = startPage; i <= endPage; i++){
   		%>
   		<a style="color:black"href="notice.jsp?pageNum=<%= i %>">[<%= i %>]</a>
   		<%}
   		if(endPage < pageCount){
   		%>
   		<a href = "notice.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
   		<%
   		}
   	}
   		%>     
     </center> 
</div>
 <%@include file="/bar/footer.jsp" %>     

   			
     <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom JavaScript for this theme -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/js/scrolling-nav.js"></script>

</body>

</html>
