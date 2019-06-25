<%
	String uri = request.getRequestURL().toString();
	

	String para = request.getQueryString();
	if(para==null){
		session.setAttribute("se_url", uri);
	}else{
		String url = uri + "?" + para;
		session.setAttribute("se_url", url);
	}
	
	
	
	
	System.out.println((String)session.getAttribute("se_url"));

%>

