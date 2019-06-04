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
	registerDAO userdao = registerDAO.getInstance();
	ArrayList<registerBean> list = userdao.get_user_list();

%>
<script type="text/javascript">
	function openlink(state,id){
		var url = "stateCh.jsp?state=" + state +"&id=" + id; 
		open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
		
	}
</script>

</head>

<body id="page-top">

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
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
                  <tbody>
                  <%for(int i=0; i<list.size(); i++){ 
                	  	String state="";
                  		registerBean vo = list.get(i);
                  		if(vo.getState()==0){
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
	                      <td><a href="#" onclick="window.open('stateCh.jsp?state=<%=vo.getState()%>&num=<%=vo.getUser_no()%>', 'confirm',  'toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200');"><%=state %></a></td>
	                    </tr>
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
