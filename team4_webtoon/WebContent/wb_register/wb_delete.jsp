<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "search.*" %>
<%@ page import = "java.io.File" %>
<%@ page import = "webtoon.like.*" %>
<%@ page import = "webtoon.content.*" %>

<%

	String id1 = (String)session.getAttribute("sessionID");
String title = (String)session.getAttribute("sessionTitle");
int num = (int)session.getAttribute("sessionnum");
String writer = (String)session.getAttribute("sessionwriter");
	
	
	
	SearchDAO a = SearchDAO.getInstance();
	int check1 = a.deleteWB(title, writer);
	
	likeDAO dao = likeDAO.getInstance();
	contentDAO cdao = contentDAO.getInstance();
	String path = request.getRealPath("resources/image/webtoon/" + title);
	
	File Folder = new File(path);

	if(check1 == 1){
		dao.deleteLikeall(num);
		cdao.deleteall(num);

	Folder.delete();

}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹툰 삭제</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>

<LINK REL=StyleSheet HREF="../resources/login/css/login.css" TYPE="text/css" 	TITLE="login.css" MEDIA="screen,print">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

</head>
<body onload="begin()">

  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto" style="margin-top:300px">
        <div class="card card-signin my-5"><br>
          <div class="card-body">
            <h5 class="card-title text-center">웹툰이 삭제되는 중입니다. </h5>

         	     <p class="text-center">잠시만 기다려 주세요</p>   
              <br>
              


          </div>

        </div>

      </div>
      
    </div>

  </div>
  
</body>
</html>	
<meta http-equiv="Refresh" content="1;url=myWebtoon.jsp" >

