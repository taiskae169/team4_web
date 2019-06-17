<%request.setCharacterEncoding("UTF-8"); %> 
<%@page import="webtoon.list.*"%>
<%@page import="webtoon.notice.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
		String id1 = (String)session.getAttribute("sessionID");
		String title = request.getParameter("title");
		String sub_title = request.getParameter("subtitle");
		String writer = request.getParameter("writer");
		int star_point = Integer.parseInt(request.getParameter("star_point"));
		String num = request.getParameter("num");
		// 전송받은 항목을 각 변수에 대입
		int i=0;
		// 별점 출력을 위한 i 변수 생성

%>
          <div class="col-lg-4 col-md-6 mb-5">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="/team4_webtoon/resources/image/webtoon/thumbnail/<%=title%>_som.jpg" alt=""></a>
              <%//리스트 페이지 완성시 링크 변경 필요 %>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="/main_wt/main_wt.jsp?mw_num=<%=num%>"><%=title %></a>
                  <%//리스트 페이지 완성시 링크 변경 필요 %>
                </h4>
                <h5><%=sub_title %></h5>
                <p class="card-text"><%=writer %></p>
                
                <form method = "post" action = "../like/like.jsp">
                	<input type = "hidden" name = "lwb_wb_num" value = "<%=num %>">
                	<input type = "hidden" name = "lwb_id" value = "<%= id1%>">
                	<input type = "submit" value = "찜">
                </form>
                
              </div>
              <div class="card-footer">
              	<%for(; i<star_point/20; i++){ %>
              	<!-- 별점을 받아 출력된 n개 만큼 출력 -->
               	 	<small class="text-muted">&#9733;</small>
                <%}
              	for(;i<5;i++){ %>
                	<small class="text-muted">&#9734;</small>
                	<!-- n개 이후 빈별을 출력 -->
                <%} %>
                

              </div>
            </div>
          </div>

    <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/Main_page/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/Main_page/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  