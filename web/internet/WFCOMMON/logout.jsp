<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<%
	session.invalidate();
	response.sendRedirect("/internet/WFCOMMON/login.jsp");
%>