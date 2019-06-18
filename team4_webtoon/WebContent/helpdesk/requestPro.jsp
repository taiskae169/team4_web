<%@page import="webtoon.helpdesk.ToadminDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>


<%
	request.setCharacterEncoding("UTF-8");

	int size = 100* 1024*1024; 	//기본단위가 byte이므로 10M
	String saveDir = request.getRealPath("/resources/proposal");
	String enc="UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, saveDir, size, enc, dp);
	
	
	String company = "";
	String name = "";
	String tel = "";
	String mail = "";
	String filename ="";
	ToadminDAO dao = ToadminDAO.getInstance();
	
	
	try{
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		int category = Integer.parseInt(mr.getParameter("cat"));
		if(category==1){											
			company = mr.getParameter("company");
			name = mr.getParameter("name");
			tel = mr.getParameter("tel");
			mail = mr.getParameter("email");
			filename = mr.getFilesystemName("file");
			dao.setdetail(title, content, category, company, name, tel, mail, filename);
			
		}else{
			name = mr.getParameter("name");
			tel = mr.getParameter("tel");
			mail = mr.getParameter("email");
			filename = mr.getFilesystemName("file");
			dao.setdetail(title, content, category, name, tel, mail, filename);
		}
		//카테고리가가 사업관련일 경우에만 회사 입력이 들어간다.
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("/team4_webtoon/helpdesk/helpdesk.jsp");
%>