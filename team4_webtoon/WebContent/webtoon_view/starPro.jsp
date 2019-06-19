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
 	int cltid=Integer.parseInt(request.getParameter("cl_title_id"));
 	String sId=request.getParameter("sId");
 	
 	

 	sVO.setsStar_sum(star);	
 	sVO.setsMw_num(sMN);	
 	sVO.setsCl_num(sCN);	
 	sDAO.insertStar(sVO);
 	//System.out.println("별점 매기기 완료");
 	
 	sDAO.updateContentStar(sCN);
 	//System.out.println("별점 content에 업데이트 완료");
 	
 	sDAO.updateMWStar(sMN);
 	//System.out.println("main_webtoon에 mw_star 웹툰 평균 별점 업데이트 완료");
 	
 	sDAO.addSrecord(sId,sMN,sCN);
 	//System.out.println("별점 like_check에 업데이트 완료");
 	
 	//response.sendRedirect("wt_view.jsp");
 
 %>
  <h2>별점 추가완료...</h2>
  <script>
 	location.href=document.referrer;
 </script>
