<%@include file="/internet/common.jsp"%>
<%
String recordIDs = request.getParameter("recordID");
int recordID = 0;
if(recordIDs!=null)
   recordID = Integer.parseInt(recordIDs);
   
	
%>