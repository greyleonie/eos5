<%
	try{
		talent.core.NetCenter netCenter = new talent.core.NetCenter();
		 netCenter.export(pageContext);
	
	}catch(Exception e) {
		e.printStackTrace();
	}
	
%>