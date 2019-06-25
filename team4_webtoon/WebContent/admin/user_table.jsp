<%@page import="team4_webtoon.registerBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="team4_webtoon.registerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
	<!-- 테이블용 스크립트 파일 -->
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


  <!-- Custom fonts for this template-->
  <link href="/team4_webtoon/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/team4_webtoon/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

<%
	registerDAO userdao = registerDAO.getInstance();
	ArrayList<registerBean> list = userdao.get_user_list();
	//회원정보를 받은 list 저장

%>


</head>

<body id="page-top">

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">유저관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>NUM</th>
                      <th>ID</th>
                      <th>EMAIL</th>
                      <th>AGE</th>
                      <th>NAME</th>
                      <th>SIGN_DATE</th>
                      <th>STATE</th>
                    </tr>
                  </thead>
                  <!-- 상단 제목바 -->
                  <tfoot>
                    <tr>
                      <th>NUM</th>
                      <th>ID</th>
                      <th>EMAIL</th>
                      <th>AGE</th>
                      <th>NAME</th>
                      <th>SIGN_DATE</th>
                      <th>STATE</th>
                    </tr>
                  </tfoot>
                  <!-- 하단 제목 바 -->
                  <tbody>
                  <%for(int i=0; i<list.size(); i++){ 
                	  //리스트의 숫자만큼(회원 수) 반복하여 출력
                	  	String state="";
                  		registerBean vo = list.get(i);
                  		if(vo.getState()==0){			//회원 상태를 확인하여 출력할 내용을 선택
	                  			state = "탈퇴";
	                  		}else if(vo.getState()==1){
	                  			state = "휴먼";
	                  		}else if(vo.getState()==2){
	                  			state = "활동중";
	                  		}else if(vo.getState()==3){
	                  			state = "작가";
	                  		}else if(vo.getState()==4){
	                  			state = "관리자";
	                  		}
                  		
	                  %>
		                    <tr>
		                      <td><%=vo.getUser_no() %></td>
		                      <td><%=vo.getId() %></td>
		                      <td><%=vo.getEmail() %></td>
		                      <td><%=vo.getAge() %></td>
		                      <td><%=vo.getName() %></td>
		                      <td><%=vo.getUser_reg() %></td>
		                      <td><a href="#open-moda<%=i %>" ><%=state %></a></td>
		                    </tr>
		                    
		                    <div id="open-moda<%=i %>" class="modal-window">
		                    <!-- 팝업창 생성 각 항목마다 전용 팝업창이 생성이 되어야 하므로 i값을 뒤에 붙여서 생성 -->		
		                    	<div>
		                    		<a href="#modal-close" title="Close" class="modal-close">Close</a>
		                    		<!-- 창 닫기 -->            		
									<form action="stateChPro.jsp" style="margin:0 auto;">
										<p>현재상태는 <%=state %>입니다.</p>
										<p>변경할 항목을 선택해 주세요</p>
										<select name="state" style="width:50%;">
											<% 
											if(vo.getState()==0){%>
												<option value=0 selected>탈퇴</option>
												<option value=1>휴먼</option>
												<option value=2>할동중</option>
												<option value=3>작가</option>
												<option value=4>관리자</option>
											<%}else if(vo.getState()==1){%>
												<option value=0>탈퇴</option>
												<option value=1 selected>휴먼</option>
												<option value=2>할동중</option>
												<option value=3>작가</option>
												<option value=4>관리자</option>
											<%}else if(vo.getState()==2){%>
											
												<option value=0>탈퇴</option>
												<option value=1>휴먼</option>
												<option value=2 selected>할동중</option>
												<option value=3>작가</option>
												<option value=4>관리자</option>
											<%}else if(vo.getState()==3){ %>
												<option value=0>탈퇴</option>
												<option value=1>휴먼</option>
												<option value=2>할동중</option>
												<option value=3 selected>작가</option>
												<option value=4>관리자</option>
											<%}else if(vo.getState()==4){
											%>
										
												<option value=0>탈퇴</option>
												<option value=1>휴먼</option>
												<option value=2>할동중</option>
												<option value=3>작가</option>
												<option value=4 selected>관리자</option>
											<%}%>
											<!-- 현재 상태를 selected한 상태로 출력하기 위한 if문 -->
										</select>
										<input type="hidden" value="<%= vo.getUser_no()%>" name="num" />
										<input type="submit" value="변경" />
										
									</form>
								</div> <!-- 폼을 둘러싸고 있는 div -->
						</div>  <!-- 팝업창 div -->
						
					<%}%>
                  </tbody>
                </table>
              </div>
            </div>
          </div>




  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript-->
  <script src="/team4_webtoon/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/team4_webtoon/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/team4_webtoon/resources/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/team4_webtoon/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="/team4_webtoon/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/team4_webtoon/resources/admin/js/demo/datatables-demo.js"></script>

</body>

</html>
