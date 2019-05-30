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
	
	
	int cmtNum;
	//코멘트 페이지 번호
	if(request.getParameter("cmtNum")==null){
		cmtNum=1;
	}else{
		cmtNum = Integer.parseInt(request.getParameter("cmtNum"));
	}
	
	// 코멘트 페이지 정보 초기값을 1로 설정
	
	int cmtSize = 3;
	//한페이지에 나올 코멘트 숫자 체크
	int startRow = (cmtNum -1) * cmtSize+1;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	//시작 번호
	int endRow = cmtNum *cmtSize;
	//끝번호 체크
	
	
	
	
	//시험용
		id = "admin";
		mw_num = "100";
		cl_num = "1";
	//시험용
	
	
	cmtVO vo = new cmtVO();
	cmtDAO dao = cmtDAO.getinstance();
	ArrayList<cmtVO>  list = dao.getList(mw_num, cl_num, startRow, endRow);
	SimpleDateFormat sdt = new SimpleDateFormat("yyyy-mm-dd HH:ss");
	
	int count = dao.getCount(mw_num, cl_num);
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

<script type="text/javascript" src="dist/js/bootstrap-iconpicker.bundle.min.js">
	
</script>

<script type="text/javascript">
	function r_che(){
		if(document.r_form.comment.value==""){
			
			alert("댓글을 입력해주세요");
			document.r_form.comment.focus();
			return false;
			
		}
	}
</script>


<%//아이콘 용 추가 %>
  <!-- Bootstrap core CSS -->
  <link href="/team4_webtoon/resources/comment/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/team4_webtoon/resources/comment/css/blog-post.css" rel="stylesheet">

</head>

<body>

        <!-- Comments Form -->
        <div class="card my-4" >
          <h5 class="card-header">댓글 리스트 (<%= count%>)</h5>
          <div class="card-body">
            <form action="commentPro.jsp" name="r_form" onsubmit="return r_che();">
              <div class="form-group">
                <textarea name="comment" class="form-control" rows="3"></textarea>
                <input type="hidden" name="mw_num" value="<%=mw_num %>" />
                <input type="hidden" name="cl_num" value="<%=cl_num %>" />
                <input type="hidden" name="id" value="<%=id %>" />
              </div>
              <button type="submit" class="btn btn-primary" Style="float:right">댓글 작성</button>
            </form>
          </div>
        </div>

        <!-- Single Comment -->
		<%
			for(int i = 0; i<list.size(); i++){
				vo = list.get(i);

		%>
			<jsp:include page="commentList.jsp">
				<jsp:param value="<%=vo.getNum() %>" name="num"/>
				<jsp:param value="<%=vo.getId() %>" name="id"/>
				<jsp:param value="<%=vo.getContent() %>" name="content"/>
				<jsp:param value="<%=vo.getLike() %>" name="like"/>
				<jsp:param value="<%=vo.getHate() %>" name="hate"/>
				<jsp:param value="<%=sdt.format(vo.getReg()) %>" name="reg"/>
				<jsp:param value="<%=cmtNum %>" name="cmtNum"/>
				<jsp:param value="<%=vo.getState() %>" name="state"/>
				<jsp:param value="<%=mw_num %>" name="mw_num"/>
				<jsp:param value="<%=cl_num %>" name="cl_num"/>
			</jsp:include>
		<%} %>

		<div style="text-align:center;">
		<%
			if(count>0){
				int pageCount = count /cmtSize + (count%cmtSize ==0 ? 0: 1);
				//전체 댓글/출력 댓글 갯수 + (나머지가 있는 경우에 +1)
				int pageBlock = 5;
				//한번에 5페이지씩 출력
				int startPage = (cmtNum/pageBlock)*10+1;
				//페이지가 5개가 넘어 갈 시 시작 페이지를 정해준다.
				int endPage = startPage+pageBlock-1;
				// 페이지 끝부분을 뜻함
				if(endPage>pageCount){ endPage = pageCount;}
				
				if(startPage>pageBlock){
		%>
				<a href="comment.jsp?cmtNum=<%= startPage - 10 %>">[이전]</a>
		<%		} 
				for(int i = startPage; i <= endPage; i++){%>
					<a href="comment.jsp?cmtNum=<%=i%>">[<%=i %>] </a>
				<%}
				if(endPage<pageCount){ %>
					<a href="comment.jsp?cmtNum=<%= startPage + 10 %>">[다음]</a>
		<%}
		
		}%>
		</div>
				
				
				

  </div>
  <!-- /.container -->
