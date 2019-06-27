<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 <%@ page import = "java.text.SimpleDateFormat" %>    
 <%@ page import = "java.util.List" %>    
 <%@ page import = "webtoon.bookmark.BookmarkDAO" %>  
 <%@ page import = "webtoon.bookmark.BookmarkVO" %>  
 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
<title>책갈피 페이지</title>


  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/main_webtoon/scrolling/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/main_webtoon/scrolling/css/scrolling-nav.css" rel="stylesheet">

<style type="text/css">
	#page-top {margin-top:100px; }
	.link_wt{text-decoration: none; color: #212529;}
	.link_wt:hover{text-decoration: underline; color: #212529;}
	#deleteBM{margin-left:1000px}
	.link_wt {text-decoration: none; color: #212529;  }
	.link_wt:hover{text-decoration: underline; color: #212529; }
	.link_page{text-decoration: none; color: #212529;}
	.link_page:hover{text-decoration: underline; color: #212529;}
</style>



</head>





<%


		
		String IDbm = (String)session.getAttribute("sessionID");
	    
		int pageSize = 10; // 한 화면에 출력할 게시물 개수
	    String pageNum = request.getParameter("pageNum"); 
	    if (pageNum == null) {  
	        pageNum = "1";       
	    }
	    int currentPage = Integer.parseInt(pageNum); //현재 페이지     
	    int startRow = (currentPage - 1) * pageSize + 1;   
	    int endRow = currentPage * pageSize;  
	   // System.out.println(currentPage + " " + startRow + " " + endRow);
	    
	    
	    int countBM = 0;   //책갈피 된 웹툰 갯수
	   	int numberBM = 0; 
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	   
	    List webtoonBM = null;
	    
	    BookmarkDAO BMdao = BookmarkDAO.getInstance();
	   
	  
	    countBM = BMdao.getBMCount(IDbm);   //웹툰의 에피소드 갯수
	    
	    if (countBM > 0) {
	        webtoonBM = BMdao.getBMwebtoon(IDbm,startRow,endRow);
	    }
	   
	   numberBM = countBM-(currentPage-1)*pageSize;
		
		

%>

		








<body id="page-top">
  <!-- Navigation -->
  	<%@include file="/bar/menu.jsp" %>
	<%@include file="/bar/navigationBar.jsp" %>	
	<%@include file="/bar/session_url.jsp" %>	


	<div class="container">
	<%
    if (countBM == 0) {
%>

<h1 class="my-4" style="text-align: center"><%=IDbm %> 님의 책갈피</h1><br><br><br>

<table cellpadding="0" cellspacing="0" >
<tr>
    <td align="center">
    책갈피된 웹툰이 없습니다.
    </td>
</table>
<%  } else {    %>
<h1 class="my-4" style="text-align: center"><%=IDbm %> 님의 책갈피</h1><br><br><br>
	<form method="post" action="/team4_webtoon/bookmark/deleteBMpro.jsp" >
	<table class="table table-stripped" >
		<thead>
		<tr>
			<th>번호</th>
			<th></th>
			<th>제목</th>
			<th>소제목</th>
			<th>작가</th>
			<th>등록일</th>
			<th>선택
			</th>
		</tr>
		</thead>
		<%
        for (int i = 0 ; i < webtoonBM.size() ; i++) {
          BookmarkVO bmk = (BookmarkVO)webtoonBM.get(i);
		%>		
		<tbody>
		<tr>
			<th><%=numberBM--%></th>
			<th>
			<img src="/team4_webtoon/resources/image/webtoon/<%=bmk.getBmWTitle() %>/<%=bmk.getBmImg()%>" alt="<%=bmk.getBmWTitle() %>" 
			width="71" height="41" onerror="this.src='/team4_webtoon/resources/image/webtoon/thumbnail/imgErr2.gif'">
			</th>
			<th>
				<a href="/team4_webtoon/main_wt/mainWT.jsp?mw_num=<%=bmk.getBmWNum()%>" class="link_wt">
				<%=bmk.getBmWTitle() %>
				</a>
			</th>
			<th>
			<a href="/team4_webtoon/webtoon_view/viewerPage.jsp?mw_num=<%=bmk.getBmWNum()%>&cl_num=<%=bmk.getBmCNum()%>" class="link_wt">
			<%=bmk.getBmCTitle() %>
			</a>
   			</th>
			<th><%=bmk.getBmWriter() %></th>
			<th><%= sdf.format(bmk.getBmReg())%></th>
			<th><input type="checkbox" name="chk" value="<%=bmk.getBmNum()%>" /></th>
		<%}%>
		</tr>			 
		</tbody>	
	</table>
	




		<%
    if (countBM > 0) {
    	int pageBlock=5; //하단 페이지바에 표시할 페이지 수
        int pageCount = countBM / pageSize + ( countBM % pageSize == 0 ? 0 : 1); //총 페이지 개수

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
        	<a  class="link_page" href="bmPage.jsp?pageNum=1">[처음]</a>
 <%  }

        if (currentPage > 1) {%>
        	<a  class="link_page" href="bmPage.jsp?pageNum=<%= currentPage - 1 %>">[이전]</a>
 <%  }

        for (int i = startPage; i <= endPage; i++) {
           	 if (i == currentPage) {%>
                <b><a  class="link_page"  href="bmPage.jsp?pageNum=<%=currentPage %>">[<%=currentPage%>]</a></b>
 <%           } else {%>
                <a  class="link_page"  href="bmPage.jsp?pageNum=<%= i %>">[<%= i %>]</a>
 <% 		      }
        }

        if (currentPage < pageCount) { %> 
           	<a  class="link_page"  href="bmPage.jsp?pageNum=<%= currentPage+1 %>">[다음]</a>
 <%  } 
        
        if (endPage <pageCount) {%>
            <a  class="link_page"  href="bmPage.jsp?pageNum=<%= pageCount %>">[끝]</a>
<%  }            

    }
		
}
%>
	<input type="submit" id="deleteBM" value="삭제" />
	</form>
	</div>


<br><br><br>


	  <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom JavaScript for this theme -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/js/scrolling-nav.js"></script>
	




  <!-- Footer -->
	<%@include file="../bar/footer.jsp" %>


</body>
</html>