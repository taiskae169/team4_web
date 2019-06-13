<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "webtoon.notice.*" %>
<%@ page import = "java.util.*" %>
    <%
	int nt_num = 0;
	nt_num = Integer.parseInt(request.getParameter("nt_num"));
	noticeDAO noticeView = noticeDAO.getInstance();
	noticeVO b = noticeView.content(nt_num);
    
    %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>NOTICE</title>

  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/main_webtoon/scrolling/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/main_webtoon/scrolling/css/scrolling-nav.css" rel="stylesheet">

<style>
   .wtInfo .thumb{float:left; margin-right:15px;}
   .wtInfo .detail{float:left; width:554px;}
   .wtInfo h2{float:left; max-width:395px; margin:1px 0 11px -1px; font-size:18px; color:#020202; word-break:break-all; word-wrap:break-word;}
   .wtInfo h2 .wrt_nm{display:inline-block; margin:0 4px 0 7px; font-size:12px; color:#434343; font-weight:normal; vertical-align:middle;}
   p{display:block; margin-block-start:1em; margin-block-end:1em; margn-inline-start:0px; margin-inline-end:0px;}
   .bg-primary{background-color: #fff!important;}
   .info_wt .publish, .info_wt .genre, .info_wt .tag{margin-left:13px;}
   .info wt{padding:9px 0 17px; font-size:14px; color:#888; }
</style>
   <%--
   .info_wt .publish, .info_wt .genre, .info_wt .tag{display:inline-float:left;marign}
   .info_wt .publish, .info_wt .genre, .info_wt .tag{margin-left:13px;}
   .info wt{padding:9px 0 17px; font-size:14px; color:#888; }--%>

</head>
<body id="page-top">
  <!-- Navigation -->
     <%@include file="/bar/menu.jsp" %>
   <%@include file="/bar/navigationBar.jsp" %>   
   
        <div class="container">

            <div class="detail">
                 <h1 class="my-4" style="text-align: center">공지사항</h1><br><br><br>
         </div>   

   </div>
   
   <div class="container">
   <table class="table table-stripped">
      <thead>
      <tr>
         <th>내용</th>

      </tr>
      </thead>
      
      <tbody>
      <tr>
         <td>
            <%= b.getNt_content() %>
            </td>
        
      </tbody>
   
   
   
   </table>
   <input type = "button" onclick = "location.href='notice.jsp'" value = "돌아가기">
   </div>
   
     <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom JavaScript for this theme -->
  <script src="/team4_webtoon/resources/main_webtoon/scrolling/js/scrolling-nav.js"></script>

</body>

</html>
<%@include file="/bar/footer.jsp" %>