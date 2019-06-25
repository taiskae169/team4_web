<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import = "webtoon.episode.WTepDAO" %>  
    
    
    <%     
    WTepDAO e = WTepDAO.getInstance();
	String Lid =(String)session.getAttribute("sessionID");
	int mN = Integer.parseInt(request.getParameter("wt_num"));		//웹툰 번호
	int Lch = Integer.parseInt(request.getParameter("ch"));				//0일시 미참여, 1일시 참여
    if(Lch==0){
    	e.addLove(Lid,mN); 
    	e.addMWview(mN);%>
   		<script>
   		location.href=document.referrer;
   		</script>
   	<%}else if(Lch==1){ 
   		e.deleteLove(Lid,mN);
   		e.deleteMWview(mN);%>
   		<script>
   		location.href=document.referrer;
   		</script>
   	<%}%>
    	
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>