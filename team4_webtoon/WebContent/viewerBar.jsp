<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta charset="utf-8">
    <%@ page import ="team4_webtoon.*" %>
    <%@ page import ="webtoon.content.contentVO" %>
    <%@ page import ="webtoon.episode.StarVO" %>
        <%@ page import ="webtoon.episode.StarDAO" %>

    <%--
    	int mwNum=Integer.parseInt(request.getParameter("cl_title_id"));
    	int epNum = Integer.parseInt(request.getParameter("cl_num"));
    	StarDAO star=StarDAO.getInstance();
    	int epstar=star.getStar(mwNum,epNum);	
    	String fstar=Integer.toString(epstar);
    --%>
    
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/Main_page/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/team4_webtoon/resources/Main_page/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/Main_page/css/shop-homepage.css" rel="stylesheet">
    <link href="/team4_webtoon/resources/Main_page/css/shop-homepage.css" rel="stylesheet">
    
<script language="JavaScript">
    // 아이디 중복 여부를 판단
    function openConfirmstar(starForm) {
        // 아이디를 입력했는지 검사
        if (starForm.starSelect.value != "") {
            alert("별점이 등록되었습니다.");
            if(starForm.starSelect.value=="5"){            
            	document.getElementbyId("yesS").style.display="block";
            	document.getElementbyId("starSelect").style.display="none";
           	 	document.getElementbyId("cStar").style.display="none";
            	return;}

        }
    }
</script>



</head>
    
    
    
    
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/team4_webtoon/main_page/MainPage.jsp">사이트 명</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">별점주기
            	<form name="starForm" >	
		<select id="starSelect"   style="display:block">
			<option value="5" selected>
				<%for(int j=5;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}%>
			</option>
			<option value="4" >			
				<%for(int j=4;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}%>
				<%for(int i=0;i<1;i++){ %>
					<small class="text-muted">&#9734;</small>
				<%} %>
			</option>
			<option value="3" >
				<%for(int j=3;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}%>
				<%for(int i=0;i<2;i++){ %>
					<small class="text-muted">&#9734;</small>
				<%} %>
			</option>	
			<option value="2" >
				<%for(int j=2;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}%>
				<%for(int i=0;i<3;i++){ %>
					<small class="text-muted">&#9734;</small>
				<%} %>
			</option>	
			<option value="1" >
				<%for(int j=1;j >0;j--){%>
					<small class="text-muted">&#9733;</small>
				<%}%>
				<%for(int i=0;i<4;i++){ %>
					<small class="text-muted">&#9734;</small>
				<%} %>
			</option>		
		</select>
		<input type="button" name="confirm_star" value="확인"  id="cStar" style="display:block"
        							OnClick="openConfirmstar(this.form)">
        <span name="yesS" id="yesS" style="display:none">참여하셨습니다</span>  		
	</form>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  	  <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/Main_page/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/Main_page/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
