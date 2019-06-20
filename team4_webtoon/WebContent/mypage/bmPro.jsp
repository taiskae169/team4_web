<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="webtoon.bookmark.BookmarkDAO" %> 
<%@page import="webtoon.episode.WTepVO" %> 




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<%
	BookmarkDAO DAObm=BookmarkDAO.getInstance();
	String bmid=(String)session.getAttribute("sessionID");
	int Ncl=Integer.parseInt(request.getParameter("cl_num"));
	int Nmw=Integer.parseInt(request.getParameter("mw_num"));	
	
	WTepVO info=null;
	DAObm.getInfo(Nmw);	
	System.out.println("WTepVO에서 info 가져오기 성공");
	
	String wtT=info.getMwTitle();
	System.out.println(wtT);
	
	String clT=info.getClTitle();
	System.out.println(clT);
	
	String wtW=info.getClWriter();
	System.out.println(wtW);
	
	
	//System.out.println(info);
	//WTepVO Ninfo=info;
	//System.out.println(Ninfo);
	
	
	
	//DAObm.addBMtoDB(info,Nmw,bmid,Ncl);
	//System.out.println("BookmarkVO에 등록 성공");

	//DAObm.addBMch(bmid,Nmw,Ncl);
	//System.out.println("like_check 테이블 bm_ch에 등록 성공");
	
%>

<script type="text/javascript">
function goBMpage(){
    if(confirm("책갈피에 등록되었습니다.확인하겠습니까?")){
        location.href = "/team4_webtoon/mypage/mypage.jsp";
        return true;
    } else {
    	location.href=document.referrer;
    	return false;
    }
}
</script>



</head>
<body>

</body>
</html>