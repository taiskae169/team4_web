<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Scrolling Nav - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/wb_dP/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/wb_dP/css/scrolling-nav.css" rel="stylesheet">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  
  
	<style>
		.wb_day{color:red;"}
		.link_genre{color:#fff;}
		.screen_out {overflow: hidden; position: absolute;}	
		#SNS{color:#fff;}	
	</style>
</head>

<body id="page-top">

     <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">Start Bootstrap</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#services">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <header class="bg-primary text-white">
      <div class="col-md-8 mb-5">
      <h1>키몽의 호구로운 생활</h1>
      <p class="lead"><a class="link_genre" href="http://webtoon.daum.net/search/total?q=%23%EC%BD%94%EB%AF%B9#page=1" >코믹</a>,<a>일상</a>,<a>유머</a></p>
      <p class="lead">예쁜 나이 서른 살, 어딘가 모자란 청년들의 호구 같은 나날들</p>
      <a class="btn btn-success btn-lg" href="#">첫화보기 </a>
      </div>
      <div class="col-md-4 mb-5">
      
       </div>
    
    
    <div class="inner_writer">
			<strong class="screen_out">작가 정보</strong>
			<dl class="list_writerinfo">
				<dt class="screen_out">작가sns</dt>
				<dd class="writer_sns">
					<a href="#none" target="_blank" class="btn btn-default btn-lg" data-mail="hongly8919@daum.net">메일</a>
					<span class="glyphicon glyphicon-envelope" ></span>
					<a href="https://www.facebook.com/kimong8919" target="_blank" class="glyphicon glyphicon-home" id="SNS"></a>
				
					<div class="email_layer" style="display:none;left:-339px;top:102px">
						<div class="inner_email_layer inner_email_layer1">
							<div class="layer_body">
								<strong class="tit_email"><span class="bg_bar"></span>작가_이메일</strong>
								<span class="desc_email"></span>
							</div>
							<div class="layer_foot">
								<button type="button" class="btn_comm btn_close">닫기</button>
							</div>
						</div>
					</div>
				</dd>
				<dt class="screen_out">작가의 프로필 사진</dt>
				<dd class="item_profile">
					<div class="panel_profile">
						<img src="http://t1.daumcdn.net/cartoon/590B459501501A0001" width="114" height="114" class="img_profile" alt="키몽 사진">
					</div>
				</dd>
				<dt class="screen_out">작가명</dt>
				<dd class="txt_writer"><a href="/search/total?q=%ED%82%A4%EB%AA%BD" class="link_search">키몽</a></dd>
				<dt class="screen_out">작가의 말</dt>
				<dd class="writer_message">
					<span class="ico_comm ico_bar"></span>
				
					<span class="inner_message">
						<span class="link_message">
							<span class="txt_message txt_empty">작가의 말이 없습니다.</span>
						</span>
						
					</span>
				</dd>
				
				<dd class="writer_mask" style="background:url(http://t1.daumcdn.net/webtoon/op/e5959dca378de0a9e4edc64914a4a165bf994c17) no-repeat"></dd>
			</dl>
		
		</div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!-- /.row -->
    <div class="container">
      <h1>Welcome to Scrolling Nav</h1>
      <p class="lead"><a class="link_genre" href="http://webtoon.daum.net/search/total?q=%23%EC%BD%94%EB%AF%B9#page=1" >코믹</a>,<a>일상</a>,<a>유머</a></p>
      <p class="lead">예쁜 나이 서른 살, 어딘가 모자란 청년들의 호구 같은 나날들</p>
      <a class="btn btn-success btn-lg" href="#">첫화보기 </a>
    </div>
	<div>
  </header>

  <section id="about">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>매주<span class="wb_day">금요일</span> 연재</h2>
   			<form>
   			<table border="1">
   			<thead>
   			<tr>
   				<th scope="col">이미지</th>
   				<th scope="col">제목</th>
   				<th scope="col">별점</th>
   				<th scope="col">등록일</th>
   			</tr>
   			</thead>
   			<tbody>
   			<tr>
   				<td>
   				<a href="/webtoon/viewer/66053" class="link_wt  " data-id="66053">
   				<img src="http://t1.daumcdn.net/webtoon/op/4f4685a5d28ead8610292e7785e0d3434d7ffbd4" alt="48화 호구 내일로 여행기(5)" width="71" height="41">
   				</a>
   				</td>
   				<td class="title">
				<a href="http://webtoon.daum.net/webtoon/viewer/66053" >48화 호구 내일로 여행기(5)</a>
				</td>
				<td></td>
				<td>
				2019.05.24
				</td>
   			</tbody>
   			</table>
   			</form>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="team4_webtoon/resources/wb_dP/vendor/jquery/jquery.min.js"></script>
  <script src="team4_webtoon/resources/wb_dP/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="team4_webtoon/resources/wb_dP/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom JavaScript for this theme -->
  <script src="team4_webtoon/resources/wb_dP/js/scrolling-nav.js"></script>

</body>

</html>