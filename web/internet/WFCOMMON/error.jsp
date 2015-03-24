	<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %> 

<%@ page import="com.primeton.eos.wf.web.util.*" %>

<script>
	<%
	    String returnCode = EOSWebUtil.getBizAutomataReturnCode(request);
	    
	    
	    String title = WFErrorConfig.getConfigTitle(returnCode);
	    String content = WFErrorConfig.getConfigContent(returnCode);
	    
	    String info = title + "          "+  content;
	    
	 %>
	
//	window.alert("<%=info%>");
	window.showModalDialog("/internet/WFCOMMON/errorContent.jsp?errTitle=<%=title%>&errMsg=<%=content%>",window,"center:yes;scroll:no;dialogWidth:300px;dialogHeight:100px;help:no;status:no;");
	history.go(-1);

</script>



