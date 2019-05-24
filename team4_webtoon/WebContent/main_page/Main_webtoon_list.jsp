<%@page import="webtoon.list.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
		String title = request.getParameter("title");
		String sub_title = request.getParameter("sub_title");
		String writer = request.getParameter("writer");
		int star_point = Integer.parseInt(request.getParameter("star_point"));
		int i=0;
%>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#"><%=title %></a>
                </h4>
                <h5><%=sub_title %></h5>
                <p class="card-text"><%=writer %></p>
              </div>
              <div class="card-footer">
              	<%for(; i<star_point/20; i++){ %>
               	 	<small class="text-muted">&#9733;</small>
               	 	System.out.println(i);
                <%}
              	if(;i<5;i++){t %>
                	<small class="text-muted">&#9734;</small>
                <%} %>
              </div>
            </div>
          </div>

    <!-- Bootstrap core JavaScript -->
  <script src="/team4_webtoon/resources/Main_page/vendor/jquery/jquery.min.js"></script>
  <script src="/team4_webtoon/resources/Main_page/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  