<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="webtoon.bookmark.BookmarkDAO" %> 
<%@page import="webtoon.episode.WTepVO" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
if(confirm("책갈피에 등록되었습니다.확인하겠습니까?")){
	location.href = "/team4_webtoon/mypage/mypage.jsp";
    return true;
   } else {}
   location.href=document.referrer;
   return false;
</script>

<%
	BookmarkDAO DAObm=BookmarkDAO.getInstance();
	String bmid=(String)session.getAttribute("sessionID");
	System.out.println(bmid);
	
	int Ncl=Integer.parseInt(request.getParameter("cl_num"));
	System.out.println(Ncl);
	
	int Nmw=Integer.parseInt(request.getParameter("mw_num"));	
	System.out.println(Nmw);
			
	WTepVO info=null;
	info=DAObm.getInfo(Nmw,Ncl);	
	System.out.println("WTepVO에서 info 가져오기 성공");
	
	String wtT=info.getMwTitle();
	System.out.println(wtT);
	
	String clT=info.getClTitle();
	System.out.println(clT);
	
	String wtW=info.getClWriter();
	System.out.println(wtW);


	DAObm.addBMtoDB(bmid,Nmw,Ncl,wtT,clT,wtW);
	System.out.println("BookmarkVO에 등록 성공");
	
	
	System.out.println("[시작] like_check 테이블 bm_ch에 등록 시작");
	DAObm.addBMch(bmid,Nmw,Ncl);
	System.out.println("[끝] like_check 테이블 bm_ch에 등록 끝");
	
	
	
%>

	<meta http-equiv="Refresh" content="0;url=/team4_webtoon/webtoon_view/viewerPage.jsp?mw_num=<%=Nmw%>&cl_num=<%=Ncl %>" >


</head>
<body>

</body>
</html>