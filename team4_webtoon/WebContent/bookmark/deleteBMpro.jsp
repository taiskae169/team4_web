<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="webtoon.bookmark.BookmarkDAO" %>    
 <%@ page import = "webtoon.bookmark.BookmarkVO" %> 
 <%@ page import = "java.util.List" %>       
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
		String id_dbmk=(String)session.getAttribute("sessionID");
		String [] chkArr =request.getParameterValues("chk");
		BookmarkDAO bDAO=BookmarkDAO.getInstance();
		
		
		List<BookmarkVO>dbmk=null;
		
		for(int i=0;i<chkArr.length;i++){
			dbmk=bDAO.getdBmkInfo(chkArr[i],id_dbmk);
			BookmarkVO bmk=(BookmarkVO)dbmk.get(0);
			int Mn=bmk.getBmWNum();
			int Cn=bmk.getBmCNum();
			bDAO.deleteBkch(id_dbmk,Mn,Cn);
			bDAO.deleteBookmark(chkArr[i], id_dbmk);
		}
		
		
		
		
		
		
		
		
		
		// BookmarkVO bmk=(BookmarkVO)dbmk.get
		
		//BookmarkVO bmkD=null;
		//bmkD= bDAO.getdBmkInfo(chkArr,id_dbmk);
	
		
		
		//bDAO.deleteBkch(chkArr,id_dbmk);
%>

<script type="text/javascript">
location.href=document.referrer;
</script>


</head>
<body>

</body>
</html>