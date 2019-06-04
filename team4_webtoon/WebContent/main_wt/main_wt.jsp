<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="webtoon.list.WebToonListVO"%>
  <%@ page import = "webtoon.episode.WTepDAO" %>  
<%@ page import = "java.text.SimpleDateFormat" %>
 <%@ page import = "java.util.List" %>   
    
    
    <%--
    		int mw_num=Integer.parseInt(request.getParameter("mw_num"));
    		String title=request.getParameter("title");
    	  	    
    	    int pageSize = 10; 
    	    String pageNum = request.getParameter("pageNum");
    	    if (pageNum == null) {  
    	        pageNum = "1";       
    	    }
    	    int currentPage = Integer.parseInt(pageNum);     
    	    int startRow = (currentPage - 1) * pageSize + 1;   
    	    int endRow = currentPage * pageSize;            
    	    int countEP = 0;   
    	    int numberEP = 0; 
 
    	    List webtoonEP = null;
    	    
    	    WTepDAO epdao = WTepDAO.getInstance();   
    	    countEP = epdao.getEPCount(mw_num);   //웹툰의 에피소드 갯수
    	    if (countEP > 0) {
    	        webtoonEP = epdao.getEpisodes(mw_num);
    	    }

    	   numberEP = countEP-(currentPage-1)*pageSize;
    	    
    
   --%>
   
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Tables</title>

  <!-- Custom fonts for this template -->
  <link href="/team4_webtoon/resources/main_webtoon/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/main_webtoon/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="/team4_webtoon/resources/main_webtoon/sbadmin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Navigation -->
  	<%@include file="/bar/menu.jsp" %>
	<%@include file="/bar/navigationBar.jsp" %>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

          <!-- Page Heading -->
          <div class="wt_table" >
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>
				
                <table class="table table-bordered" id="dataTable" width="50%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>이미지</th>
                      <th>제목</th>
                      <th>별점</th>
                      <th>등록일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><img src="http://t1.daumcdn.net/webtoon/op/09c7a4f89a633fb54678b8c4e7ec32c9cc61b5ee" width="186" height="112" class="img_thumb" alt="6화 억울한 범인"></td>
                      <td>6화 억울한 범인</td>
                      <td>Edinburgh</td>
                      <td>2019.06.24</td>
                    </tr>
                    <tr>
                      <td><img src="http://t1.daumcdn.net/webtoon/op/31c84aaf66e816210cf569f5e83c6efd264fd5ba" width="186" height="112" class="img_thumb" alt="5화 면접"></td>
                      <td>5화 면접</td>
                      <td>Tokyo</td>
                      <td>2019.06.17</td>
                    </tr>
                    <tr>
                      <td><img src="http://t1.daumcdn.net/webtoon/op/9fd936572aa79c774ceb86dc2bd7b91adc754540" width="186" height="112" class="img_thumb" alt="4화 만 시간의 법칙"></td>
                      <td>4화 만 시간의 법칙</td>
                      <td>San Francisco</td>
                      <td>2019.06.10</td>
                    </tr>
                    <tr>
                      <td><img src="http://t1.daumcdn.net/webtoon/op/b86f946cae462fed29c58e103c2d8ae013a14de3" width="186" height="112" class="img_thumb" alt="3화 수상한 병원"></td>
                      <td>3화 수상한 병원</td>
                      <td>Edinburgh</td>
                      <td>2019.06.03</td>
                    </tr>
                    <tr>
                      <td><img src="http://t1.daumcdn.net/webtoon/op/6bcba67f4f36f396698352c2a85b51c1e5d66b16" width="186" height="112" class="img_thumb" alt="2화 동거의 이유"></td>
                      <td>2화 동거의 이유</td>
                      <td>Tokyo</td>
                      <td>2019.05.27</td>
                    </tr>
                    <tr>
                      <td><img src="http://t1.daumcdn.net/webtoon/op/a2c091e129a29c38bb7375ba2dc3bbd543408c0e" width="186" height="112" class="img_thumb" alt="1화 킬러의 정체"></td>
                      <td>1화 킬러의 정체</td>
                      <td>San Francisco</td>
                      <td>2019.05.20</td>
                    </tr>
                    <tr>
                      <td><img src="http://t1.daumcdn.net/webtoon/op/c3a71bc35a1b3df18b23c70fd0f40ca2668759b5" width="186" height="112" class="img_thumb" alt="예고편"></td>
                      <td>예고편</td>
                      <td>San Francisco</td>
                      <td>2019.05.13</td>
                    </tr>
                  </tbody>
                </table>
                </div>
          </div>
      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>


  <!-- Bootstrap core JavaScript-->
  <script src="/team4_webtoon/resources/main_webtoon/sbadmin/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/main_webtoon/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/team4_webtoon/resources/main_webtoon/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/team4_webtoon/resources/main_webtoon/sbadmin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/team4_webtoon/resources/main_webtoon/sbadmin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="/team4_webtoon/resources/main_webtoon/sbadmin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/team4_webtoon/resources/main_webtoon/sbadmin/js/demo/datatables-demo.js"></script>

</body>

</html>
