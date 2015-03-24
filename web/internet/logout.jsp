<!-- saved from url=(0022)http://internet.e-mail -->
<%@include file="/internet/common.jsp"%>
<%
	String model = (String)session.getAttribute("model");
	if( model==null ) model = "normal";
	String port = (String)session.getAttribute("port");
	
	String loginURL = "http://192.168.0.204:8081/preview/gzswdx/index.htm";//(String)session.getAttribute("loginURL");
	
	session.invalidate();

	if (loginURL==null || loginURL.equals("")){
		response.sendRedirect("/internet/login.jsp?model="+model+"&port="+port);	
	}else{
		response.sendRedirect(loginURL);	
	}
	
%>