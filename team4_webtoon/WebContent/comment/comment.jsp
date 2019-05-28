<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="webtoon.comment.cmtDAO"%>
<%@page import="webtoon.comment.cmtVO"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	String id = request.getParameter("id");
	//ID
	String mw_num = request.getParameter("mw_num");
	//만화 번호
	String cl_num = request.getParameter("cl_num"); 
	//만화 회차 번호
	
	//시험용
		mw_num = "100";
		cl_num = "1";
	//시험용
	
	cmtVO vo = new cmtVO();
	cmtDAO dao = cmtDAO.getinstance();
	ArrayList<cmtVO>  list = dao.getList(mw_num, cl_num);
	SimpleDateFormat sdt = new SimpleDateFormat("yyyy-mm-dd HH:ss");
%>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

<%//아이콘 용 추가 %>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"/>
<!-- Bootstrap-Iconpicker -->
<link rel="stylesheet" href="dist/css/bootstrap-iconpicker.min.css"/>

<!-- jQuery CDN -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- Bootstrap CDN -->
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap-Iconpicker Bundle -->
<script type="text/javascript" src="dist/js/bootstrap-iconpicker.bundle.min.js"></script>



<%//아이콘 용 추가 %>
  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/comment/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/comment/css/blog-post.css" rel="stylesheet">

</head>

<body>

        <!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">댓글 리스트 (<%=dao.getCount(mw_num, cl_num)%>)</h5>
          <div class="card-body">
            <form action="commentPro.jsp">
              <div class="form-group">
                <textarea name="comment" class="form-control" rows="3"></textarea>
                <input type="hidden" name="mw_num" value="<%=mw_num %>" />
                <input type="hidden" name="cl_num" value="<%=cl_num %>" />
              </div>
              <button type="submit" class="btn btn-primary" Style="float:right">댓글 작성</button>
            </form>
          </div>
        </div>

        <!-- Single Comment -->
		<%
			for(int i = 0; i<list.size(); i++){
				vo = list.get(i);
				if(vo.getState()==1){
					vo.setContent("<신고된 댓글입니다.>");
				}
		%>
			<jsp:include page="commentList.jsp">
				<jsp:param value="<%=vo.getId() %>" name="id"/>
				<jsp:param value="<%=vo.getContent() %>" name="content"/>
				<jsp:param value="<%=vo.getLike() %>" name="like"/>
				<jsp:param value="<%=vo.getHate() %>" name="hate"/>
				<jsp:param value="<%=sdt.format(vo.getReg()) %>" name="reg"/>
			</jsp:include>
		<%} %>






  </div>
  <!-- /.container -->
