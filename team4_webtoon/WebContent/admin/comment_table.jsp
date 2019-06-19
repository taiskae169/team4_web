<%@page import="webtoon.comment.cmtDAO"%>
<%@page import="webtoon.comment.cmtVO"%>
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
	cmtDAO dao = cmtDAO.getinstance();
	ArrayList<cmtVO> list = dao.getListForAdmin();
		  
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

</head>

<body id="page-top">

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">댓글 관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>NUM</th>
                      <th>WRITER</th>
                      <th>CONTENT</th>
                      <th>STATE</th>
                      <th>REG</th>
                      <th>MW_NUM</th>
                      <th>CL_NUM</th>
                      <th>ETC</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>NUM</th>
                      <th>WRITER</th>
                      <th>CONTENT</th>
                      <th>STATE</th>
                      <th>REG</th>
                      <th>MW_NUM</th>
                      <th>CL_NUM</th>
                      <th>ETC</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  <%
                  	if(list.size()==0){%>
                   <tr>
                      <td>항목이 없습니다.</td>
                  	  <td>-</td>
                  	  <td>-</td>
                  	  <td>-</td>
                  	  <td>-</td>
                  	  <td>-</td>
                  	  <td>-</td>
                  	  <td>-</td>
                  	
                   </tr>
                  	<%}
                  	for(int i=0; i<list.size(); i++){
                  		cmtVO vo = list.get(i);
                  		String state;
                  		if(vo.getState()==0){
                  			state="기본";
                  		}else{
                  			state="숨김";
                  		}
                  %>
	                    <tr>
	                      <td><%=vo.getNum() %></td>
	                      <td><%=vo.getId() %></td>
	                      <td><%=vo.getContent() %></td>
	                      <td><a href="#open-stateModa<%=i%>"><%=state%></a></td>
	                      <td><%=vo.getReg() %></td>
	                      <td><%=vo.getMw_num()%></td>
	                      <!-- 누르면 웹툰 리스트 페이지로 가도록 -->
	                      <td><%=vo.getCl_num()%></td>
	                      <!-- 누르면 해당 화로 가도록 링크 -->
	                      <td>
	                      <a href="#open-delmoda<%=i %>" class="btn btn-danger btn-circle" style="margin:auto 0;">
		                 	   <i class="fas fa-trash"></i>
		                  </a>
	                      </td>
	                    </tr>
	                    
	                    
	                    <div id="open-stateModa<%=i %>" class="modal-window">
		                    	<div>
		                    		<a href="#modal-close" title="Close" class="modal-close">Close</a>            		
									<form action="CommentCh.jsp" style="margin:0 auto;">
										<p>현재장르는 <%=state%>입니다.</p>
										<%if(vo.getState()==0){ %>
											<p>숨기시겠습니까?</p>
											<input type="hidden" value=1 name="state" />
										<%}else{ %>
											<p>숨김을 푸시겠습니까?</p>
											<input type="hidden" value=0 name="state" />
										<%} %>
										
										<input type="hidden" value="<%=vo.getNum() %>" name="num" />
										<input type="submit" value="변경" />
										
									</form>
								</div> <!-- 폼을 둘러싸고 있는 div -->
						 </div>  <!--  요일 변경 팝업창 div -->
						 <div id="open-delmoda<%=i %>" class="modal-window">
		                    <!-- 팝업창 생성 각 항목마다 전용 팝업창이 생성이 되어야 하므로 i값을 뒤에 붙여서 생성 -->		
		                    	<div>
		                    		<a href="#modal-close" title="Close" class="modal-close">Close</a>
		                    		<!-- 창 닫기 -->            		
									<p> 정말 삭제하시겠습니까? </p>
									<a href="/team4_webtoon/comment/deleteCmt.jsp?num=<%=vo.getNum() %>" title="yes" style="margin-right:10px;">예</a>
									<a href="#modal-close" title="no" style="margin-left:10px;">아니요</a>
						 		</div> <!-- 폼을 둘러싸고 있는 div -->
						</div>  <!-- 팝업창 div -->
							
					
	                    
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
