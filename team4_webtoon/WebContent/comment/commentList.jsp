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
  
    <script src="/team4_webtoon/resources/admin/js/sb-admin-2.min.js"></script>
    
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  
   <link href="/team4_webtoon/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/comment/css/blog-post.css" rel="stylesheet">
  <script type="text/javascript">
	function r_che(){
		if(document.r_form.comment.value==""){
			
			alert("댓글을 입력해주세요");
			document.r_form.comment.focus();
			return false;
			
		}
	}
	</script>
  
  	<style>
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

</head>

<body>
	<div class="row">
		<div class="card h-100" style="width:98%; margin:auto; margin-bottom:10px;">
          <h4 class="card-header"><%=id %></h4>
          <!-- id를 출력 -->
          <div class="card-body">
            <p class="card-text"><%=content %>
            <%if(id.equals(seID)){ %>
           		  
           		 <a href="#open-moda<%=num %>" class="btn btn-danger btn-circle" style="float:right; margin-left:10px;">
                    <i class="fas fa-trash"></i>
                 </a>
                 <a href="#open-chmoda<%=num %>" class="btn btn-info btn-circle"  style="float:right; margin-rigt:10px;">
                    <i class="fas fa-info-circle"></i>
                  </a>
            <%} %>
            </p>
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
							
							<a href="commentHide.jsp?num=<%=num %>&state=0&pageNum=<%=Integer.toString(cmtNum) %>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>" class="btn btn-primary btn-icon-split btn-sm" style="margin-left:10px;">
			                    <span class="icon text-white-50">
			                    	  <i class="fas fa-flag"></i>
			                    </span>
			                    <span class="text">댓글 보이기</span>
              		   		</a>
						<%}else{ %>
							<a href="commentHide.jsp?num=<%=num %>&state=1&pageNum=<%=Integer.toString(cmtNum) %>&mw_num=<%=mw_num %>&cl_num=<%=cl_num %>" class="btn btn-danger btn-icon-split btn-sm" style="margin-left:10px;">
			                    <span class="icon text-white-50">
			                    	  <i class="fas fa-flag"></i>
			                    </span>
			                    <span class="text">댓글 숨기기</span>
              		   		</a>
						<%} %>
					<!-- 레벨을 체크하여 관리자일 시 댓글을 숨기기, 풀기 버튼  -->
					<%}else{ %>
						
						<a href="mailto:admin@ex.com?" class="btn btn-warning btn-icon-split btn-sm" style="margin-left:10px;">
		                    <span class="icon text-white-50">
		                      	<i class="fas fa-flag"></i>
		                    </span>
		                    <span class="text">신고하기</span>
		               	</a>
					<%} %>
					<!-- 관리자가 아닐 시 신고하기 버튼으로 관리자에게 메일을 보낼 수 있도록 설정 -->
				</div>
			</div>
			<div id="open-moda<%=num %>" class="modal-window">
		                    <!-- 팝업창 생성 각 항목마다 전용 팝업창이 생성이 되어야 하므로 i값을 뒤에 붙여서 생성 -->		
		                    	<div>
		                    		<a href="#modal-close" title="Close" class="modal-close">Close</a>
		                    		<!-- 창 닫기 -->            		
									<p> 정말 삭제하시겠습니까? </p>
									<a href="deleteCmt.jsp?num=<%=num %>" title="yes" style="margin-right:10px;">예</a>
									<a href="#modal-close" title="no" style="margin-left:10px;">아니요</a>
								</div> <!-- 폼을 둘러싸고 있는 div -->
			</div>  <!-- 팝업창 div -->
			<div id="open-chmoda<%=num %>" class="modal-window">
		                    <!-- 팝업창 생성 각 항목마다 전용 팝업창이 생성이 되어야 하므로 i값을 뒤에 붙여서 생성 -->		
		                    	<div>
		                    		<a href="#modal-close" title="Close" class="modal-close">Close</a>
		                    		<!-- 창 닫기 -->            		
									<p>수정할 내용을 써주세요 </p>
									<form action="mo_cmt.jsp" name="mo_cmt" onsubmit="return r_che();">
										<input type="hidden" name="num" value="<%=num  %>" />
										<textarea name="content" class="form-control" rows="3"></textarea>
										<button type="submit"  Style="float:right">댓글 수정</button>
									</form>
								</div> <!-- 폼을 둘러싸고 있는 div -->
			</div>  <!-- 팝업창 div -->
			
          </div>
        </div>
	</div>


	
</body>
  <!-- /.container -->
