<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="webtoon.episode.WTepDAO"%>
<%@page import="webtoon.episode.WTepVO"%>
<%@page import="webtoon.episode.PrevNextEpVO"%>
<%@page import="webtoon.bookmark.BookmarkDAO"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>웹툰 뷰어 페이지</title>

  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/main_webtoon/agency/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/team4_webtoon/resources/main_webtoon/agency/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/main_webtoon/agency/css/agency.min.css" rel="stylesheet">

<style>
	.ml-center {margin-left:150px; }
	#box {float:left; padding:30px;margin-left:550px;margin-top:200px; margin-bottom:500px;}
	#box {float:left; }
	#mainNav{top:0px;padding-right:6px;padding-left:6px;}
	.navbar-expand-lg .navbar-collapse {color:#808080;}
	.epTitle{color:#808080;}
	#mainNav .navbar-brand {font-size:1.25em;}
	
</style>




<script type="text/javascript">
 var stmnLEFT = 10; // 오른쪽 여백 
 var stmnGAP1 = 0; // 위쪽 여백 
 var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
 var stmnBASE = 150; // 스크롤 시작위치 
 var stmnActivateSpeed = 5; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
 var stmnScrollSpeed = 5; //스크롤 속도 (클수록 느림)
 var stmnTimer; 
 
 function RefreshStaticMenu() { 
  var stmnStartPoint, stmnEndPoint; 
  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
  if (stmnStartPoint != stmnEndPoint) { 
   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
   stmnRefreshTimer = stmnScrollSpeed; 
   }
  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
  } 
 function InitializeStaticMenu() {
  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
  RefreshStaticMenu();
  }
</script>

<style type="text/css">
#STATICMENU { margin: 0pt; padding-top: 300px;  position: absolute; right: 0px; top: 0px;}

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




 <script language="JavaScript">
     function goLoginfirst() {
     alert("로그인 후 참여가능합니다.");
     url = "/team4_webtoon/login/login.jsp";
     open(url, "login",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
     return;
     }
</script>


</head>

<%

	String cmtNumch = request.getParameter("cmtNum");
	int cmtNum=1;
	if(cmtNumch!=null){
		cmtNum=Integer.parseInt(cmtNumch);
	}
	int mNum=Integer.parseInt(request.getParameter("mw_num"));
	int clNum=Integer.parseInt(request.getParameter("cl_num"));
	String id=(String)session.getAttribute("sessionID");
	WTepVO wtEP=null;
	WTepDAO wtDAO=WTepDAO.getInstance();
	wtEP=wtDAO.getWTContent(clNum,mNum);

%>



<body id="page-top" onload="InitializeStaticMenu();">

  <nav class="navbar navbar-expand-lg navbar-dark fixed-top navbar-shrink" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">WebToon</a>
      <a href="/team4_webtoon/main_wt/mainWT.jsp?mw_num=<%=mNum %>" ><%=wtEP.getMwTitle() %></a>
      <b class="epTitle">> <%=wtEP.getClTitle() %> </b>  
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      
      
      <%
      int clTid=mNum;
      PrevNextEpVO pEPn=null;
      pEPn=wtDAO.getprevnextEP(clTid,clNum);
     // System.out.println(pEPn.getPrevClT());
     %>
        
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-center">
          <li class="nav-item">
          <%int prvCN=pEPn.getPrevClN();
          //System.out.println(prvCN);
          if(prvCN != 0){ %>
            <a class="nav-link js-scroll-trigger" href="/team4_webtoon/webtoon_view/viewerPage.jsp?mw_num=<%=pEPn.getClTid()%>&cl_num=<%=prvCN%>"><img src="/team4_webtoon/resources/image/webtoon/wt_ep/prev3.png" width="32px" height="32px"></a>
         <%} else{%>
         <a class="nav-link js-scroll-trigger" href=""><img src="/team4_webtoon/resources/image/webtoon/wt_ep/prev1.png" width="32px" height="32px"></a>
         <% } %>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#portfolio"><b>웹툰리그</b></a>
          </li>
          <li class="nav-item">
          <% int nxtCN=pEPn.getNextClN();
          if(nxtCN !=0){ %>
           <a class="nav-link js-scroll-trigger" href="/team4_webtoon/webtoon_view/viewerPage.jsp?mw_num=<%=pEPn.getClTid()%>&cl_num=<%=nxtCN%>"><img src="/team4_webtoon/resources/image/webtoon/wt_ep/next3.png" width="32px" height="32px"></a>
         <%} else{%>
        	 <a class="nav-link js-scroll-trigger" href=""><img src="/team4_webtoon/resources/image/webtoon/wt_ep/next1.png" width="32px" height="32px"></a>
        <% } %>
          </li>
        </ul>
      </div>
      
      
      <div class="collapse navbar-collapse" id="navbarResponsive"> 
       <ul class="navbar-nav text-uppercase ml-auto">
         <% if(id==null){%>
         <script language="JavaScript">
    		 function goLoginfirst() {
           		alert("로그인 후 참여가능합니다.");
           	  	url = "/team4_webtoon/login/login.jsp";
           		open(url, "login",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
             	return;
         	 }
    		 </script>
        <li class="nav-item"><a href="/team4_webtoon/login/login.jsp"  Onclick="goLoginFirst();"><b>별점주기</b></a></li>&nbsp;        
         <li class="nav-item"></li>
        <%}else{ %>
         <li class="nav-item"><b>별점주기</b></li>&nbsp;   
        <li class="nav-item">
        <%@include file="/webtoon_view/starForm.jsp" %>
        </li>
        <%} %>
        </ul>
     	<ul class="nav navbar-nav navbar-right">
     	<% 
     	BookmarkDAO bmDAO=BookmarkDAO.getInstance();
     	if(id!=null){   	  
           boolean BMyn=bmDAO.checkBM(id,clNum);
           if(BMyn){%>
      		<li>
      		<a class="nav-link js-scroll-trigger" ><img src="/team4_webtoon/resources/image/webtoon/wt_ep/bmy.png" width="22px" height="22px"></a>
      		</li>
		<%}else{%>
			<script type="text/javascript">
			function callBMfunction(){
				location.href="/team4_webtoon/mypage/bmPro.jsp?mw_num=<%=mNum %>&cl_num=<%=clNum%>";
				return true;
				if(confirm("책갈피에 등록되었습니다.확인하겠습니까?")){
					location.href = "/team4_webtoon/mypage/mypage.jsp";
				    return true;
				   } else {}
				   location.href=document.referrer;
				   return false;
				}
			}
			</script>
            <li>
      		<a class="nav-link js-scroll-trigger" href="javascript:callBMfunction();"><img src="/team4_webtoon/resources/image/webtoon/wt_ep/bmn.png" width="22px" height="22px"></a>			
			</li>	
		<%}
       }else{%>
            <li>
      		<a class="nav-link js-scroll-trigger"  href="/team4_webtoon/login/login.jsp" Onclick="goLoginFirst();"><img src="/team4_webtoon/resources/image/webtoon/wt_ep/bmn.png" width="22px" height="22px"></a>
      		</li>
 	 <%}%>
			<li>
			<a class="nav-link js-scroll-trigger" href="/team4_webtoon/main_wt/mainWT.jsp?mw_num=<%=mNum %>" ><img src="/team4_webtoon/resources/image/webtoon/wt_ep/close1.png" width="22px" height="22px"></a>
			</li>
    	</ul>
       </div>
    </div>
  </nav>
  <br><br><br><br><br>
  

  
  
  	 <!-- Services -->
  <section class="page-section" id="services">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center" >
        <img src="/team4_webtoon/resources/image/webtoon/wt_ep/webtoon.gif" >
        <%--<img src="/team4_webtoon/resources/image/webtoon/<%=wtEP.getMwTitle()%>/<%=wtEP.getClContent()%>" > --%>
        <div id="scrollbottom"></div>
        </div>
        <div id="STATICMENU">
        <div>
		<a href="#" > <img src="/team4_webtoon/resources/main_webtoon/agency/vendor/fontawesome-free/svgs/solid/chevron-circle-up.svg" width="42px" height="42px" /></a>
		</div>
		<div>
		<a style="display:scroll;bottom:10px;right:3px;" rel="nofollow" href="#scrollbottom" title="Go to Bottom" >
		<img src="/team4_webtoon/resources/main_webtoon/agency/vendor/fontawesome-free/svgs/solid/chevron-circle-down.svg"  width="42px" height="42px" />
		</a>
		</div>
		</div>
        <div class="col-lg-12 text-center">
        <a href="" ><img src="/team4_webtoon/resources/main_webtoon/agency/vendor/fontawesome-free/svgs/solid/share-alt-square.svg" width="42px" height="42px" /></a>
		<a href=""><img src="/team4_webtoon/resources/main_webtoon/agency/vendor/fontawesome-free/svgs/regular/share-square.svg"  width="42px" height="42px" /></a>
        </div>
        
      </div>
      </div>
    </div>
  </section>


<div style="width: 80%; height: 100%; position:relative;margin-left:180px;">
  <%@include file="/comment/comment.jsp" %>	
</div> 
  
 <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoonagency/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/main_webtoon/agency/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/agency/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/agency/js/jqBootstrapValidation.js"></script>
  <script src="/team4_webtoon/resources/main_webtoon/agency/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/team4_webtoon/resources/main_webtoon/agency/js/agency.min.js"></script>

</body>

</html>
