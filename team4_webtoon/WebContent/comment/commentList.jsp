<%@page import="team4_webtoon.registerDAO"%>
<%@page import="webtoon.comment.cmtDAO"%>
<%@page import="webtoon.comment.cmtVO"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	String seID = "user1";//session.getAttribute("");
	
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
			//신고된 댓글을 뜻하는 state가 1일 시 content 내용을 '신고된 댓글입니다'로 바꿈
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
          <!-- id를 출력 -->
          <div class="card-body">
            <p class="card-text"><%=content %></p>
            <!-- 댓글 내용을 출력 -->
          </div>
          <div class="card-footer">
          	<div style="float:right;">
            <% 
            		int likeCh = dao.likeCh(seID, Integer.parseInt(num));
            		// 지금 로그인한 사람이 좋아요/싫어요에 참여했는지 확인, 0일시 미참여/ 1일시 좋아요/ 2일 시 싫어요 참여를 뜻함
            		
            		if(likeCh==0){%>
            		<a href="cmt_lk_ch.jsp?num=<%=num %>&pageNum=<%=cmtNum%>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>&like=1&ch=1">
						<i class=" fas fa-thumbs-up" style="color:gray"></i>   
					</a>
					<%=like %>
					<a href="cmt_lk_ch.jsp?num=<%=num %>&pageNum=<%=cmtNum%>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>&like=2&ch=1">
					<i class=" fas fa-thumbs-up" style="color:gray"></i>
					</a> <%=hate %>  
					<!-- 
						좋아요/싫어요 참여를 위해
						num : 댓글 번호
						cmtNum : 현재 페이지 번호  -> 참여 이후 다시 돌아오기 위해 사용
						mw_num : 웹툰 번호
						cl_num : 웹툰 회차번호
						like : 좋아요, 싫어요 선택
						ch : 참여/삭제를 구분하기 위한 변수
						
						좋아요/싫어요를 +1 한 후 DB 내 Like_Check 데이터 베이스에 추가하여 참여 여부를 기록
					 -->
					<!-- 미참여 일 시 출력, 좋아요, 싫어요 모두 클릭 가능-->
				<%}else if(likeCh==1){ %>
				<a href="cmt_lk_ch.jsp?num=<%=num %>&pageNum=<%=cmtNum%>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>&like=1&ch=0">
					<i class=" fas fa-thumbs-up" style="color:blue"></i>   
					</a>
					<%=like %>
					<a href="#" onclick="alert('이미 참여하셨습니다'); return false;">
					<i class=" fas fa-thumbs-up" style="color:gray"></i>
					</a> <%=hate %>  
					<!-- 
						좋아요를 참여햇을 때 출력
						다시 좋아요를 누르면 ch=0으로 바꾸어서 재전송,
						좋아요 -1을 한 후 liek_check에서 데이터를 삭제하여 미참여 상태로 변경
						싫어요를 눌렀다면 '이미 참여하셨습니다'라는 메세지 출력
					 -->
				<%}else if(likeCh==2){ %>
				<a href="#" onclick="alert('이미 참여하셨습니다'); return false;">
					<i class=" fas fa-thumbs-up" style="color:gray"></i>   
					</a>
					<%=like %>
					<a href="cmt_lk_ch.jsp?num=<%=num %>&pageNum=<%=cmtNum%>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>&like=2&ch=0">
					<i class=" fas fa-thumbs-up" style="color:red"></i>
					</a> <%=hate %>  
					
					<!-- 
						싫어요 참여 시 출력
						다시 싫어요 출력 시 ch=0으로 바꾸어 재전송,
						싫어요를 -1을 한 후 like_check에서 데이터를 삭제하여 미참여 상태로 변경
						
						좋아요를 눌렀다면 '이미 참여하셨습니다.' 메세지를 출력
						
					 -->
				<%}%>
				
				<%//좋아요 목록 확인 %>
				<div style="float:right;">
					<%
					registerDAO userdao = registerDAO.getInstance();
					int level = userdao.level_check(seID);
					//로그인된 아이디의 레벨을 체크
					
					if(level ==4){%>
						<%if(state==1){%>
							<button onclick="location.href='commentHide.jsp?num=<%=num %>&state=0&pageNum=<%=Integer.toString(cmtNum) %>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>'" class="btn btn-primary">댓글 보이기</button>
						<%}else{ %>
							<button onclick="location.href='commentHide.jsp?num=<%=num %>&state=1&pageNum=<%=Integer.toString(cmtNum) %>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>'" class="btn btn-primary">댓글 숨기기</button>
						<%} %>
					<!-- 레벨을 체크하여 관리자일 시 댓글을 숨기기, 풀기 버튼  -->
					<%}else{ %>
						<a href="mailto:admin@ex.com?" class="nav-link" style="color:red;" class="btn btn-primary">신고하기</a>
					<%} %>
					<!-- 관리자가 아닐 시 신고하기 버튼으로 관리자에게 메일을 보낼 수 있도록 설정 -->
				</div>
					</div>
          </div>
        </div>
	</div>

</body>
  <!-- /.container -->
