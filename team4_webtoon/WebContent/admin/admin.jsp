<%@page import="java.util.ArrayList"%>
<%@page import="webtoon.list.WebToonListDAO"%>
<%@page import="java.util.Date"%>
<%@page import="webtoon.cash.CashDAO"%>
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

  <title>관리자</title>

  <!-- Custom fonts for this template-->
  <link href="/team4_webtoon/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/team4_webtoon/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>



<body id="page-top">
  	<%@include file="/bar/menu.jsp" %>
  	
  	
  	<% 
  		ArrayList<Integer> MView = new ArrayList<Integer>();	//장르별 조회수 리스트
		  
		id = "admin";
		//세션 아이디를 받아서 level 체크 후에 관리자가 아닐 시 뒤로가기를 하는 로직 추가 필요
		registerDAO userdao = registerDAO.getInstance();
		CashDAO cashdao = CashDAO.getInstance();
		WebToonListDAO mainWbdao = WebToonListDAO.getInstance();
		int allView =0;
		//모든 게시물의 조회수를 체크
		for(int i = 0; i < 10; i++){
			allView += mainWbdao.getGenView(i);
		}

		for(int i = 0; i < 10; i++){
			int per = 0;		//퍼센트
			int gen_view = mainWbdao.getGenView(i);		//장르별 조회수를 체크
			if(gen_view!=0){
				per = (int)((gen_view/(double)allView)*100);			
				//100분율로 나누어서 per에 저장
			}
			
			MView.add(per);
			//차례대로 MView에 퍼센트를 지저앟ㄴ다.
		}		
		int month = new Date().getMonth() +1; 
		//오늘이 몇월인지 저장(getMonth로 받아오는 항목은 현재 월-1이므로 +1을 해준다.)
	
	%>
  	<!-- 메뉴바 올려놓기 -->
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
	<%@include file="sidebar.jsp" %>
    <!-- End of Sidebar -->



    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <p />
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">회원수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=userdao.getUserCount() %></div>
                      <!-- 회원수를 받아 출력 -->
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div> 

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">이번달 매출</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">$<%=cashdao.getMonthCash(month) %></div>
                      <!-- 이번달 매출을 계산하여 출력한다. -->
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">뭐를할까</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">뭐하지</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown 제목 -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">월별 매출</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                    <!-- myAreaChart라는 스크립트를 불러오는 것 -->
                  </div>
                </div>
              </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown 제목 -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">장르별 조회수</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="myPieChart"></canvas>
                    <!-- myPieChart라는 스크립트 기반 차트 로드 -->
                  </div>
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#EA5900;"></i> 일상
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#DEEA00;"></i> 개그
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#83E800;"></i> 판타지
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#00E07F;"></i> 액션
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#008461;"></i> 드라마
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#007ADD;"></i> 순정
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#AF00E5;"></i> 감성
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#408400;"></i> 스릴러
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#54002C;"></i> 시대극
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle" style="color:#D10000;"></i> 스포츠
                    </span>
                  </div>
                  <!-- 차트 하단 범례출력 -->
                </div>
              </div>
            </div>
          </div>

            <div class="col-lg-6 mb-4">


            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
     

      
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->
        <%@include file="/bar/footer.jsp" %>
	
  <!-- End of Page Wrapper -->

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
  <script src="/team4_webtoon/resources/admin/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <!-- 차트 용 스크립트 언어 -->
  <script type="text/javascript">
	 	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	  	Chart.defaults.global.defaultFontColor = '#858796';
	
	
	  function number_format(number, decimals, dec_point, thousands_sep) {
	    // *     example: number_format(1234.56, 2, ',', ' ');
	    // *     return: '1 234,56'
	    number = (number + '').replace(',', '').replace(' ', '');
	    var n = !isFinite(+number) ? 0 : +number,
	      prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
	      sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	      dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
	      s = '',
	      toFixedFix = function(n, prec) {
	        var k = Math.pow(10, prec);
	        return '' + Math.round(n * k) / k;
	      };
	    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
	    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	    if (s[0].length > 3) {
	      s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	    }
	    if ((s[1] || '').length < prec) {
	      s[1] = s[1] || '';
	      s[1] += new Array(prec - s[1].length + 1).join('0');
	    }
	    return s.join(dec);
	  }
	
	  // Area Chart Example
	  var ctx = document.getElementById("myAreaChart");
	  var myLineChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	      datasets: [{
	        label: "month",
	        lineTension: 0.3,
	        backgroundColor: "rgba(78, 115, 223, 0.05)",
	        borderColor: "rgba(78, 115, 223, 1)",
	        pointRadius: 3,
	        pointBackgroundColor: "rgba(78, 115, 223, 1)",
	        pointBorderColor: "rgba(78, 115, 223, 1)",
	        pointHoverRadius: 3,
	        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	        pointHitRadius: 10,
	        pointBorderWidth: 2,
	        data: [<%=cashdao.getMonthCash(1) %>, <%=cashdao.getMonthCash(2) %>, <%=cashdao.getMonthCash(3) %>, <%=cashdao.getMonthCash(4) %>, <%=cashdao.getMonthCash(5) %>, <%=cashdao.getMonthCash(6) %>, <%=cashdao.getMonthCash(7) %>, <%=cashdao.getMonthCash(8) %>, <%=cashdao.getMonthCash(9) %>, <%=cashdao.getMonthCash(10) %>, <%=cashdao.getMonthCash(11) %>, <%=cashdao.getMonthCash(12) %>],
	      }],
	    },
	    options: {
	      maintainAspectRatio: false,
	      layout: {
	        padding: {
	          left: 10,
	          right: 25,
	          top: 25,
	          bottom: 0
	        }
	      },
	      scales: {
	        xAxes: [{
	          time: {
	            unit: 'date'
	          },
	          gridLines: {
	            display: false,
	            drawBorder: false
	          },
	          ticks: {
	            maxTicksLimit: 7
	          }
	        }],
	        yAxes: [{
	          ticks: {
	            maxTicksLimit: 5,
	            padding: 10,
	            // Include a dollar sign in the ticks
	            callback: function(value, index, values) {
	              return '$' + number_format(value);
	            }
	          },
	          gridLines: {
	            color: "rgb(234, 236, 244)",
	            zeroLineColor: "rgb(234, 236, 244)",
	            drawBorder: false,
	            borderDash: [2],
	            zeroLineBorderDash: [2]
	          }
	        }],
	      },
	      legend: {
	        display: false
	      },
	      tooltips: {
	        backgroundColor: "rgb(255,255,255)",
	        bodyFontColor: "#858796",
	        titleMarginBottom: 10,
	        titleFontColor: '#6e707e',
	        titleFontSize: 14,
	        borderColor: '#dddfeb',
	        borderWidth: 1,
	        xPadding: 15,
	        yPadding: 15,
	        displayColors: false,
	        intersect: false,
	        mode: 'index',
	        caretPadding: 10,
	        callbacks: {
	          label: function(tooltipItem, chart) {
	            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	            return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
	          }
	        }
	      }
	    }
	  });
	
	  
	  
  </script>
  <%//차트 스크립트 %>
  <script type="text/javascript">
		//Set new default font family and font color to mimic Bootstrap's default styling
		  Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		  Chart.defaults.global.defaultFontColor = '#858796';
		
		  // Pie Chart Example
		  var ctx = document.getElementById("myPieChart");
		  var myPieChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: {
		      labels: ["일상", "개그", "판타지","액션", "드라마", "순정", "감성", "스릴러", "시대극", "스포츠"],
		      datasets: [{
		        data: [<%=MView.get(0)%>, <%=MView.get(1)%>, <%=MView.get(2)%>,<%=MView.get(3)%>,<%=MView.get(4)%>,<%=MView.get(5)%>,<%=MView.get(6)%>,<%=MView.get(7)%>,<%=MView.get(8)%>,<%=MView.get(9)%>],
		        backgroundColor: ['#EA5900', '#DEEA00', '#83E800','#00E07F','#008461','#007ADD','#AF00E5','#408400','#54002C','#D10000'],
		        hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
		        hoverBorderColor: "rgba(234, 236, 244, 1)",
		      }],
		    },
		    options: {
		      maintainAspectRatio: false,
		      tooltips: {
		        backgroundColor: "rgb(255,255,255)",
		        bodyFontColor: "#858796",
		        borderColor: '#dddfeb',
		        borderWidth: 1,
		        xPadding: 15,
		        yPadding: 15,
		        displayColors: false,
		        caretPadding: 10,
		      },
		      legend: {
		        display: false
		      },
		      cutoutPercentage: 80,
		    },
		  });

  
  </script>

</body>

</html>
