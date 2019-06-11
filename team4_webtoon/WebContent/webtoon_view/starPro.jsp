<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="webtoon.episode.StarDAO" %>
<%@page import="webtoon.episode.StarVO" %>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="sVO" scope="page" class="webtoon.episode.StarVO">
   <jsp:setProperty name="sVO" property="*"/>
</jsp:useBean>
 
 <%
 	StarDAO sDAO=StarDAO.getInstance();
 	int star=Integer.parseInt(request.getParameter("starSelect"));
 	int sMN=Integer.parseInt(request.getParameter("mw_num"));
 	int sCN=Integer.parseInt(request.getParameter("cl_num"));
 	

 	sVO.setsStar_sum(star);	
 	sVO.setsMw_num(sMN);	
 	sVO.setsCl_num(sCN);	
 	sDAO.insertStar(sVO);
 	//response.sendRedirect("wt_view.jsp");
 
 %>
 <h2>별점 추가완료...</h2>