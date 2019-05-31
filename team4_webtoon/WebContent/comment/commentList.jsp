<%@page import="team4_webtoon.registerDAO"%>
<%@page import="webtoon.comment.cmtDAO"%>
<%@page import="webtoon.comment.cmtVO"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	String seID = "admin";//session.getAttribute("");
	
	String num = request.getParameter("num");	  		//코멘트 번호
	String id = request.getParameter("id");				//아이디
	String content = request.getParameter("content");	//코멘트 내용
	String like = request.getParameter("like");			//좋아요 숫자
	String hate = request.getParameter("hate");			//싫어요 숫자
	String reg = request.getParameter("reg");			//생성 날짜
	String mw_num = request.getParameter("mw_num");		//웹툰 번호
	String cl_num = request.getParameter("cl_num");		//웹툰 회차번호
	int state = Integer.parseInt(request.getParameter("state"));	//코멘트 숨기기 여부
	
	int cmtNum = Integer.parseInt(request.getParameter("cmtNum"));	//코멘트번호
	//현재 코멘트페이지번호를 입력받음
	cmtDAO dao = cmtDAO.getinstance();

%>

		<%
				if(state==1){
					content="<신고된 댓글입니다>";
				}
		%>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">



  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/comment/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/comment/css/blog-post.css" rel="stylesheet">

</head>

<body>
	<div class="row">
		<div class="card h-100" style="width:98%; margin:auto; margin-bottom:10px;">
          <h4 class="card-header"><%=id %></h4>
          <div class="card-body">
            <p class="card-text"><%=content %></p>
          </div>
          <div class="card-footer">
          	<div style="float:right;">
            <% 
            		int likeCh = dao.likeCh(seID, Integer.parseInt(num));
            		
            		if(likeCh==0){%>
            		<a href="cmt_lk_ch.jsp?num=<%=num %>&pageNum=<%=cmtNum%>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>&like=1&ch=1">
						<i class=" fas fa-thumbs-up" style="color:gray"></i>   
					</a>
					<%=like %>
					<a href="cmt_lk_ch.jsp?num=<%=num %>&pageNum=<%=cmtNum%>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>&like=2&ch=1">
					<i class=" fas fa-thumbs-up" style="color:gray"></i>
					</a> <%=hate %>  
				<%}else if(likeCh==1){ %>
				<a href="cmt_lk_ch.jsp?num=<%=num %>&pageNum=<%=cmtNum%>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>&like=1&ch=0">
					<i class=" fas fa-thumbs-up" style="color:blue"></i>   
					</a>
					<%=like %>
					<a href="#" onclick="alert('이미 참여하셨습니다'); return false;">
					<i class=" fas fa-thumbs-up" style="color:gray"></i>
					</a> <%=hate %>  
				<%}else if(likeCh==2){ %>
				<a href="#" onclick="alert('이미 참여하셨습니다'); return false;">
					<i class=" fas fa-thumbs-up" style="color:gray"></i>   
					</a>
					<%=like %>
					<a href="cmt_lk_ch.jsp?num=<%=num %>&pageNum=<%=cmtNum%>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>&like=2&ch=0">
					<i class=" fas fa-thumbs-up" style="color:red"></i>
					</a> <%=hate %>  
				<%}%>
				
				<%//좋아요 목록 확인 %>
				<div style="float:right;">
					<%
					registerDAO userdao = registerDAO.getInstance();
					int level = userdao.level_check(seID);
					
					
					if(level ==4){%>
						<%if(state==1){%>
							<button onclick="location.href='commentHide.jsp?num=<%=num %>&state=0&pageNum=<%=Integer.toString(cmtNum) %>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>'" class="btn btn-primary">댓글 보이기</button>
						<%}else{ %>
							<button onclick="location.href='commentHide.jsp?num=<%=num %>&state=1&pageNum=<%=Integer.toString(cmtNum) %>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>'" class="btn btn-primary">댓글 숨기기</button>
						<%} %>
						
					<%}else{ %>
						<a href="mailto:admin@ex.com?" class="nav-link" style="color:red;" class="btn btn-primary">신고하기</a>
					<%} %>
				</div>
					</div>
          </div>
        </div>
	</div>

</body>
  <!-- /.container -->
