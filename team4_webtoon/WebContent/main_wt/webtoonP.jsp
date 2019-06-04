<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹툰 상세 페이지</title>

<style>

.wt_head{position:relative; top:0; z-index:2010; width:100% height:90px; padding-top:36px; border-bottom:1 px solid; background:#fff;}
.wt_head .second_head{position:relative; z-index:999; width:979px; height:90px; margin:0 auto; background:#fff;}
#wt_logo{display:block; width:100%; height:100%; font-size:30px; line-height=34px;text-decoration:none; background:url(https://t1.daumcdn.net/webtoon/images/pc/logo_webtoon.png) no-repeat 0,0; }
.ir_wa {display: block; overflow: hidden;position: relative; z-index: -1; width: 100%; height: 100%;}
.screen_out{display: block;overflow: hidden;position: absolute;width: 0;height: 0;text-indent:-9999px;}
#daumGnb {float:left; width:311px; height:90px;}
.gnb_wt{overlow:hidden; height:91px;}
.gnb_wt .gnb_ranking{width:91px;}
.gnb_wt .gnb_league{width:129px;}
.gnb_wt .gnb_my {width:90px;}
.gnb_wt li{float:left; height:91px;}
.gnb_wt .gnb_ranking .gnb_comm{background-position:0 -39px;}
.gnb_wt .gnb_legue .gnb_comm{background-position:-92px -39px;}
.gnb_wt .gnb_my .gnb_comm{background-position:-221px -39px;}
.gnb_wt .gnb_comm{overflow;hidden; width:100px; height:88px; font-size:16px; line-height:88px; text-align:center;}
.gnb_comm{display:block; background:url("/team4_webtoon/resources/webtoon/webtoon_DP/gnb_comm.png") no repeat;}
dl,ul,ol,li{list-style:none;}
div{margin:0; padding:0; display:block;}
</style>




</head>
<body>

<!-- 웹툰 헤드 -->
<div class="wt_head">
	<div class="second_head">
		<h1>
			<a href="http://webtoon.daum.net/
			" id="wt_logo">
				<span class="ir_wa">WEBTOON</span>
			</a>
		</h1>
		<h2 class="screen_out">웹툰 메인메뉴</h2>
		<div id="daunGnb">
		<ul class="gnb_wt">
			<li class="gnb_ranking">
				<a href="http://webtoon.daum.net/ranking" class="gnb_comm">
					<span class="ir_wa">랭킹</span>
				</a>
			</li>
			<li class="gnb_league">
				<a href="http://webtoon.daum.net/league"" class="gnb_comm">
					<span class="ir_wa">웹툰리그</span>
				</a>
			</li>
			<li class="gnb_my">
				<a href="http://webtoon.daum.net/my/coupon" class="gnb_comm">
					<span class="ir_wa">My</span>
				</a>
			</li>
		</ul>
		</div>
	</div>
</div>

</body>
</html>