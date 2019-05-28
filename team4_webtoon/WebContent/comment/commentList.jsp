<%@page import="webtoon.comment.cmtDAO"%>
<%@page import="webtoon.comment.cmtVO"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	String id = request.getParameter("id");
	String content = request.getParameter("content");
	String like = request.getParameter("like");
	String hate = request.getParameter("hate");
	String reg = request.getParameter("reg");
	
	
%>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">



  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/comment/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/comment/css/blog-post.css" rel="stylesheet">

</head>

<body>

        <!-- Single Comment -->
        <div class="media mb-4" align>
          <div class="media-body">
            <h5 class="mt-0"><%=id %></h5>
            	<div class="form-control">
            		<%=content %>
            	</div>
            	<div style="float:right">
					<i class=" fas fa-thumbs-up" style="color:gray"></i> <%=like %>
					<i class=" fas fa-thumbs-up" style="color:red"></i> <%=hate %>
					<a href="#" class="nav-link"">신고하기</a>

            	</div>
          </div>
        </div>
		<hr />

</body>
  <!-- /.container -->
