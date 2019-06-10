<%@page import="webtoon.list.WebtoonListForAdminVO"%>
<%@page import="webtoon.list.WebToonListDAO"%>
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




  <!-- Custom fonts for this template-->
  <link href="/team4_webtoon/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/team4_webtoon/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

<%
	WebToonListDAO dao = WebToonListDAO.getInstance();
	ArrayList<WebtoonListForAdminVO> list = dao.getListForAdmin();	//전체 웹툰을 받아옴
	ArrayList<String> gen = dao.getGen();							//생성되어 있는 장르를 받아옴
	ArrayList<String> mag = dao.getMag();							//현재 매거진 항목을 가지고옴
		  
%>
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
	<!-- 팝업용 스크립트문 나중에 빼기 -->

</head>

<body id="page-top">

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">웹툰 관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>NUM</th>
                      <th>TITLE</th>
                      <th>GEN</th>
                      <th>WEEK</th>
                      <th>WRITER</th>
                      <th>MAG</th>
                    </tr>
                  </thead>
                  <!-- 상단 제목 바 -->
                  <tfoot>
                    <tr>
                      <th>NUM</th>
                      <th>TITLE</th>
                      <th>GEN</th>
                      <th>WEEK</th>
                      <th>WRITER</th>
                      <th>MAG</th>
                    </tr>
                  </tfoot>
                  <!-- 하단 제목바 -->
                  <tbody>
                  <%
                  	for(int i=0; i<list.size(); i++){
                  		WebtoonListForAdminVO vo = list.get(i);
                  		//웹툰 리스트 출력 시작
                  	
                  %>
	                    <tr>
	                      <td><%=vo.getNum() %></td>
	                      <td><%=vo.getTitle() %></td>
	                      <td><a href="#open-gerModa<%=i%>" ><%=vo.getGen() %></a></td>
	                      <td><a href="#open-weekModa<%=i%>"><%=vo.getWeek() %></td>
	                      <td><%=vo.getWriter() %></a></td>
	                      <td><a href="#open-magModa<%=i%>"><%=vo.getMag() %></a></td>
	                    </tr>
	                    
	                    <div id="open-gerModa<%=i %>" class="modal-window">
		                    	<div>
		                    		<a href="#modal-close" title="Close" class="modal-close">Close</a>            		
									<form action="gerChPro.jsp" style="margin:0 auto;">
										<p>현재장르는 <%=vo.getGen() %>입니다.</p>
										<p>변경할 항목을 선택해 주세요</p>
										<select name="ger" style="width:50%;">
											<% 
											for(int a = 0; a<gen.size();a++){
												String ge = gen.get(a);
												%>
												<option value=<%=a %>><%=ge %></option>
												<!-- 장르 사이즈를 받아 현재 있는 장르를 출력 -->
											<%}%>
										</select>
										<input type="hidden" value="<%=vo.getNum() %>" name="num" />
										<input type="submit" value="변경" />
										
									</form>
								</div> <!-- 폼을 둘러싸고 있는 div -->
							</div>  <!-- 장르 변경 팝업창 div -->
							
							<div id="open-weekModa<%=i %>" class="modal-window">
		                    	<div>
		                    		<a href="#modal-close" title="Close" class="modal-close">Close</a>            		
									<form action="weekChPro.jsp" style="margin:0 auto;">
										<p>현재장르는 <%=vo.getWeek() %>입니다.</p>
										<p>변경할 항목을 선택해 주세요</p>
										<select name="week" style="width:50%;">
												<option value=0>도전만화</option>
												<option value=1>월요일</option>
												<option value=2>화요일</option>
												<option value=3>수요일</option>
												<option value=4>목요일</option>
												<option value=5>금요일</option>
												<option value=6>토요일</option>
												<option value=7>일요일</option>											
										</select>
										<input type="hidden" value="<%=vo.getNum() %>" name="num" />
										<input type="submit" value="변경" />
										
									</form>
								</div> <!-- 폼을 둘러싸고 있는 div -->
							</div>  <!--  요일 변경 팝업창 div -->
							
							
							<div id="open-magModa<%=i %>" class="modal-window">
		                    	<div>
		                    		<a href="#modal-close" title="Close" class="modal-close">Close</a>            		
									<form action="magChPro.jsp" style="margin:0 auto;">
										<p>현재MAG항목은 <%=vo.getMag() %>입니다.</p>
										<p>변경할 항목을 선택해 주세요</p>
										<select name="mag" style="width:50%;">
											<% 
											for(int a = 0; a<mag.size();a++){
												String ma = mag.get(a);
												%>
												<option value=<%=a %>><%=ma %></option>
												<!-- 현재 존재하는 MAG 항목을 받아 출력-->
											<%}%>						
										</select>
										<input type="hidden" value="<%=vo.getNum() %>" name="num" />
										<input type="submit" value="변경" />
										
									</form>
								</div> <!-- 폼을 둘러싸고 있는 div -->
							</div>  <!--  요일 변경 팝업창 div -->
                    <% }%>
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
