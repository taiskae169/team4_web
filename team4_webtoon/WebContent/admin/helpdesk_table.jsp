<%@page import="java.text.SimpleDateFormat"%>
<%@page import="webtoon.helpdesk.helpVO"%>
<%@page import="webtoon.helpdesk.ToadminDAO"%>
<%@page import="webtoon.content.contentVO"%>
<%@page import="webtoon.episode.WTepDAO"%>
<%@page import="webtoon.list.MWdetailVO"%>
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
	ToadminDAO dao = ToadminDAO.getInstance();
	ArrayList<helpVO> list = dao.getDetail();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

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
              <h6 class="m-0 font-weight-bold text-primary">문의 목록</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>NUM</th>
                      <th>TITLE</th>
					  <th>CATEGORY</th>
					  <th>COMPANY</th>
					  <th>NAME</th>
					  <th>REG</th>
                    </tr>
                  </thead>
                  <!-- 상단 제목 바 -->
                  <tfoot>
                    <tr>
                      <th>TITLE</th>
					  <th>CATEGORY</th>
					  <th>COMPANY</th>
					  <th>NAME</th>
					  <th>REG</th>
                    </tr>
                  </tfoot>
                  <!-- 하단 제목바 -->
                  <tbody>
                  <%
                  	if(list.size()==0){%>
                  		<tr>
                  			<td>목록이 없습니다.</td>
                  			<td>-</td>
                  			<td>-</td>
                  			<td>-</td>
                  			<td>-</td>
                  			<td>-</td>
                  		
                  		
                  		</tr>
                  <%}else{
                  
                  	for(int i=0; i<list.size(); i++){
                  		helpVO vo = list.get(i);
                  		//웹툰 리스트 출력 시작
                  %>
	                    <tr>
	                      <td><%=i%></td>
	                      <td><a href="#open-delmoda<%= i%>"><%=vo.getTitle() %></a></td>
	                      <%
	                      	int cate = vo.getCat();	
	                      	String category="";
	                      	if(cate==0){category="1대1문의";  }
	                      	if(cate==1){category="사업관련";}
	                      	if(cate==2){category="차기작제안";}
	                      %>
	                      <td><%=category %></td>
	                      <td><%=vo.getCname() %></td>
	                      <td><%=vo.getName() %></td>
	                      <td><%=df.format(vo.getReg()) %></td>
	                      
	                    </tr>
	                    
	                    <div id="open-delmoda<%=i %>" class="modal-window">
		                    	<div>
		                    		<a href="#modal-close" title="Close" class="modal-close">Close</a>            		
									<p> 제목 : <%=vo.getTitle() %> </p>
									<p>
										<%=vo.getContent() %>
									</p>
									<%if(vo.getFile()!=null){ %>
									<p>
										<img src="/team4_webtoon/resources/proposal/<%=vo.getFile() %>" style="width:350px"/>
									</p>
									<%} %>
									<a href="mailto:<%=vo.getMail() %>" class="btn btn-warning btn-icon-split btn-sm" style="float:right;">
					                    	답변하기
		               				</a>
							
									
								</div> <!-- 폼을 둘러싸고 있는 div -->
							</div>  <!-- 장르 변경 팝업창 div -->
	                    
	                    
                    <% }%>
                    <%} %>
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
