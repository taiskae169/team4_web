<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="webtoon.list.MWdetailVO"%>
  <%@ page import = "webtoon.content.contentVO" %> 
   <%@ page import = "webtoon.episode.WTepDAO" %>
      <%@ page import = "webtoon.content.contentDAO" %>
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
	.link_page{text-decoration: none; color: #212529;}
	.link_page:hover{text-decoration: underline; color: #212529;}
	#wtDT {margin-top:100px;}
	
	
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


<%

		String cmtNumch = request.getParameter("cmtNum");
		int cmtNum=1;
		if(cmtNumch!=null){
			cmtNum=Integer.parseInt(cmtNumch);
		}
		
		int mNum=Integer.parseInt(request.getParameter("mw_num"));
	    
		int pageSize = 10; // 한 화면에 출력할 게시물 개수
	    String pageNum = request.getParameter("pageNum"); 
	    if (pageNum == null) {  
	        pageNum = "1";       
	    }
	    int currentPage = Integer.parseInt(pageNum); //현재 페이지     
	    int startRow = (currentPage - 1) * pageSize + 1;   
	    int endRow = currentPage * pageSize;  
	    System.out.println(currentPage + " " + startRow + " " + endRow);
	    
	    
	    int countEP = 0;   //웹툰 에피소드 갯수
	   // int numberEP = 0; 
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	   
		MWdetailVO wtDetail=null;
	    List webtoonEP = null;
	    
	    WTepDAO epdao = WTepDAO.getInstance();
	    wtDetail=epdao.getDetail(mNum); //웹툰 정보(장르,태그 등)
	  
	    countEP = epdao.getEPCount(mNum);   //웹툰의 에피소드 갯수
	    
	    if (countEP > 0) {
	        webtoonEP = epdao.getEpisodes(mNum,startRow, endRow);
	    }
	    /*
	   numberEP = countEP-(currentPage-1)*pageSize;
		*/
		

%>



<body id="page-top">
  <!-- Navigation -->
  	<%@include file="/bar/menu.jsp" %>
	<%@include file="/bar/navigationBar.jsp" %>	
	
		  <div class="container" id="wtDT">
 			<div class="wtInfo" >
				<div class="thumb">
				<a>
				<img src="/team4_webtoon/resources/image/webtoon/thumbnail/<%=wtDetail.getWtTitle() %>_som.jpg" title="<%=wtDetail.getWtTitle() %>" alt="<%=wtDetail.getWtTitle() %>" width="125" height="101" onerror="this.src='/team4_webtoon/resources/image/webtoon/thumbnail/imgErr.gif'">
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
				<%String wtTag=wtDetail.getWtTag();
					wtTag=wtTag.trim();
					wtTag=wtTag.replaceAll("#","");
					
					String[] arrTag= wtTag.split(",");
					
					for(int i=0;i<arrTag.length;i++) {
						//System.out.println(arrTag[i]);
						String tag = arrTag[i].trim();
						%>
						<a class="link_tag"  href="/team4_webtoon/search/search.jsp?select=2&addr=<%=tag%>">#<%=tag%></a>
						<% }%>	
				
				<%--<a class="link_tag"  href="/team4_webtoon/search/search.jsp?select=2&addr=<%=arrTag[i] %>"><%=wtDetail.getWtTag() %></a>--%>
				

				<br />
				<p>
				<%=wtDetail.getWtSumm() %>
				<br />	
		<%int wtstar=wtDetail.getWtStar();
				switch(wtstar){
				case 5:
					for(int j=5;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}
					break;
				case 4:
					for(int j=4;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}
					for(int k=0;k<1;k++){ %>
					<small class="text-muted">&#9734;</small>
				<%}
					break;
				case 3:
					for(int j=3;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}
					for(int k=0;k<2;k++){ %>
					<small class="text-muted">&#9734;</small>
				<%}
					break;
				case 2:
					for(int j=2;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}
					for(int k=0;k<3;k++){ %>
					<small class="text-muted">&#9734;</small>
				<%} 
					break;
				case 1:
					for(int j=1;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}
					for(int k=0;k<4;k++){ %>
					<small class="text-muted">&#9734;</small>
				<%}
					break;
				}
				
				//int sP=countEP;
				//int sSum=episode.getMw_star_sum();
				//double avgS=(double)sSum/sP;				
			%>
				<b><%= wtDetail.getWtStar()%>	</b>
			
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
<%  } else {    %>
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
				<a href="/team4_webtoon/webtoon_view/viewerPage.jsp?mw_num=<%=wtDetail.getmNum() %>&cl_num=<%=episode.getCl_num()%>" class="link_wt" data-id="66053">
   				<img src="/team4_webtoon/resources/image/webtoon/<%=wtDetail.getWtTitle() %>/<%=episode.getWt_ep_img()%>" alt="<%=episode.getCl_title() %>" width="71" height="41" onerror="this.src='/team4_webtoon/resources/image/webtoon/thumbnail/imgErr2.gif'">
   				</a>
   			</th>
			<th>
				<a href="/team4_webtoon/webtoon_view/viewerPage.jsp?mw_num=<%=wtDetail.getmNum() %>&cl_num=<%=episode.getCl_num()%>"><%=episode.getCl_title() %></a>
				<%
				java.util.Date date = episode.getCl_reg();
				long now = System.currentTimeMillis();
				long inputDate = date.getTime();
				// 1000*60*60*24(하루를 1/1000초단위로 변환)*지정할 기간(만약 2일동안 new가 보여져야 한다면 2)
				if(now - inputDate < (1000*60*60*24*2)){  %>
			<img src="/team4_webtoon/resources/image/webtoon/wt_ep/up.png" width="27" height="15" alt="UP">
			<%}%>
			</th>
			<th>			
			<%int star=episode.getMw_star();
				switch(star){
				case 5:
					for(int j=5;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}
					break;
				case 4:
					for(int j=4;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}
					for(int k=0;k<1;k++){ %>
					<small class="text-muted">&#9734;</small>
				<%}
					break;
				case 3:
					for(int j=3;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}
					for(int k=0;k<2;k++){ %>
					<small class="text-muted">&#9734;</small>
				<%}
					break;
				case 2:
					for(int j=2;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}
					for(int k=0;k<3;k++){ %>
					<small class="text-muted">&#9734;</small>
				<%} 
					break;
				case 1:
					for(int j=1;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}
					for(int k=0;k<4;k++){ %>
					<small class="text-muted">&#9734;</small>
				<%}
					break;
				case 0:
					for(int k=0;k<5;k++){ %>
					<small class="text-muted">&#9734;</small>
				<%}
					break;
				}
				
				int sP=episode.getMw_star_p();	
				int sSum=episode.getMw_star_sum();
				double avgS=(double)sSum/sP;
				if(sP==0 || sSum==0){
					avgS=0;
				}	
			%>
				<b><%=avgS %></b>
			
			</th>
			<th>
			<%=sdf.format(episode.getCl_reg())%>
			<%
			String uid=(String)session.getAttribute("sessionID");
			String wtwriter=wtDetail.getWtAuthor();
			if(uid!=null){
				if(uid.equals(wtwriter)){ %>
			<a href="#open-Moda<%=i%>"><img src="/team4_webtoon/resources/main_webtoon/sbadmin/vendor/fontawesome-free/svgs/regular/trash-alt.svg"  width="22px" height="22px"/></a>
			<%}else{} }%>
			</th>
		</tr>
		
		<div id="open-Moda<%=i %>" class="modal-window">
		                    	<div>
		                    		<a href="#modal-close" title="Close" class="modal-close">Close</a>            		
									<div>
			                    		<a href="#modal-close" title="Close" class="modal-close">Close</a>
			                    		<!-- 창 닫기 -->            		
										<p> 정말 삭제하시겠습니까? </p>
										<a href="deleteContentPro.jsp?cl_num=<%=episode.getCl_num() %>" title="yes" style="margin-right:10px;">예</a>
										<a href="#modal-close" title="no" style="margin-left:10px;">아니요</a>
						 			</div> <!-- 폼을 둘러싸고 있는 div -->
										
									</form>
								</div> <!-- 폼을 둘러싸고 있는 div -->
						 </div>  <!--  요일 변경 팝업창 div -->
						 
						 
		<%}%>
		</tbody>	
	</table>

		<%
    if (countEP > 0) {
    	int pageBlock=5; //하단 페이지바에 표시할 페이지 수
        int pageCount = countEP / pageSize + ( countEP % pageSize == 0 ? 0 : 1); //총 페이지 개수

        int startPage = (int)(currentPage/pageBlock == 0? 1:((currentPage%pageBlock)==0?(((currentPage/pageBlock)-1)*pageBlock+1):((currentPage/pageBlock)*pageBlock+1)));		
        /*sP=startPage(하단 페이지바에서 첫 페이지 번호) cP=currentPage(현재 페이지) pB=pageBlock
       (1) cP/pB == 0 sP=1
       (2) cp/pB != 0 
       	(2-1) cP%pB ==0     sP=((cP/pb)-1)*pB+1
       	(2-2) cP%pB !=0       sP=(cp/pB)*pB+1
        		   		   
       예제 a) pB=5  cP=2, (1) 2/5=0 ==0  sP=1
       예제 b) pB=5  cp=5, (2) 5/5=1 !=0  (2-1) 5%5=0 ==0    sP= ((5/5)-1)*5+1 =1 
       예제 c) pB=5  cp=12, (2)12/5=2 !=0  (2-2) 12%5=2 !=0    sP= (12/5)*5+1 =11 
		
        */
        
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
             
        if (currentPage > 1) {%>
        	<a  class="link_page" href="mainWT.jsp?pageNum=1">[처음]</a>
 <%  }

        if (currentPage > 1) {%>
        	<a  class="link_page" href="mainWT.jsp?pageNum=<%= currentPage - 1 %>">[이전]</a>
 <%  }

        for (int i = startPage; i <= endPage; i++) {
           	 if (i == currentPage) {%>
                <b><a  class="link_page"  href="mainWT.jsp?pageNum=<%=currentPage %>">[<%=currentPage%>]</a></b>
 <%           } else {%>
                <a  class="link_page"  href="mainWT.jsp?pageNum=<%= i %>">[<%= i %>]</a>
 <% 		      }
        }

        if (currentPage < pageCount) { %> 
           	<a  class="link_page"  href="mainWT.jsp?pageNum=<%= currentPage+1 %>">[다음]</a>
 <%  } 
        
        if (endPage <pageCount) {%>
            <a  class="link_page"  href="mainWT.jsp?pageNum=<%= pageCount %>">[끝]</a>
<%  }            

    }
}
%>
	
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