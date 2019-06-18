<%@page import="java.util.ArrayList"%>
<%@page import="webtoon.helpdesk.helpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1문의</title>

<script type="text/javascript">
	function chang1(obj){
		var value = obj.value;
		var cate1 = document.getElementById("forcate1");
		var cate2 = document.getElementById("forcate2");
		if(value==1){
			cate1.style.display ="block";
			cate2.style.display ="none";
		}else{
			cate1.style.display ="none";
			cate2.style.display ="block";
		}
	}

</script>

<LINK REL=StyleSheet HREF="../resources/register/css/register.css" TYPE="text/css" 	TITLE="register.css" MEDIA="screen,print">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">



<style>
	.forcategory1{
		display:none;
	}
	.forcategory2{
		
	}

</style>


<%
	helpDAO dao = helpDAO.getInstance();
	ArrayList<String> cateList = dao.getHelpCategory();

%>

</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto" style="margin-top:50px;">
        <div class="card card-signin flex-row my-5" >
          <div class="card-body">
            <h5 class="card-title text-center">1대1문의</h5>
            <form class="form-signin" action="/team4_webtoon/helpdesk/requestPro.jsp" method="post" enctype = "multipart/form-data">
              <div class="form-label-group" >
                <legend style="margin:auto;">제목</legend>
                <input type="text" id = "title" class="form-control"name = "title" required autofocus>                
              </div>
              <div class="form-label-group">
                <legend style="margin:auto;">내용</legend>
                <textarea id="content" class="form-control" name = "content" required> </textarea>
              </div>
              <legend>카테고리</legend>
              <select name="cat" class="form-control"  onchange="chang1(this);">
              <%for(int i =0;i<cateList.size();i++){ %>
              	<option value=<%=i %>><%=cateList.get(i) %></option> 
              <%} %>
              </select>
                <hr>
                <!-- 카테고리별  -->
              <div class="forcategory1" id="forcate1">
                <div class="form-label-group">
                	<legend>회사</legend>
	                <input type="text" id="company" class="form-control" name = "company" >
                </div>
			  </div>
			  
			  
			  <div>
                <div class="form-label-group">
	                <legend>이름</legend>
	                <input type="text" id="name" class="form-control" name = "name" />
	               	<legend>전화번호</legned>
	                <input type="tel" class="form-control" name="tel"  />
	                <legend>메일 </legned>
	                <input type="email" class="form-control" name="email"  />
	                <legend>첨부파일</legned>
	                <input type="file" class="form-control" name="file"/>
                </div>
			  </div>
			  <!-- 카테고리별  -->
			  
			  <button class="btn btn-default btn-warning btn-block text-uppercase" type="submit">확인</button>
			  
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>