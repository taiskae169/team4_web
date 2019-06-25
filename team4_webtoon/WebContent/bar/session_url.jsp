<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String uri = request.getRequestURL().toString();
	//url 주소 저장
	String para = request.getQueryString();
	//파라미터 값 저장
	if(para==null){
		session.setAttribute("se_url", uri);
		//파라미터가 없다면 바로 uri를 저장
	}else{
		String url = uri + "?" + para;
		session.setAttribute("se_url", url);
		//파라미터가 있을 시 ?를 추가하여 전체 url을 저장
	}

%>

